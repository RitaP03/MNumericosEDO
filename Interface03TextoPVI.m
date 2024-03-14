% Interface de textp para os PVI
% Aplicação dos Métodos Numéricos de Euler e de Runge-Kutta
% Autor: Arménio Correia  .: armenioc@isec.pt
%  Ana Rita Conceição Pessoa - 2023112690 
%  João Francisco de Matos Claro - 2023112690 
% Data : 13/03/2024

clear
primeiraVez=1;
opcao=1;
while opcao ~= 9 
    clc
    disp('------- MÉTODOS NUMÉRICOS PARA PVI ------')
    disp(' ')
    if(~primeiraVez)
        fprintf('1. Introduzir Parâmetros do PVI\n')     
        fprintf('2. Método de Euler\n')
        fprintf('3. Método de Euler Melhorado\n')
        fprintf('4. Método de RK2"\n')
        fprintf('5. Método de RK4\n')
        fprintf('6. ODE45\n')
        fprintf('7. Método de Adams-Bashford\n')
        fprintf('8. APLICAR OS 3 MÉTODOS EM SIMULTÂNEO\n')
        fprintf('9. Terminar\n\n')
        opcao=input('Opção: ');
    else
        opcao=1;
        primeiraVez=0;
    end
    
    y=uint16.empty;
    switch opcao
        case 1
            strF=input('\nIntroduza a função f(t,y) = ','s');
            f=@(t,y) eval(vectorize(strF));
            while(1)
                try
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
            y=NEuler(f,a,b,n,y0);
            mostraGrafico("Euler", y, a, b, n);
        case 3
            %y=MEuler Melhorado
            mostraGrafico("Euler Melhorado", y, a, b, n);
        case 4  
            %y=NRK2(f,a,b,n,y0); 
            mostraGrafico("RK2", y, a, b, n);
        case 5
            %y=NRK4(f,a,b,n,y0);
            mostraGrafico("RK4", y, a, b, n);
        case 6
            [t, y]=ode45(f, [a b], y0);
            fprintf('Deseja visualizar o grafico? (y,n)\n');
            ch=input('Opção: ', 's');
            if strcmpi(ch,'y')
                hold on
                plot (t,y);
                legend("ode45");
                hold off
                grid on
            else
                fprintf('\nIntroduza y ou n\n');
            end
        case 7
              y=AdamBashford(f,a,b,n,y0);
              mostraGrafico("Adams-Bashfords", y, a, b, n);
        case 8
              %y=MNumericosPVI(f,a,b,n,y0);
    end

    if(~primeiraVez)
        if opcao<=9
            if(isempty(y) ~= 1 && opcao ~=9)
                fprintf('\nAproximações obtidas: \n');
                disp(table(y));
            end
            if opcao ~= 0
                input('\nPrima uma tecla para continuar ...');
            end
        else
            fprintf('\nOpção errada.');
            input('\nPrima para continuar');
        end
    end
end

function mostraGrafico(legenda, y, a, b, n)
    fprintf('Deseja visualizar o grafico? (y,n)\n');
    ch=input('Opção: ', 's');
    if strcmpi(ch,'y')
        h=(b-a)/n;
        t=a:h:b;
        hold on
        plot (t,y);
        legend(legenda);
        hold off
        grid on
    else
        fprintf('\nIntroduza y ou n\n');
    end
end
