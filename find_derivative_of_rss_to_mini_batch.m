function der = find_derivative_of_rss_to_mini_batch(target_y,x,m,c,start_index,batch_size)  i = start_index;  sum_er = 0;  while(i<start_index+batch_size)    errors = (target_y(i) -((m*x(i))+c))*x(i);    sum_er = sum_er+errors;    i++;  end  der = (-2/N)*sum_er;  #der = 3;end