dt = 0.000001; %5e-6
z = 10;
v = 0;
t = 0;
R = 1;
m = 9*10^(-28);
q = 16*(10^(-19))*(3*10^9);
theta = linspace(0, 2*pi, 100);

subplot(2, 2, [1 3]);
figure(1);
hold on
show = plot(t, z, '.');
plot(R*cos(theta), R*sin(theta), 'Color', 'b', 'LineWidth', 2);
axis([-6 6 -2 12]);
ax = gca;
ax.XTick = -6:2:6;
ax.YTick = -2:2:12;
x0=200;
y0=100;
width=1180;
height=600;
set(gcf,'position',[x0,y0,width,height]);
box on;
xlabel('x');
ylabel('z');
hold off;


subplot(224);
Force = animatedline();
Force = animatedline();
Force.Color = 'black';
Force.LineWidth = 1;
axis([0 10 -4e-16 1e-16]);
ax = gca;
ax.XTick = -1:1:10;
ax.YTick = -4e-16:1e-16:1e-16;
xlabel('z');
ylabel('F');
box on;

while true
    t = t+dt;
    F = -(q^2*R*z)/((z^2-R^2)^2);
    a = F/(10*m);
    v = v + a*dt;
    z = z + v*dt;
    subplot(2, 2, [1 3]);
    title(sprintf('%.2f', z));
    set(show, 'YData', z, 'markersize', 20);
    addpoints(Force, z, F);
    pause(0.01);
    
    if z < 1
        break;
    end

end