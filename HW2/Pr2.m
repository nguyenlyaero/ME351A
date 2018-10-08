tVec=linspace(0,pi,500);
xVec=-log(-1/2.*sin(2.*tVec)+1);
yVec=-tVec;

[X,Y]=meshgrid(xVec, yVec);
T=-X+(Y+1).^2;

figure;
hold on;
[C,h] = contourf(X,Y,T,500);
set(h,'LineColor','none');
colorbar;
plot(xVec, yVec, 'k--', 'LineWidth', 1);
xlabel('x'); ylabel('y');
hold off;