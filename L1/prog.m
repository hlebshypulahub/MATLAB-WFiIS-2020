% tworze zapis
prompt = 'Podaj wektor [x(1), . . . , x(i)]: ';
% wyswietlam zapis i pobieram wektor
v = input(prompt);
% tworze zapis
prompt = 'Podaj funkcje - 1 (sin) lub 2 (cos): ';
% wyswietlam zapis i pobieram przel
przel = input(prompt);

% wywoluje funkcje, ktora pryjmuje wektor i przel i zwraca [...]
[maks, minim, parz, niep, niezer, moj_fun] = przetworz(v, przel);

% jezeli przel == 1 lub 2, to wyswietlam wyniki korzystajac z disp()
if przel==1 || przel==2
    disp(' ');

    disp('Wartosc maksymalna elementow wektora: ');
    disp(maks);

    disp('Wartosc minimalna elementow wektora: ');
    disp(minim);

    disp('Liczba elementow parzystych w wektorze: ');
    disp(parz);

    disp('Liczba elementow nieparzystych w wektorze: ');
    disp(niep);

    disp('Liczba elementow niezerowych w wektorze: ');
    disp(niezer);

    if przel==1
        disp('Wektor sin(v): ');
        disp(moj_fun);
    elseif przel==2
        disp('Wektor cos(v): ');
        disp(moj_fun);
    end
end


