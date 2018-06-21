% Q 1.2

% Carregando o sinal de entrada
[x,Fs]= audioread('sp04.wav');
%sound(x,Fs);

% Criando sinal de eco
D = 500 / Fs;
x2 = x + 0.5*delayseq(x, D, Fs);
%sound(x2, Fs);

% Criando o filtro reverberador
a = -0.25;
v = zeros(1, 501);
v(1) = 1;
v(501) = a;
res = filter(1, v, x2);
sound(res, Fs);

% Salvar o sinal de saida em um arquivo de audio
filename = 'saida_-0_25.wav';
audiowrite(filename,res,Fs);

