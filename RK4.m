%   RK4 - Método de Runge-Kutta de ordem 4

%   y = RK4(f,a,b,n,y0) Método numérico para a resolução de um PVI
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
%
%   Trabalho realizado por:
%   Ana Rita Conceição Pessoa - 2023112690
%   João Francisco de Matos Claro - 2017010293


% Esta linha define uma função chamada RK4 que recebe cinco argumentos: 
% - f, que é a função que representa a equação diferencial
% - a e b, que são os limites do intervalo onde queremos resolver a equação
% - n, que é o número de passos ou subdivisões desse intervalo
% - y0, que é a condição inicial
function [t, y] = RK4(f,a,b,n,y0)

% Esta linha calcula o tamanho de cada passo de tempo h, 
% dividindo a diferença entre b e a pelo número de passos n
h = (b-a)/n;

%  Esta linha cria um vetor t com os pontos discretos ao longo do intervalo
% de a a b, com intervalo h
t = a:h:b;

% Esta linha inicializa um vetor y com zeros, que terá o mesmo tamanho que 
% o vetor t mais um, para armazenar as soluções.
y = zeros(1,n+1);

% Esta linha define o primeiro elemento de y como a condição inicial y0
y(1) = y0;

% Este é um loop que itera de 1 até n, representando cada passo de tempo
for i=1:n

    % Calcula o valor de k1 
    % multiplicando o tamanho do passo h pela derivada da função f 
    % avaliada em (t(i), y(i))
    k1 = h*f(t(i),y(i));

    % Calcula o valor de k2 
    % multiplicando o tamanho do passo h pela derivada da função f 
    % avaliada em (t(i) + (h/2), y(i) + (1/2)*k1)
    k2 = h*f(t(i)+(h/2),y(i)+(1/2)*k1);

    % Calcula o valor de k3 
    % multiplicando o tamanho do passo h pela derivada da função f 
    % avaliada em (t(i) + (h/2), y(i) + (1/2)*k2)
    k3 = h*f(t(i)+(h/2),y(i)+(1/2)*k2);

    % Calcula o valor de k4 
    % multiplicando o tamanho do passo h pela derivada da função f 
    % avaliada em (t(i) + h, y(i) + k3)
    k4 = h*f(t(i)+(h/2),y(i)+(1/2)*k3);

    % Atualiza o valor de y para o próximo passo 
    % usando a média ponderada dos valores de k1, k2, k3 e k4.
    y(i+1) = y(i)+(1/6)*(k1+2*k2+2*k3+k4);

end