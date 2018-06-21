% Plotar a DFT de z(n) = Magnitude e fase

n = 0:0.01:10;
fs = 1000;

% Gerar o sinal e a sua transformada de Fourrier
z = sin(40*pi*n) + cos(60*pi*n);
Z = fft(z);
m = 0:length(Z) - 1;

% Plotar a sequência, magnitude e fase do sinal
subplot(3, 1, 1); stem(z); xlabel('n');ylabel('z(n)');title('Sequencia');
xlim([0 100]);
subplot(3, 1, 2); stem(m*fs/length(Z), abs(Z), 'b'); ylabel('magnitude');
xlabel('frequencia (Hz)'); title('Magnitude da Resposta em Frequencia');
subplot(3,1,3); stem(m*fs/length(Z), angle(Z), 'b'); ylabel('Angulo');
xlabel('frequencia (Hz)'); title('Fase');