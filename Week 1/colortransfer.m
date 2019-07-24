function outchannel = colortransfer(schannel,tchannel)

%Melvin Mathew
%2019-07-19

%%This is taken from E. Reinhard_Color Transfer between images. This
%%algorithm takes individual channels from the LAB color space of an image
%%and normalizes it, then converts it to match the LAB color space of a
%%target image who's color space we are trying to copy. Since this takes in
%%only individual channels and outputs individual channels, the user has to
%%run this thrice over the three channels and then concatenate them in the
%%right order to display the source image within the same color space as
%%the target image. 


%compute mean value of source channel
    ms = mean(schannel(:));

    %compute mean value of target channel
    mt = mean(tchannel(:));

    %compute normalized standard deviation of source channel 
    ss = std(schannel(:));

    %compute normalized standard deviation of target channel
    st = std(tchannel(:));

    % perform color transfer and obtain output channel
    outchannel = (((schannel-ms)/ss)*st)+mt;

end

%% Example code to use this function:

% img1 = imread('source.jpg');
% img2 = imread('target.jpg');
% [S1,S2,S3] = imsplit(rgb2lab(img1));
% [T1,T2,T3] = imsplit(rgb2lab(img2));
% O1 = colortransfer(S1,T1);
% O2 = colortransfer(S2,T2);
% O3 = colortransfer(S3,T3);
% montage({img1, img2, lab2rgb(cat(3,O1,O2,O3))},'Size',[1,3])