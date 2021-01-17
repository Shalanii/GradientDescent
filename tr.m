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