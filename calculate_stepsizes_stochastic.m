function [step_m,step_c] = calculate_stepsizes_stochastic(X,y,ind,thetas)
   sum_m = y(ind,1)-thetas(2)*X(ind,2) - thetas(1);
   sum_c = (y(ind,1)-thetas(2)*X(ind,2) - thetas(1))*X(ind,2);
  step_c = (-1)*sum_c;
  step_m = (-1)*sum_m;
end