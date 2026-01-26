clc;
clear all;
close all;
% commands to clear all windows, figures etc

I = imread("C:\Users\hp\Downloads\images.jpg");
if size(I,3) == 3
    Ig = rgb2gray(I);   % Image to grayscale
end

figure
imshow(Ig);
title("Original Image");

[Ia,Iv,Ih,Id] = dwt2(Ig,"haar");   % performing wavelet transformation on an image
Ia2 = uint8(255 * mat2gray(Ia));  % converting the double type into the uint8 for image

subplot(2,2,1);
imshow(Ia2);   % showing the approximation output of the input image
title('Approximation');

Iv2 = uint8(255 * mat2gray(Iv));
subplot(2,2,2);
imshow(Iv2);   % vertical edges output
title('Vertical');

Ih2 = uint8(255 * mat2gray(Ih));
subplot(2,2,3);
imshow(Ih2);   % horizontal edges output
title('Horizontal');

Id2 = uint8(255 * mat2gray(Id));
subplot(2,2,4);
imshow(Id2);   % detailed edges output
title('Detailed');
