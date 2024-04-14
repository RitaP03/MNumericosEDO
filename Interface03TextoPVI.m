 % Interface de texto para os PVI
% Aplicação dos Métodos Numéricos de Euler e de Runge-Kutta
% Autor: Arménio Correia  .: armenioc@isec.pt
%  Ana Rita Conceição Pessoa - 2023112690 
%  João Francisco de Matos Claro - 2023112690 
% Data : 13/03/2024

clear
primeiraVez=1;
opcao=1;
%debugging%%
primeiraVez=0;
strF = "y+exp(3*t)";
f=@(t,y) eval(vectorize(strF));
a = 1;
b = 1.5;
n = 5;
y0 = 2;
%end debugging%%

while opcao ~= 9 
    clc
    disp('------- MÉTODOS NUMÉRICOS PARA PVI ------')
    disp(' ')
    if(~primeiraVez)
        fprintf('1. Introduzir Parâmetros do PVI\n')     
        fprintf('2. Método de Euler\n')
        fprintf('3. Método de Euler Melhorado\n')
        fprintf('4. Método de RK2\n')
        fprintf('5. Método de RK4\n')
        fprintf('6. ODE45\n')
        fprintf('7. Método de Adams-Bashford\n')
        fprintf('8. Solução Exata\n')
        fprintf('9. Terminar\n\n')
        opcao=input('Opção: ');
    else
        opcao=1;
    end
    
    switch opcao
        case 1
            syms y(t)
            strF=input('\nIntroduza a função f(t,y) = ','s');
            %f=@(t,y) eval(vectorize(strF));
            f= str2func(vectorize(strcat('@(t,y)', " ", strF)));
            while(1)
                try
                    %Limite inferior
                    strA = input('\nValor para a: ','s');
                    a = str2num(strA);
                catch
                    fprintf('Valor errado. Tente novamente');
                end
                if isscalar(a)
                    break;
                end
            end
            while(1)
                try
                    %Limite superior
                    strB = input('\nValor para b: ','s');
                    b = str2num(strB);
                catch
                    fprintf('Valor errado. Tente novamente');
                end
                if (isscalar(b) && b > a)
                    break;
                end    
            end
            while(1)
                try
                    %Numero de intervalos
                    strN = input('\nValor para n: ','s');
                    n = str2num(strN);
                catch
                    fprintf('Valor errado. Tente novamente');
                end
                if(isscalar(n) && n==floor(n) && n > 0)
                    break;
                end
            end
            while(1)
                try
                    strY0 = input('\nValor para y0: ','s');
                    y0 = str2num(strY0);
                catch
                    fprintf('Valor errado. Tente novamente');
                end
                if(isscalar(y0))
                    break;
                end
            end
        case 2 
            [t, y]=NEuler(f,a,b,n,y0);
            mostraGrafico("Euler", y, t);
        case 3
            [t, y]=NEulerMelhorado(f,a,b,n,y0);
            mostraGrafico("Euler Melhorado", y, t);
        case 4  
            [t, y]=RK2(f,a,b,n,y0); 
            mostraGrafico("RK2", y, t);
        case 5
            [t, y]=RK4(f,a,b,n,y0);
            mostraGrafico("RK4", y, t);
        case 6
            [t, y]=ode45(f, [a b], y0);
            mostraGrafico("ode45", y, t)
        case 7
            [t, y]=AdamBashford(f,a,b,n,y0);
            mostraGrafico("Adams-Bashfords", y, t);
        case 8
            [t, y]=sExata(strF,a,b,n,y0);
            mostraGrafico("Exata", y, t);
    end

    if(~primeiraVez)
        if opcao<=9
            if(opcao ~=9)
                fprintf('\nAproximações obtidas: \n');
                disp(table(t, y));
            end
            if opcao ~= 0
                input('\nPrima uma tecla para continuar ...');
            end
        else
            fprintf('\nOpção errada.');
            input('\nPrima para continuar');
        end
    else
        primeiraVez=0;
    end
end

function mostraGrafico(metodo, y, t)
    fprintf('Deseja visualizar o grafico? (y,n)\n');
    ch=input('Opção: ', 's');
    if strcmp(ch,'y')
        hold on
        plot (t,y, 'DisplayName', metodo);
        legend('location', 'best');
        xlabel('x');
        ylabel('y');
        hold off
        grid on
    else
        fprintf('\nIntroduza y ou n\n');
    end
end
