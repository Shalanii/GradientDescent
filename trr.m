z=get_mse_matrix(X,y,c_array,m_array,N);
surf(m_array,c_array,z);
figure();
contour(m_array,c_array,z);
hold on
plot(m_array,c_array,z,'o');
hold on
plot(optimal_m,optimal_c,'x');
zz = (thetas(2)*x)+thetas(1);
figure();
plot(x,y,'x');
hold on
plot(x,zz);
title("Actual and Predicted for Threshold = 0.05");
figure();
plot([1:size(m_array,2)],m_array,'r.');
hold on
plot([1:size(c_array,2)],c_array,'g.');
xlabel('Iterations');
ylabel('Value');
legend('m','c');
disp(thetas);