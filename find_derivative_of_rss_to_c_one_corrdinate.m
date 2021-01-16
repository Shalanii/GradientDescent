function der = find_derivative_of_rss_to_c_one_coordinate(target_y,x,m,c,N)
  errors = target_y -((m*x)+c);
  der = (-2)*sum(errors);
  #der = 3;
end