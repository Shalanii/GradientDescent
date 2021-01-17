function A = find_rss4(target_y,m,x,c)
  A = zeros(size(m,2),size(c,2));
  i=1;
  j=1;
  k=1;
  for m1 = m
    j=1;
    for c1 = c
      er_sum = 0;
      i = 1;
      while(i<=size(x,2))
        err = target_y(i)-((m1*x(i))+c1);
        er_sum = er_sum+err.^2;
        i = i+1;
      end
      A(j,k)=er_sum/size(x,2);
      j =  j+1;
    endfor
    k = k+1;
  endfor
end
