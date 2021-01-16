data_x = [0,1,2,3,4,5,6,7,8,9,10];data_y = [1,3,5,7,9,11,13,15,17,19,21];N = 3;c_i = rand;m_i = (data_y(2)-data_y(1))/(data_x(2)-data_x(1));eata = 0.01;c = [];m = [];rss = [];i=0;stop = 0;count = 1;ideal_c = c_i;ideal_m = m_i;while(stop==0)  count = count+1;  der_c = find_derivative_of_rss_to_c(data_y,data_x,m_i,c_i,N);  der_m = find_derivative_of_rss_to_m(data_y,data_x,m_i,c_i,N);   fprintf("step_c = %d and step_m = %d",der_c,der_m);  if count>50 | abs(der_c)*eata<0.01 | abs(der_m)*eata<0.01    stop=1;    fprintf("Terminated");    ideal_c = c_i;    ideal_m = m_i;    fprintf("Optimal m is : %d\nOptimal c is : %d\n",ideal_m,ideal_c);
  endif    c_i = c_i - (eata*der_c);  m_i = m_i - (eata*der_m);  c(end+1) = c_i;  m(end+1) = m_i;  new_err = find_err(data_y,m_i,data_x,c_i);  disp("ERR ");  disp(new_err);    i++; endZ = find_rss4(data_y,m,data_x,c);minIntensityValue = min(Z(:));disp(minIntensityValue);contour(m,c,Z);hold on[~, minIdx] = min(Z(:)); [row,col] = ind2sub(size(Z),minIdx); xMin = m(col); yMin = c(row); disp(xMin);disp(yMin);hold on plot(xMin, yMin, 'rx');fprintf("Optimal m is : %d\nOptimal c is : %d\n",xMin,yMin);