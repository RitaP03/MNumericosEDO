function [t, y] = sExata(f,a,b,n,y0)
h=(b-a)/n;
t=a:h:b;
syms y(x)
yExata = dsolve(diff(y,x)==f(x,y), ['y(',num2str(a),')=',num2str(y0)]);
g=@(x) eval(vectorize(char(yExata)));
y=g(t);
end