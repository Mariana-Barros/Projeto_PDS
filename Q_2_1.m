% Q 2.1

% Ler a imagem
im = imread('lena_rings.bmp');
%imshow(im);

% Passar um filtro gaussiano passa-baixa
im2 = imgaussfilt(im, 2);
%imshow (im2);

% Corrigir o borramento da imagem
im3 = imsharpen(im2,'Radius',3.5,'Amount',1.5);
imshow (im3);
