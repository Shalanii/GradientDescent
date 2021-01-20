function A = find_rss_for_m_c(target_y,m,x,c,N)
    A = zeros(size(m,2),size(c,2));
    i = 1;
    j = 1;
    for(m1 = m)
      j = 1;
      for(c1 = c)
          A(i,j) = find_rss4(target_y,m1,x,c1,N);
          j = j+1;
      endfor
      i = i+1;
    endfor
    %disp(A);
end
