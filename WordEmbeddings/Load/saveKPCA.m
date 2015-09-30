% [~,score,~] = pca(embedding); % matlab's pca
% disp('fin 1')
% csvwrite('C:\Users\Mike\Desktop\kPCA100dNYTw2v.csv',score(:,1:100));
% disp('fin 2')
% load('Tw2v.mat');
[~,score,~] = pca(embedding); % matlab's pca
disp('fin 3')
csvwrite('C:\Users\Mike\Desktop\kPCA100dTw2v.csv',score(:,1:100));
disp('fin 4')