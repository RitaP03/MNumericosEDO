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
%   y(i+2)=y(i+1)+(3/2)*f(t(i+1),y(i+1))-(1/2)*h*f(t(0),y(0));

% Autores: Arménio Correia  | armenioc@isec.pt
%          Ana Rita Conceição Pessoa .: a2023112690@isec.pt 
%          João Francisco de Matos Claro .: a21270422@isec.pt 
%
%   13/03/2024


% Esta linha define uma função chamada AdamBashford que aceita:
% - uma função f
% - um intervalo [a, b]
% - o número de passos n 
% - o valor inicial y0
function [t, y] = AdamBashforth(f,a,b,n,y0)

% Calcula o tamanho do passo h 
% com base no intervalo [a, b] e no número de passos n
h = (b-a)/n;

% Pré alocação de memória
% Cria um vetor t contendo os pontos ao longo do intervalo [a, b] 
% com intervalo h
% Adams Bashforth retorna n+1 pontos
b = b+h;
t = a:h:b;

% Inicializa um vetor y com zeros para armazenar as soluções
y = zeros(1,n+1);

% Define os valores iniciais de t e y
t(1) = a;
y(1) = y0;

% Usa o Método de Euler para estimar o segundo valor de y
[~,yEuler] = NEuler(f,a,a+h,1,y0);
y(2) = yEuler(1);

% Inicia um loop que itera de 1 até n
for i=1:n
    y(i+2)=y(i+1)+(3/2)*f(t(i+1),y(i+1))-(1/2)*h*f(t(1),y(1));

    % % Atualiza os valores de t para o próximo passo
    % t(i+1)=t(i)+h;
    % t(i+2)=t(i+1)+h;
end