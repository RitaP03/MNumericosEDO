%NEULER M�todo de Euler para ED/PVI.

%   y = NEuler (f, a, b, n, y0) M�todo num�rico para a resolu��o de um PVI
%   y'= f(t,y) com t=[a, b] e y(a)=y0 condi��o inicial  
%

%INPUT:
%   f - fun��o do 2.� membro da Equa��o Diferencial
%   [a, b] - extremos do intervalo da vari�vel independente t
%   n - n�mero de subintervalos ou itera��es do m�todo
%   y0 - condi��o inicial t=a -> y=y0

%OUTPUT: 
%   y - vector das solu��es aproxima��es
%   y(i+1) = y(i)+h*f(t(i), y(i)) , i =0,1,...,n-1
%

% Autores: Arm�nio Correia  | armenioc@isec.pt
%          Ana Rita Concei��o Pessoa .: a2023112690@isec.pt 
%          Jo�o Francisco de Matos Claro .: a21270422@isec.pt 
%
%   02/04/2024


% Defini��o da fun��o NEuler que recebe: 
 % - uma fun��o f;
 % - os limites de integra��o a e b;
 % - o n�mero de passos n;
 % - o valor inicial y0. 
function [t, y] = NEuler (f, a, b, n, y0)   

% Calcula o tamanho do passo h com base nos limites de integra��o e no 
% n�mero de passos.
h = (b-a) /n;   

% Inicializa os vetores para armazenar os valores das vari�veis:
    % -> independentes (t) 
    % -> dependentes (y)
t = zeros(1, n);
y = zeros(1, n);
% come�ando com os valores iniciais.
t(1) = a;               
y(1) = y0;

% In�cio do loop para cada passo de integra��o.
for i = 1:n
   % Calcula as novas aproxima��es usando o M�todo de Euler e 
   % atualiza os valores de y e t para o pr�ximo passo. 
    y(i+1) = y(i)+h*f(t(i), y(i));
    t(i+1) = t(i)+h;
% Finaliza��o do loop.
end