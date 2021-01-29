x = [13.3873;   -1.5088;    5.0296;    1.8883;   17.0429;    8.7974;    2.4249;    2.6545;   12.2443;    1.3280];
y = [13.7438;    1.8417;    5.4385;    4.3868;   17.3967;    9.6155;    5.3102;    5.5157;   15.4852;    3.6847];
X = [ones(size(x,1),1) x];
thetas = [0 0];
N =size(x,1);
initial_cost = get_mse(X,y,thetas,N);
[step_c,step_m] = calculate_stepsizes(X,y,thetas,N);
count = 0;
eata = 0.01;
mse_array = [initial_cost];
m_array = [thetas(2)];
c_array = [thetas(1)];
stop = 0;
final_step_m = 5;
final_step_c = 5;
step_threshold = 0.1;
num_iter = 200;
batch_size = 5;
x_batch = ones(batch_size,2);
y_batch = ones(batch_size,1);
optimal_c_decided = 0;
optimal_m_decided = 1;
optimal_c = 0;
optimal_m = 0;
while(stop==0)
  count = count+1;
  
  for i=1:batch_size
    n = randi(N);
    x_batch(i,2)=x(n);
    y_batch(i,1)=y(n);
  endfor
  
  [step_c,step_m] = calculate_stepsizes(x_batch,y_batch,thetas,batch_size);
  thetas(1) = thetas(1)- (eata*step_c);
  thetas(2) = thetas(2) - (eata*step_m);
  mse_array(end+1) = get_mse(X,y,thetas,N);
  c_array(end+1) = thetas(1);
  m_array(end+1) = thetas(2);  
  
  if abs(step_c)<step_threshold && optimal_c_decided==0
    final_step_c = step_c;
    optimal_c = thetas(1);
    optimal_c_decided = 1;
  endif
 
  if abs(step_m)<step_threshold && optimal_m_decided==0
    final_step_m = step_m;
    optimal_m = thetas(2);
    optimal_m_decided = 1;
 endif
 
   if count>num_iter || (optimal_c_decided==1 && optimal_m_decided==1)
      stop=1;
   endif
  
end
fprintf("Threshold = %f\tNumber of iterations to converge = %d\n",step_threshold,count);

z=get_mse_matrix(X,y,c_array,m_array,N);
figure();
surf(m_array,c_array,z);

predicted = (thetas(2)*x)+thetas(1);
figure();
plot([0:count],mse_array);
title("Variation of cost with the iterations");
figure();
plot(x,y,'x');
hold on
plot(x,predicted);
hold on
title("Actual and Predicted");
figure();
plot([1:size(m_array,2)],m_array,'r.');
hold on
plot([1:size(c_array,2)],c_array,'g.');
title("Variation of m and c");
xlabel('Iterations');
ylabel('Value');
legend('m','c');
disp(thetas);
disp(mse_array(end));
