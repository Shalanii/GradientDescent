function rss = find_rss4(target_y,m,x,c,N)
  i=1;
  rss = 0;
  while(i<=N)
    err = ((m*x(i))+c)-target_y(i);  
    rss = rss + err.^2; 
    i=i+1;
  endwhile 
end
