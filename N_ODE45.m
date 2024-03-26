% N_ODE45  M�todo N�merico para resolver um PVI: Fun��o ODE45 do MATLAB

%   y = N_ODE45(f,a,b,n,y0) M�todo num�rico para a resolu��o de um PVI

%INPUTS:
%   f - Fun��o da equa��o diferencial, em t e y
%   a - Limite esquerdo do intervalo
%   b - Limite direito do intervalo
%   n - Numero de sub-intervalos
%   y0 - Valor (condi��o) Inicial do PVI

%OUTPUTS: 
%   y - vetor das solu��es aproximadas

%   Trabalho realizado por:
%   Ana Rita Concei��o Pessoa - 2023112690
%   Jo�o Francisco de Matos Claro - 2017010293


% Esta linha define uma fun��o chamada N_ODE45 que recebe cinco argumentos: 
% - f, que � a fun��o que representa a equa��o diferencial
% - a e b, que s�o os limites do intervalo onde queremos resolver a equa��o
% - n, que � o n�mero de pontos no intervalo
% - y0, que � a condi��o inicial
function y = N_ODE45(f,a,b,n,y0)

% Esta linha calcula o tamanho de cada subintervalo h, 
% dividindo a diferen�a entre b e a pelo n�mero de pontos n.
    h = (b-a)/n;                      
    
    % Esta linha cria um vetor t 
    % com os pontos discretos ao longo do intervalo de a a b, 
    % com intervalo h.
    t = a:h:b;                        
    
    % Esta linha utiliza a fun��o ode45 do MATLAB 
    % para resolver numericamente a equa��o diferencial definida por f. 
    % Ela calcula a solu��o y para cada ponto em t, 
    % iniciando com a condi��o inicial y0.
    [~,y] = ode45(f, t, y0);  

    % Esta linha transp�e o vetor de solu��es y 
    % para que ele tenha a orienta��o correta, 
    % onde as colunas representam as vari�veis dependentes 
    % e as linhas representam os pontos no dom�nio de tempo.
    y = y';                            
end