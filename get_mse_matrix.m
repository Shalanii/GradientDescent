function A = get_mse_matrix(X,y,c_array,m_array,n)
  A = zeros(size(c_array,2),size(m_array,2));
  for i=1:size(c_array,2)
    for j=1:size(m_array,2)
      thetas = [c_array(i),m_array(j)];
      e = y - (X*transpose(thetas));
      mse = sum((1/(2*n))*(e.^2));
      A(i,j)=mse;
    endfor
  endfor
end