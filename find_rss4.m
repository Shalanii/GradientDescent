function rss = find_rss4(target_y,m,x,c,N)
  i=1;
  rss = 0;
  while(i<=N)
    %fprintf("y(i) %d ",target_y(i));
    err = ((m*x(i))+c)-target_y(i);  
    rss = rss + err.^2; 
    i=i+1;
  endwhile 
  %fprintf("m %d c %d rss %d",m,c,rss);
end
