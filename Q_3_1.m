% Q 3.1
% Resuperar frames perdidos do arquivo de vídeo

% Parametros de leitura dos frames
qtdFrames = 20;
count = 1;
baseIni = 'saida_';
baseFim = '.bmp';
numName = 100;

% Vetor para guardar frames perdidos
missing = zeros(1,qtdFrames);

% Ler frames do video
for count = 1:qtdFrames
    
    % Gerar o nome do frame
    strNum = int2str(numName);
    nameFrame = strcat(baseIni,strNum);
    nameFrame = strcat(nameFrame,baseFim);
    
    % Leitura da imagem
    im = imread(nameFrame);
    imGray = rgb2gray(im);
    
    % Descobre se a imagem está faltando
    maxGrayLevel = max(imGray(:));
    if maxGrayLevel == 0
        missing(count) = 1;
    end
    
    % Salva imagens em um vetor
    M(:,:,count) = imGray;
    
    imAnt = imGray;
    
    count = count + 1;
    numName = numName + 1;
end

% Percorrer o vetor de frames e id os que estão faltando
for count = 2:qtdFrames
    
    % Caso a imagem esteja faltando
    if missing(count) == 1
        
        %Pega a imagem anterior e a proxima
        imAnt = M(:,:,count-1);
        imProx = M(:,:,count+1);
        
        %Imagem atual eh uma media ponderada das duas
        imNow = (imAnt/2+imProx/2);
        
        % Mostra imagem atual
        figure
        imshow(imNow)
    end
    
end