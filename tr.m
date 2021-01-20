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