%AdamBashford  Método de Adams-Bashforth para ED/PVI.

%   y = AdamBashforth(f,a,b,n,y0) 
%   Método de 2 passos numérico para a resolução de um PVI
%   y'= f(t,y) com t=[a, b] e y(a)=y0 condição inicial  

%INPUTS:
%   f - função do 2.º membro da Equação Diferencial
%   [a, b] - extremos do intervalo da variável independente t
%   n - número de subintervalos ou iterações do método
%   y0 - condição inicial t=a -> y=y0

%OUTPUTS: 
%   y - vector das soluções aproximações
%   y(i+2)=y(i+1)+(3/2)*h*f(t(i+1),y(i+1))-(1/2)*h*f(t(i),y(i));

% Autores: Arménio Correia  | armenioc@isec.pt
%          Ana Rita Conceição Pessoa .: a2023112690@isec.pt 
%          João Francisco de Matos Claro .: a21270422@isec.pt 
%
%   13/03/2024
function [t, y] = AdamBashforth(f,a,b,n,y0)

h = (b-a)/n;
t = a:h:b;

y = zeros(1,n+1);
t(1) = a;
y(1) = y0;

% Usa o Método de Euler para estimar o segundo valor de y
[~,yEuler] = NEuler(f,a,a+h,1,y0);
y(2) = yEuler(2);

% n-1 pontos pois calculamos i+2 a cada passo
for i=1:(n-1)
    y(i+2)=y(i+1)+(3/2)*h*f(t(i+1),y(i+1))-(1/2)*h*f(t(i),y(i));
end