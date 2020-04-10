% Khoang cach 2 banh
l = 10;
% Ban kinh banh xe
r = 3;
% Thoi gian lay mau
dt = 0.05;

x = [0];
y = [0];
theta = [0];
alpha1 = pi/2;
alpha2 = pi / 2 + 2 * pi / 3;
alpha3 = pi / 2 + 4 * pi / 3;
%Hinh tam giac
w1 = [-5, -5, 10];
w2 = [0,  5, -5];
w3 = [5,  0, -5];

%Hinh zigzac
%w1 = [-5,  5, -5,  5];
%w2 = [0,  -5,  0, -5];
%w3 = [5,   0,  5,  0];

%Hinh vuong
%w1 = [-10,   0,  10,  0];
%w2 = [ 5,    5,  -5, -5];
%w3 = [ 5,   -5,  -5,  5];


solanlap = [20,20,20];
k = 1;
%M = [sin(alpha1) sin(alpha2) sin(alpha3); -cos(alpha1) -cos(alpha2) -cos(alpha3);-1/l -1/l -1/l];
for i = 1 : length(w1)
    for j = 1 : solanlap(i)
        M = (r / 3) * [   -sin(alpha1 + theta(k)),       -sin(alpha2 + theta(k)),   -sin(alpha3 + theta(k));
                           cos(alpha1 + theta(k)),        cos(alpha2 + theta(k)),    cos(alpha3 + theta(k));
                           1 / l,                                  1 / l,                              1 / l];
        W = [w1(i);w2(i);w3(i)];
        u = M * W;
        Vx  = u(1);
        Vy  = u(2);
        w   = u(3);

        new_theta = theta(k) + w * dt;
        new_x = x(k) + Vx * dt;
        new_y = y(k) + Vy * dt;

        x = [x new_x];
        y = [y new_y];
        theta = [theta new_theta];
        k = k + 1;
    end
end
plot(x, y, '-o')
