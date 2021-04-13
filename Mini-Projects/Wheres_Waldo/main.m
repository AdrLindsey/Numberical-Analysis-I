function main(i)

%% Dear User
% There are 4 image pairs to run through.
% In total, this usually takes about 3 minutes.
% In between each image pair, you'll be prompted to hit <ENTER>.

for i=1:4

    %% Load Target image
    global template_rgb
    template_rgb = imread(strcat('waldo_template',num2str(i,0),'.png'));
    template = rgb2gray(template_rgb);

    target_rgb = imread(strcat('waldo_target',num2str(i,0),'.png'));
    target = rgb2gray(target_rgb);
    figure(1)
    imshow(target_rgb);
    set(gca,'Position',[0 0 1 1])

    %% Apply templete matching and compare
    fprintf('### ----- You are now running Waldo Search %.0f of 4!\n',i)
    naive_tm(template,target);
    fft_tm(template,target);
    
    % only require <RETURN> while there's more to run
    if i<4
        return_pause();
    else
        continue
    end

end

end