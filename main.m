data_x = [-1,1,5];
data_y = [1,5,11];
learning_rate = 0.1;
N = 3;
c_i = 0;
m = 2;
eata = 0.01;
c = [];
rss = [];

i=0;
while(i<50)
  der = find_derivative_of_rss(data_y,data_x,m,c_i,N);
  rss_i = find_rss(data_y,m,data_x,c_i);
  
  if (i>1 && rss(end) < rss_i)
    fprintf("Optimal c is %d\n",c_i);
    break;
  else
    rss(end+1) = rss_i;
    c(end+1) = c_i;
    c_i = c_i - (eata*der);
    i++;
  end
end

plot(c,rss,"-x");