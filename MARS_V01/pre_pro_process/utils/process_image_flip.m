function [im_data] = process_image_flip(img_name)
%Read image and pre-process
%   1. resize to (224,224)
%   2. permute channels
%   3. subtract mean value for each channel
img = imread( img_name );

% augmentation process

% randomly flip
if( rand(1) >= 0.5 )
	img = flip(img, 2);
end



%% Caffe input process
im_data = imresize((single(img)),[224 224]);
im_data = im_data(:,:,[3,2,1]);
im_data = permute(im_data,[2,1,3]);
        
im_data(:,:,1) = im_data(:,:,1)-104;
im_data(:,:,2) = im_data(:,:,2)-117;
im_data(:,:,3) = im_data(:,:,3)-123;

end

