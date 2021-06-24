% przedzialy
[X,Y] = meshgrid(-3:0.1:3,-4:0.1:4);
% funkcja
Z = sin(X) .* cos(Y);
% wykres
surf(X,Y,Z)
% podpis OX
xlabel('x');
% podpis OY
ylabel('y');
% podpis OZ
zlabel('z');
% tytul
title('Z=sin(X)*cos(Y)');
