function [step_m,step_c] = calculate_stepsizes(X,y,thetas,n)
  sum_m = 0;
  sum_c = 0;
  for i=1:n
    sum_m = sum_m + (y(i,1)-thetas(2)*X(i,2) - thetas(1));
    sum_c = sum_c + ((y(i,1)-thetas(2)*X(i,2) - thetas(1))*X(i,2));
  endfor
  step_c = (-1/n)*sum_c;
  step_m = (-1/n)*sum_m;
end