#find the residual sum of squares when [m]ax1,[c]ax1 y(1xn)  x(1xn) 
function rss = find_rss(target,m,x,c,N)
  i=1;
  rss = [];
  k = [1,1,1];
  m1 = m(1);
  c1 = c(1);
  while(i<N)
    err = target(i)-((m1*x(i))+c1);
    #err = err.^2;
    rss(end+1) =err;
  end
end

/* fprintf("DER_C ");
  disp(der_c);
  if abs(der_c*eata)<0.2
    stop=1;
  endif