function return_pause()
%% Prompt User
fprintf('Hit <Return> to continue.\n');

currkey=0;
% Co not move on until enter key is pressed
while currkey~=1
    pause; 
    currkey=get(gcf,'CurrentKey'); 
    if strcmp(currkey, 'return') 
        currkey=1; 
    else
        currkey=0; 
    end
end