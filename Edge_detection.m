% Edge Detection with Operators
I = imread('Face.jpg');

% Converting image to grayscale
A = rgb2gray(I);


% Other edge operators
B = edge(A, 'roberts');
C = edge(A, 'sobel');
D = edge(A, 'prewitt');
E = edge(A, 'log');
F = edge(A, 'canny');
G = edge(A, 'zerocross');



% Display of input and output images of Edge Detector Operators
figure('Name', 'Edge Operators');
subplot(2,4,1), imshow(I);
title('Original')
subplot(2,4,2), imshow(A);
title ('Gray Image');
subplot(2,4,3), imshow(B);
title ('Roberts Operator');
subplot(2,4,4), imshow(C);
title('Sobel Operator');
subplot(2,4,5), imshow(D);
title ('Prewitt Operator');
subplot(2,4,6), imshow(E);
title ('Log Operator');
subplot(2,4,7), imshow(F);
title ('Canny Operator');
subplot(2,4,8), imshow(G);
title('Zerocross Operation')

