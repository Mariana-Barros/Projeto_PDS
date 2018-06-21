% Plotar a DFT de y(n) = Magnitude e fase

n = 0:0.01:10;
fs = 1000;

% Gerar o sinal e a sua transformada de Fourrier
y = sin(20*pi*n) + cos(30*pi*n);
Y = fft(y);
m = 0:length(Y) - 1;

% Plotar a sequência, magnitude e fase do sinal
subplot(3, 1, 1); stem(y); xlabel('n');ylabel('y(n)');title('Sequencia');
xlim([0 100]); 
subplot(3, 1, 2); stem(m*fs/length(Y), abs(Y), 'b'); ylabel('magnitude');
xlabel('frequencia (Hz)'); title('Magnitude da Resposta em Frequencia');
subplot(3,1,3); stem(m*fs/length(Y), angle(Y), 'b'); ylabel('Angulo');
xlabel('frequencia (Hz)'); title('Fase');