function der = find_derivative_of_rss_to_c(target_y,x,m,c,N)
  i = 1;
  sum_er = 0;
  while(i<=N)
    errors = (((m*x(i))+c)-target_y(i));
    sum_er = sum_er+errors;
    i++;
  end
  der = (1./N)*sum_er;
end