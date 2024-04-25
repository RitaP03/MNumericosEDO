%NEULER Método de Euler para ED/PVI.

%   y = NEuler (f, a, b, n, y0) Método numérico para a resolução de um PVI
%   y'= f(t,y) com t=[a, b] e y(a)=y0 condição inicial  
%

%INPUT:
%   f - função do 2.º membro da Equação Diferencial
%   [a, b] - extremos do intervalo da variável independente t
%   n - número de subintervalos ou iterações do método
%   y0 - condição inicial t=a -> y=y0

%OUTPUT: 
%   y - vector das soluções aproximações
%   y(i+1) = y(i)+h*f(t(i), y(i)) , i =0,1,...,n-1
%

% Autores: Arménio Correia  | armenioc@isec.pt
%          Ana Rita Conceição Pessoa .: a2023112690@isec.pt 
%          João Francisco de Matos Claro .: a21270422@isec.pt 
%
%   02/04/2024
 
function [t, y] = NEuler (f, a, b, n, y0)   

% Calcula o tamanho do passo h com base nos limites de integração e no 
% número de passos.
h = (b-a) /n;   

% Inicializa os vetores para armazenar os valores das variáveis:
    % -> independentes (t) 
    % -> dependentes (y)
t = a:h:b;
y = zeros(1, n);
% começando com os valores iniciais.             
y(1) = y0;

% Início do loop para cada passo de integração.
for i = 1:n
   % Calcula as novas aproximações usando o Método de Euler e 
   % atualiza os valores de y e t para o próximo passo. 
    y(i+1) = y(i)+h*f(t(i), y(i));
% Finalização do loop.
end