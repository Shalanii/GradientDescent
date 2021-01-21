if  size(checked,2)~= size(data_x,2)
    ind = randi(size(data_x,2));
    tr = 0;
    while (tr==0)
      if ismember(ind,checked)
         ind = randi(size(data_x,2));
      else
         tr = 1;
         checked(end+1)=ind;
      endif
    end  
  else
    break;
  endif
  
  
   A = zeros(size(m,2),size(c,2));
  i=1;
  j=1;
  k=1;
  for m1 = m
    j=1;
    for c1 = c
      er_sum = 0;
      i = 1;
      while(i<=size(x,2))
        err = ((m1*x(i))+c1)-target_y(i);
        er_sum = er_sum+(err.^2);
        i = i+1;
      end
      A(j,k)=er_sum/N;
      j =  j+1;
    endfor
    k = k+1;
  endfor
  
  x = [17.7876,4.4820,23.8285,-0.5855,24.2197,8.5787,10.5677,8.8718,-0.3771];
y = [65.754,41.825,78.419,33.624,83.678,49.482,60.369,54.087,34.140];

  
  
 
 
 
while(stop==0)
  der_c1 = find_derivative_of_rss_to_c(data_y,data_x,m_i,c_i,N);
  der_m1 = find_derivative_of_rss_to_m(data_y,data_x,m_i,c_i,N); 
  
  c1 = c_i - (eata*der_c1);
  m1 = m_i - (eata*der_m1);
  cost1 = find_rss4(data_y,m1,data_x,c1,N);
  
  der_c2 = find_derivative_of_rss_to_c(data_y,data_x,m1,c1,N);
  der_m2 = find_derivative_of_rss_to_m(data_y,data_x,m1,c1,N);
 
 % c2 = c1 - 
 
  fprintf("der c1 %d der c2 = %d\nder_m1 = %d der m2 = %d\n",der_c1,der_c2,der_m1,der_m2); 
  
  if abs(der_c1)<abs(der_c2) || abs(der_c1)<abs(der_c2) || (der_c2>0 && der_c1<0) || (der_c1>0 && der_c2<0) || (der_m2>0 && der_m1<0) || (der_m1>0 && der_m2<0)
    eata = eata*0.9;
  else
    stop = 1;
  endif
  
  if eata<0.01
    stop = 1;
  endif
end
fprintf("Eata %d\n",eata);


STOCHASTIC
if count==1
    old_err = find_err(data_y,m_i,data_x,c_i);
  else
    new_err = find_err(data_y,m_i,data_x,c_i);
    fprintf("old %d new %d\n",old_err,new_err);
    if new_err>old_err
      %break;
      continue;
    else
      disp("ccc");
      c(end+1) = c_i;
      m(end+1) = m_i;
      old_err = new_err;
      
    endif
  endif