function squared_err = find_rss(target,m,x,c)
  err=(target-((m*x)+c)).^2;
  squared_err = sum(err);
end