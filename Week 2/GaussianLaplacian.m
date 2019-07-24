function [G,L] = GaussianLaplacian(img)

%%This code outputs a Gaussian blurred image that is sub-sampled and a
%%Laplacian image which is the difference of the original image and and
%%upsampled version of the Gaussian blurred image created. The commented
%%commands below are an example on how to run this. 

%Apply imgaussfilt on img and store it in a temporary image variable
B = imgaussfilt(img,2);

%Access alternate rows and columns (downsampling) from the smoothed image and assign it to G
G = B(1:2:end,1:2:end);figure(); imshow(G)
%replicate the rows and columns (upsampling) of G and assign it to L

upsam = repelem(G,2,2);
L = img-upsam;figure(); imshow(L)
P = upsam-img;figure(); imshow(P)

end

%% Follow these commands to get the system to run the above function

% img = imread('cameraman.tif');
% [G,L] =  GaussianLaplacian(img);
% montage({img,G,L}, 'size',[1,3],'BorderSize', 10); %Though Gaussian is half the size, montage function resizes it to fit the window
% truesize