%NEULER  Método de Euler para ED/PVI.
%   y = NEuler(f,a,b,n,y0) Método numérico para a resolução de um PVI
%   y'= f(t,y) com t=[a, b] e y(a)=y0 condição inicial  
%
%INPUT:
%   f - função do 2.º membro da Equação Diferencial
%   [a, b] - extremos do intervalo da variável independente t
%   n - número de subintervalos ou iterações do método
%   y0 - condição inicial t=a -> y=y0
%OUTPUT: 
%   y - vector das soluções aproximações
%   y(i+1) = y(i)+h*f(t(i),y(i)) , i =0,1,...,n-1
%
% Autor: Arménio Correia  | armenioc@isec.pt
%   Ana Rita Conceição Pessoa - 2023112690
%   João Francisco de Matos Claro - 2017010293
%
%   13/03/2024

function y = NEuler(f,a,b,n,y0)
h = (b-a)/n;
y = zeros(1,n+1);
t = a:h:b;
t(1) = a;
y(1) = y0;
for i=1:n
    y(i+1)=y(i)+h*f(t(i),y(i));
    t(i+1)=t(i)+h;
end
