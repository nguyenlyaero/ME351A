A=2; dt=0.1; x0=0; y0=1; dx=0.1;

% Initial
Shape0=zeros(4,2);
Shape0(1,:)=[-dx y0];
Shape0(2,:)=[0 y0+dx];
Shape0(3,:)=[dx y0];
Shape0(4,:)=[0 y0-dx];

% Case a
VelAfun=@(loc) [-A.*loc(2)./(loc(1).^2+loc(2).^2) A.*loc(1)./(loc(1).^2+loc(2).^2)];
VelA=zeros(4,2);
for i=1:4
    VelA(i,:)=VelAfun(Shape0(i,:));
end
ShapeA=Shape0+dt.*VelA;
CenterA= [mean(ShapeA(:,1)) mean(ShapeA(:,2))];
ShapeAC=[ShapeA(:,1)-CenterA(1) ShapeA(:,2)-CenterA(2)+y0];

% Case b
VelBfun=@(loc) [-A.*loc(2) A.*loc(1)];
VelB=zeros(4,2);
for i=1:4
    VelB(i,:)=VelBfun(Shape0(i,:));
end
ShapeB=Shape0+dt.*VelB;
CenterB= [mean(ShapeB(:,1)) mean(ShapeB(:,2))];
ShapeBC=[ShapeB(:,1)-CenterB(1) ShapeB(:,2)-CenterB(2)+y0];

figure;
hold on;
xlim([-0.2 0.2]);
ylim([1-0.2 1+0.2]);
plot([Shape0(:,1); Shape0(1,1)], [Shape0(:,2); Shape0(1,2)]);
plot([ShapeAC(:,1); ShapeAC(1,1)], [ShapeAC(:,2); ShapeAC(1,2)]);
plot([ShapeBC(:,1); ShapeBC(1,1)], [ShapeBC(:,2); ShapeBC(1,2)]);
legend('Initial', 'Part A', 'Part B');
hold off;

