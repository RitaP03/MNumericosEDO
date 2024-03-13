%AdamBashford  Método de Adams-Bashforth para ED/PVI.
%
%   y = AdamBashford(f,a,b,n,y0) 
%   Método de 2 passos numérico para a resolução de um PVI
%   y'= f(t,y) com t=[a, b] e y(a)=y0 condição inicial  
%
%INPUT:
%   f - função do 2.º membro da Equação Diferencial
%   [a, b] - extremos do intervalo da variável independente t
%   n - número de subintervalos ou iterações do método
%   y0 - condição inicial t=a -> y=y0
%OUTPUT: 
%   y - vector das soluções aproximações
%   y(i+2)=y(i+1)+(3/2)*f(t(i+1),y(i+1))-(1/2)*h*f(t(0),y(0));
%
% Autor: Arménio Correia  .: armenioc@isec.pt
%   Ana Rita Conceição Pessoa - 2023112690
%   João Francisco de Matos Claro - 2023112690
%
%   13/03/2024

function y = AdamBashford(f,a,b,n,y0)
h = (b-a)/n;
t = zeros(n+1);
t(1) = a;
y(1) = y0;
y(2) = NEuler(f,a,a+h,n,y0);
for i=1:n
    y(i+2)=y(i+1)+(3/2)*f(t(i+1),y(i+1))-(1/2)*h*f(t(0),y(0));
    t(i+1)=t(i)+h;
    t(i+2)=t(i+1)+h;
end