function fft_tm(image1,image2)

%% Check which one is target and which one is templete
if size(image1)>size(image2)
    target=image1;
    template=image2;
else
    target=image2;
    template=image1;
end

%% Calculate padding
[by,bx] = size(target);
[ty,tx] = size(template); % need for bbox placement

%% FFT
% Compute the cross power spectrum
tic
Ga = fft2(target);
Gb = fft2(template, by, bx);
term = Ga.*conj(Gb);
c = real(ifft2((term)./abs(term)));
toc

%% Plot it

figure(3);
subplot(3,4,1);
sgtitle('FFT - The Man Himself');
global template_rgb;
p1=imshow(template_rgb);

% Find peak correlation
subplot(3,4,[2 3 4]);
[max_c, imax] = max(abs(c(:)));
surf(c), shading flat; % plot correlation    

% The man himself
subplot(3,4,[5 6 7 8 9 10 11 12]);
result=plot_box(target,template,c);
imshow(result);
hold off;




end