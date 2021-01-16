function A = find_rss3(target,m,x,c)
  i=1;
  j = 1;
  k = 1;
  #rss = [];
  disp(size(m,2));
  disp(size(target,2));
  A = zeros(size(m,2),size(c,2));
  
  while(j<=size(m,2))
    fprintf("jj %d %d %d\n",i,j,k);
    while(k<=size(c,2))
      er_sum = 0;
      fprintf("kk %d %d %d\n",i,j,k);
      while(i<=size(target,2))
        fprintf("ii %d %d %d\n",i,j,k);
        err = target(i)-((m(j)*x(i))+c(k));
        er_sum = er_sum+err^2;
        i = i+1;
      end
    A(j,k) =er_sum;
    disp("x");
    k = k+1;
    end
    j = j+1;
  end
end