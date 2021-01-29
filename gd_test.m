x = [13.3873;   -1.5088;    5.0296;    1.8883;   17.0429;    8.7974;    2.4249;    2.6545;   12.2443;    1.3280];
y = [13.7438;    1.8417;    5.4385;    4.3868;   17.3967;    9.6155;    5.3102;    5.5157;   15.4852;    3.6847];

X = [ones(size(x,1),1) x];
thetas = [0 0];
N =size(x,1);
initial_cost = get_mse(X,y,thetas,N);
[step_c,step_m] = calculate_stepsizes(X,y,thetas,N);
disp(step_c);
disp(step_m);
count = 0;
eata = 0.02;
mse_array = [initial_cost];
m_array = [thetas(2)];
c_array = [thetas(1)];
stop = 0;
final_step_m = 5;
final_step_c = 5;
while(stop==0)
  count = count+1;
  %fprintf("derivative of c = %d\tderivative of m = %d\n",step_c,step_m);
  if count>500 || (abs(final_step_c)<1 && abs(final_step_m)<1)
    stop = 1;
  endif
 
  [step_c,step_m] = calculate_stepsizes(X,y,thetas,N);
  thetas(1) = thetas(1)- (eata*step_c);
  thetas(2) = thetas(2) - (eata*step_m);
  mse_array(end+1) = get_mse(X,y,thetas,N);
  if abs(step_c)<0.1
    final_step_c = step_c;
  else
    c_array(end+1) = thetas(1);
  endif
 
  if abs(step_m)<0.1
    final_step_m = step_m;
  else
    m_array(end+1) = thetas(2);
  endif
  
end
fprintf("Learning rate = %f\tNumber of iterations to converge = %d\n",eata,count);

z=get_mse_matrix(X,y,c_array,m_array,N);
contour(m_array,c_array,z);
zz = (thetas(2)*x)+thetas(1);
figure();
surf(m_array,c_array,z);
figure();
plot(x,y,'x');
hold on
plot(x,zz);
%disp(thetas);

