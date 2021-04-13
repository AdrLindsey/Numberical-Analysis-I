function naive_tm(image1,image2)

%% Check which one is target and which one is templete
if size(image1)>size(image2)
    target=image1;
    template=image2;
else
    target=image2;
    template=image1;
end

%% --- Get correlation matrix to find peak ---------------------
% Read both images sizes
[r1,c1]=size(target);
[r2,c2]=size(template);
% Mean of the template
image22=template-mean(mean(template));
% Corrolate both images
corrMat=[];
tic
%% --- Get correlation matrix to find peak ---------------------
%% -------------------------------------------------------------
for i=1:(r1-r2+1)
    for j=1:(c1-c2+1)
        % Isolate the part of the target under the template
        n_image=target(i:i+r2-1,j:j+c2-1);
        % Center the valus by subtracting the mean
        n_image=n_image-mean(mean(n_image));  
        % Multiply the two average matrices together
        corr=sum(sum(n_image.*image22));
        corrMat(i,j)=corr;
    end 
end
%% -------------------------------------------------------------
toc

%% Plot it

figure(2);
sgtitle('Naive - The Man Himself');
subplot(3,4,1); % the template
global template_rgb;
p1=imshow(template_rgb);

subplot(3,4,[2 3 4]); % the corr map
surf(corrMat), shading flat;

% the man himself
subplot(3,4,[5 6 7 8 9 10 11 12]); % than man himself
result=plot_box(target,template,corrMat);
imshow(result);
hold off;

end


