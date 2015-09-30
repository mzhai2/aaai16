% %% estimate bandwidth
% pdf.Mu=M;
% [d, N] = size(M);
% for i = 1:N
%     pdf.Cov{i} = zeros(d,d) ;
% end
% pdf.Cov = pdf.Cov(:,1:300);
% pdf.w = ones(1,N)/N ;
% 
% % estimate the bandwidth
% H = estimateBandwidth(pdf) ;
% % Try semantics
% %% histogram kpca
% figure
% scatterhist(kpcaM(:,1),kpcaM(:,2));
% figure
% scatterhist(kpcaMsimp(:,1),kpcaMsimp(:,2));
% %% data plot
% figure
% plot(M(:,1));
% %% print selected embeddings
% for cluster=1:size(A,2)
%     dispClusters(1,cluster) = M(
% %% scaled embedding
% figure
% imagesc(M');
% sum
% figure
% imagesc(kpcaM');
% figure
% imagesc(kpcaMsimp');
% figure
% imagesc(kpcaMcos');
% [coeff,score,latent] = pca(M); % matlab's pca
% figure
% imagesc(score(:,1:100)');
% plot(U(:,1),V(:,1),'.') % cca?
% %% fit pdf & cdf for each dimension
% figure
% y = zeros(size(M,1),21);
% for pdim=1:size(M,2)
%     pd = fitdist(M(:,pdim),'Normal');
%     y(pdim,:) = pdf(pd,-10:10); % col represents pdf with prob sampled from range for a given a dimension
%     [f,x] = ecdf(M(:,pdim));
%     cdf1(pdim,:) = f;
%     cdf2(pdim,:) = x;
% end
% figure
% imagesc(y');
% figure
% imagesc(cdf1');
% figure
% imagesc(cdf2');
% %% multivariate pdf
% y = mvnpdf(M)
% %% fit kernel
% pd = fitdist(M(:,1),'Kernel','Kernel','normal');
% y = pdf(pd,-10:10);
% plot(-10:10,y,'LineWidth',2)
% %% 3d scatter
% figure
% numDims = 3; pcaDims = 100; perplexity = 50;
% mappedX3 = tsne(kpcaM, [], numDims, perplexity);
% scatter3(mappedX3(:,1), mappedX3(:,2), mappedX3(:,3),'ro')
% text(mappedX3(:,1), mappedX3(:,2), mappedX3(:,3), foundWords, 'horizontal','left', 'vertical','bottom')
% view(-30,10)
% %% pca explanation
% [coeff,score,latent,tsquared,explained] = pca(M);
% cumExpl = cumsum(explained)./sum(explained); % cumulative variance captured
% figure
% plot(explained)
% title('Graph of Explanation of Principle Components')
% xlabel('Principle Component')
% ylabel('% of variation explained by principle component')
% figure
% plot(cumExpl)
% title('Graph of Cumulative Explanation of Principle Components')
% xlabel('Principle Component')
% ylabel('Cumulative % of Variation Explained')
% [xA,yA] = ds2nfu(100,cumExpl(100,1));
% annotation('textarrow',[.5,xA],[.5,yA], 'String',strcat(num2str(cumExpl(100,1)), '% explained by 100th principle component'))
% %% calculate and display tsne WNclass scatter
% figure
% numDims = 2; perplexity = 30;
% mappedX2 = tsne(kpcaMsimp, [], numDims, perplexity,'cosine');
% randomColors = rand(numCategories,3);
% gscatter(mappedX2(:,1), mappedX2(:,2),WNclass ,[], 'ox+*sdv^<>ph',12)
% title('tsne scatter');
% text(mappedX2(:,1), mappedX2(:,2), foundWords, 'horizontal','left', 'vertical','bottom')
% columnlegend(3, foundCategories, 'Location', 'NorthWest', 'boxoff');
% %% 3d quiver
% numVectors = 269;
% X = zeros(numVectors,1)';
% U = mappedX3(1:numVectors,1)';
% V = mappedX3(1:numVectors,2)';
% W = mappedX3(1:numVectors,3)';
% figure
% quiver3(X,X,X,U,V,W)
% view(-35,45)
% %% plotting
% figure
% contour(M)

% plotFCM(mappedX2(1:size(p,1),:),foundWords,foundCategories,'',vectors(p),3,vocab2cat,'cosine',true,3,true);
% plotKmeans(mappedX2(1:size(p,1),:),foundWords,foundCategories,'',vectors(p),3,vocab2cat,'cosine',true,3,true);
% plotKmedoids(mappedX2(1:size(p,1),:),foundWords,foundCategories,'',vectors(p),3,vocab2cat,'cosine',true,3,true);
% plotAP(mappedX2(1:size(p,1),:),foundWords,foundCategories,'',vectors(p),vocab2cat,'cosine',true,3,true);

% plotKmeans(mappedX2,foundWords,foundCategories,' no',vectors,numCategories,randomColors)
% plotKmeans(mappedX2,foundWords,foundCategories,' gaussian',kpcaVectors,numCategories,randomColors,WNclass,A)
% plotKmeans(mappedX2,foundWords,foundCategories,' cosine',kpcaMcos,numCategories,randomColors,WNclass,A)
% plotKmeans(mappedX2,foundWords,foundCategories,' simple',kpcaMsimp,numCategories,randomColors,WNclass,A)
% plotFCM(mappedX2,foundWords,foundCategories,' gaussian',kpcaVectors,numCategories,randomColors,WNclass,A);
% plotFCM(mappedX2,foundWords,foundCategories,' cosine',kpcaMcos,numCategories,randomColors,WNclass,A);
% plotFCM(mappedX2,foundWords,foundCategories,' simple',kpcaMsimp,numCategories,randomColors,WNclass,A);