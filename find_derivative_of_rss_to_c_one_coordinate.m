function der = find_derivative_of_rss_to_c_one_coordinate(target_y,x,m,c)
  errors = target_y -((m*x)+c);
  der = (-2)*errors;
end