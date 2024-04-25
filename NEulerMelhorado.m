%   EULER MELHORADO - Método de Euler melhorado/Modificado para PVI
%   y = EulerMelhorado(f,a,b,n,y0) Método numérico para a resolução de um PVI
%   y' = f(t,y), Equação Diferencial
%   t = [a,b]
%   y(a) = y0, cI (condição inicial)
%
%INPUTS:
%   f - função do 2.º membro da Equação Diferencial
%   [a,b] - extremos do intervalo da variável independente t
%   n - número de subintervalos ou iterações do método
%   y0 - condição inicial t=a -> y=y0
%
%OUTPUTS:
%   y - vector das aproximações discretas da solução exacta
%   y(i+1) = y(i)+(h/2)*(f(t(i),y(i))+h*f(t(i),y(i))), i = 0,1,2,...,n-1
%
%   Trabalho realizado por:
%   Ana Rita Conceição Pessoa - 2023112690
%   João Francisco de Matos Claro - 2017010293

function [t, y] = NEulerMelhorado(f,a,b,n,y0)
h = (b-a)/n;
t = a:h:b;

y = zeros(1,n+1);
y(1) = y0;

for i=1:n
    y(i+1) = y(i)+(h/2)*(f(t(i),y(i))+h*f(t(i),y(i)));
end