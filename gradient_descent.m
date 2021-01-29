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
step_threshold = 0.5;
optimal_c_decided = 0;
optimal_m_decided = 1;
optimal_c = 0;
optimal_m = 0;
num_iter = 1500;

figure();
while(stop==0)
  count = count+1;
  %fprintf("derivative of c = %d\tderivative of m = %d\n",step_c,step_m);
  hold on;
  [step_c,step_m] = calculate_stepsizes(X,y,thetas,N);
  thetas(1) = thetas(1)- (eata*step_c);
  thetas(2) = thetas(2) - (eata*step_m);
  mse = get_mse(X,y,thetas,N);;
  mse_array(end+1) = mse;
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

z=get_mse_matrix(X,y,c_array,m_array,N);
contour(m_array,c_array,z);
hold on
plot(m_array,c_array,z);
figure();
plot([0:count],mse_array);
title("Variation of cost with the iterations");
predicted = (thetas(2)*x)+thetas(1);
figure();
plot(x,y,'x');
hold on
plot(x,predicted);
title("Actual and Predicted");
figure();
plot([1:size(m_array,2)],m_array,'r.');
hold on
plot([1:size(c_array,2)],c_array,'g.');
xlabel('Iterations');
ylabel('Value');
legend('m','c');
disp(thetas);



