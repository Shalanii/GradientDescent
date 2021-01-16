#find the residual sum of squares when [m]ax1,[c]ax1 y(1xn)  x(1xn) 
function rss = find_rss2(target,m,x,c)
  i=1;
  j = 1;
  rss = [];
  disp(size(m,2));
  disp(size(target,2));
  
  while(j<=size(m,2))
    i = 1;
    er_sum = 0;
    while(i<=size(target,2))
      err = target(i)-((m(j)*x(i))+c(j));
      er_sum = er_sum+err^2;
      i = i+1;
    end
    rss(end+1) =er_sum;
    j = j+1;
  end
end