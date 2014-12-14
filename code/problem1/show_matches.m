function show_matches(im1,im2,pairs)
%%
% Shows given matches on top of the images.
%
%   INPUTS
%     im1      left image
%     im2      right image
%     pairs    Mx4 matching pairs of coords.
%%
figure,
imshow(im1)
hold on 
plot(pairs(:,1),pairs(:,2), 'yx')
hold off

figure,
imshow(im2)
hold on 
plot(pairs(:,3),pairs(:,4),'yx')
hold off
