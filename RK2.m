%   RK2 - Método de Runge-Kutta de ordem 2

%   y = RK2(f,a,b,n,y0) Método numérico para a resolução de um PVI
%   y' = f(t,y), Equação Diferencial
%   t = [a,b]
%   y(a) = y0, cI (condição inicial)

%INPUTS:
%   f - função do 2.º membro da Equação Diferencial
%   [a,b] - extremos do intervalo da variável independente t
%   n - número de subintervalos ou iterações do método
%   y0 - condição inicial t=a -> y=y0

%OUTPUTS:
%   y - vector das aproximações discretas da solução exacta
%   y(i+1) = y(i)+h*f(t(i)y(i)), i = 0,1,2,...,n-1
 
%   Trabalho realizado por:
%   Ana Rita Conceição Pessoa - 2023112690
%   João Francisco de Matos Claro - 2017010293


% Esta linha define uma função chamada RK2 que aceita cinco argumentos de 
% entrada: 
% - f (a função diferencial a ser avaliada)
% - a (o limite inferior do intervalo)
% - b (o limite superior do intervalo)
% - n (o número de passos) 
% - y0 (o valor inicial)
function [t, y] = RK2(f,a,b,n,y0)

% Calcula o tamanho do passo h com base nos limites inferior e superior do 
% intervalo a e b, e no número de passos n
h = (b-a)/n;

% Gera um vetor t contendo os pontos discretos ao longo do intervalo de 
% a a b, com um espaçamento de h entre os pontos
t = a:h:b;

% Inicializa um vetor y de tamanho n+1 preenchido com zeros para armazenar 
% os valores da solução
y = zeros(1,n+1);

% Define o primeiro elemento do vetor y como o valor inicial y0
y(1) = y0;

% Inicia um loop que irá iterar de 1 até n, 
% representando cada passo do método de Runge-Kutta de segunda ordem
for i=1:n

    % Calcula o primeiro coeficiente k1 utilizando a derivada da função f 
    % no ponto t(i) e y(i)
    k1 = h*f(t(i),y(i));
  
    % Calcula o primeiro coeficiente k1 utilizando a derivada da função f 
    % no ponto t(i) e y(i)
    k2 = h*f(t(i+1),y(i)+k1);

    % Atualiza o valor de y(i+1) usando uma média ponderada dos 
    % coeficientes k1 e k2, que representa a solução no próximo ponto
    y(i+1) = y(i)+(k1+k2)/2;

end