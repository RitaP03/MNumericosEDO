% N_ODE45  Método Númerico para resolver um PVI: Função ODE45 do MATLAB

%   y = N_ODE45(f,a,b,n,y0) Método numérico para a resolução de um PVI

%INPUTS:
%   f - Função da equação diferencial, em t e y
%   a - Limite esquerdo do intervalo
%   b - Limite direito do intervalo
%   n - Numero de sub-intervalos
%   y0 - Valor (condição) Inicial do PVI

%OUTPUTS: 
%   y - vetor das soluções aproximadas

%   Trabalho realizado por:
%   Ana Rita Conceição Pessoa - 2023112690
%   João Francisco de Matos Claro - 2017010293


% Esta linha define uma função chamada N_ODE45 que recebe cinco argumentos: 
% - f, que é a função que representa a equação diferencial
% - a e b, que são os limites do intervalo onde queremos resolver a equação
% - n, que é o número de pontos no intervalo
% - y0, que é a condição inicial
function y = N_ODE45(f,a,b,n,y0)

% Esta linha calcula o tamanho de cada subintervalo h, 
% dividindo a diferença entre b e a pelo número de pontos n.
    h = (b-a)/n;                      
    
    % Esta linha cria um vetor t 
    % com os pontos discretos ao longo do intervalo de a a b, 
    % com intervalo h.
    t = a:h:b;                        
    
    % Esta linha utiliza a função ode45 do MATLAB 
    % para resolver numericamente a equação diferencial definida por f. 
    % Ela calcula a solução y para cada ponto em t, 
    % iniciando com a condição inicial y0.
    [~,y] = ode45(f, t, y0);  

    % Esta linha transpõe o vetor de soluções y 
    % para que ele tenha a orientação correta, 
    % onde as colunas representam as variáveis dependentes 
    % e as linhas representam os pontos no domínio de tempo.
    y = y';                            
end