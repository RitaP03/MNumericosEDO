function [t, y] = sExata(f,a,b,n,y0)
sExata=dsolve(['Dy=', f], ['y(',num2str(a),')=',num2str(y0)]);
% sExata=dsolve(diff(f), ['y(',num2str(a),')=',num2str(y0)]);
g=@(t) eval(vectorize(char(sExata)));
h=(b-a)/n;
t=a:h:b;
y=g(t);