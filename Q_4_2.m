% Q 4.2

% Abrir o arquivo de som
[audio,Fs] = audioread('teste_de_som.wav');
% sound(audio,Fs);

% Taxa de Amostragem = 8KHz
Fs;

% Multiplique o sinal original por 30 
audio = 30*audio;
%sound(audio,Fs);

% Adicione a ele um ruído senoidal na faixa de 466,16 Hz (frequência do Lá sustenido)
t=1:size(audio);
fRuido = 466.16;
ruido=sin(2*pi*fRuido*t);
ruido = transpose(ruido);
audio_ruido = audio+ruido;
%sound(audio_saida);

% Plote o sinal original e esse ruidoso;
figure, plot (audio);
figure, plot(audio_ruido);

% Salvar o sinal de saida em um arquivo de audio
filename = 'sinal_ruidoso.wav';
audiowrite(filename,audio_ruido,Fs);

% teste filtros FIR e IIR com diferentes parâmetros para tentar extrair esse ruído do sinal gerado no item anterior, considerando que você não tem a informação sobre o sinal ruidoso.

% 1 = Testar passar um sinal por um filtro passa-baixa de hamming
filtro1 = fir1(50,.2,'low');
audio_filtro1 = filter(filtro1,1,audio_ruido);

%sound(audio_filtro);
figure, plot(audio_filtro1);
ylim([-6 6]);

% Salvar o sinal de saida em um arquivo de audio
filename = 'sinal_final.wav';
audiowrite(filename,audio_filtro1,Fs);

% 2 = Testar um filtro passa-baixa Gaussiano
audio_filtro2 = imgaussfilt(audio_ruido, 5);

% sound(audio_filtro2);
figure, plot(audio_filtro2);
ylim([-6 6]);

% 3 = Testar um filtro passa-baixa de Hamming, com outros parametros
filtro3 = fir1(60,.5,'low');
audio_filtro3 = filter(filtro3,1,audio_ruido);

% sound(audio_filtro3);
figure, plot(audio_filtro3);
ylim([-6 6]);
