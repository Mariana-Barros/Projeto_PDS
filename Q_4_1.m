% Q 4.1

% Abrir audio e plotar o seu sinal
[audio,Fs] = audioread('dg105.wav');
%sound(audio,Fs);
%figure, plot (audio);

% Aplicaçao de um filtro no sinal de audio para remover o ruído
w = 300;
h = [1 -0.9375];
n = floor(length(audio)/w);
for k=1:n
    seg = audio(1+(k - 1)*w:k*w);
    segf = filter(h, 1, seg);
    out(1+(k-1)*w:k*w) = segf;
end
out = 2*out;
%sound(outsp);
figure, plot (out);
out = transpose(out);

% Plotar o espectograma do sinal de audio
[B,f,t]=specgram(out,1024,Fs,256,192);
bmin=max(max(abs(B)))/300;
espec = 20*log10(max(abs(B),bmin)/bmin);
figure, imagesc(t,f,espec);
axis xy; xlabel('Time (s)'); ylabel('Frequency (Hz)');
colormap(jet);

% Pegar o primeiro momento onde o audio eh cortado
sumColun = sum(espec, 1);
idxIni = find(sumColun(250:end)<70, 1) + 250;
idxFim = find(sumColun(idxIni:end)>100, 1) + idxIni;

% Ajeita no espectograma a primeira parte onde o audio eh cortado
espec(:,idxIni:end) = horzcat( espec(:, idxFim:end), espec(:, idxIni:idxFim-1)) ;
interval = idxIni - idxFim;

% Pegar o segundo momento onde o audio é cortado
sumColun2 = sum(espec, 1);
idxIni2 = find(sumColun2(620:end)<70, 1) + 620;
idxFim2 = find(sumColun2(idxIni2:end)>100, 1) + idxIni2;

% Ajeita no espectograma a primeira parte onde o audio eh cortado
espec(:,idxIni2+interval:end)= horzcat( espec(:, idxFim2+interval:end), espec(:, idxIni2+interval:idxFim2+interval-1)) ;
figure, imagesc(t,f,espec);
axis xy; xlabel('Time (s)'); ylabel('Frequency (Hz)');
colormap(jet);

% Ajeita no sinal de audio as partes que foram cortadas
part1 = out(1:t(idxIni)*Fs);
part2 = out(t(idxFim)*Fs:t(idxIni2)*Fs);
part3 = out( t(idxFim2)*Fs:end );
audio_final = vertcat( part1 , part2 , part3 );
figure, plot(audio_final);
%sound(audio_final);

% Salvar o sinal de saida em um arquivo de audio
filename = 'saida.wav';
audiowrite(filename,audio_final,Fs);
