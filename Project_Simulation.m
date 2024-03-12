clc;
clear all;
%syms U q R z;
%(4*pi*8.85*10^-12)*
R = 1;
%z = 0:0.01:10;
q = 16*(10^(-19))*(3*10^9);
m = 0.5*9*10^(-28);
 

dt = 0.000001; %5e-6
z = 10;
v = 0;
t = 0;
theta = linspace(0, -pi, 100);

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
title(sprintf('%.2f', z));
hold off;


subplot(222);
potential = animatedline();
potential.Color = 'red';
potential.LineWidth = 1;
%potential = plot(z, U, 'MarkerSize', 20, 'Color', 'b', 'EraseMode', 'none');
axis([0 z -3.5e-19 0]);
ax = gca;
ax.XTick = -1:1:z;
ax.YTick = -3.5e-19:1e-19:0;
xlabel('z');
ylabel('U (J)');
box on;

subplot(224);
Force = animatedline();
Force = animatedline();
Force.Color = 'black';
Force.LineWidth = 1;
axis([0 z -2e-19 8e-19]);
ax = gca;
ax.XTick = -1:1:z;
ax.YTick = -2e-19:2e-19:8e-19;
xlabel('z');
ylabel('F (N)');
box on;


while true
    t = t+dt;
    F = -(-(q^2*(z/(R^2 + z^2)^(1/2) + 1)*((8*R^2)/(R + z + (R^2 + z^2)^(1/2))^3 + ((1/(R^2 + z^2)^(1/2) - z^2/(R^2 + z^2)^(3/2))*((4*R^2)/(R + z + (R^2 + z^2)^(1/2))^2 - 2))/(z/(R^2 + z^2)^(1/2) + 1)^2))/(2*((4*R^2)/(R + z + (R^2 + z^2)^(1/2))^2 - 2)));
    a = F/(10*m);
    v = v + a*dt;
    z = z + v*dt;
    U = (q^2/2)*log((2-4*R^2/(R+z+sqrt(R^2+z^2))^2)/(1+z/sqrt(R^2+z^2)));
    subplot(2, 2, [1 3]);
    title(sprintf('z = %.2f, t = %.6f', z, t));
    set(show, 'YData', z, 'markersize', 20);
    addpoints(potential, z, U);
    addpoints(Force, z, F);

    pause(0.0001)

    if z < -1
        break;
    end
    
    if t > 0.005
        break;
    end
end

