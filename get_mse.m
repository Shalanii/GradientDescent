function mse = get_mse(X,y,thetas,n)
  e = y - (X*transpose(thetas));
  mse = sum((1/(2*n))*(e.^2));
end