function der = find_derivative_of_rss_to_m(target_y,x,m,c,N)
  i = 1;
  sum_er = 0;
  while(i<N+1)
    errors = (target_y(i) -((m*x(i))-c))*x(i);
    sum_er = sum_er+errors;
    i++;
  end
  der = (-2/N)*sum_er;
  #der = 3;
end