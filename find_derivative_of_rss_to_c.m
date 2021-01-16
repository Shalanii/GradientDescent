function der = find_derivative_of_rss_to_c(target_y,x,m,c,N)
  errors = target_y -((m*x)+c);
  der = (-2/N)*sum(errors);
  #der = 3;
end