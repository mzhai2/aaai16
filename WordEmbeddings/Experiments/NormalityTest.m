% normality test for each dimension
numCategoriesNorm = size(A,2);
embeddingTestSize = 1000;
ks1 = false(1,size(M,2));
ks2 = false(1,size(M,2));
ks3 = false(1,size(M,2));

for testDim=1:size(M,2)
    ks1(1,testDim)=kstest(M(:,testDim));
    ks2(1,testDim)=kstest(embedding(1:size(M,1),testDim));
    ks3(1,testDim)=kstest(embedding(1:embeddingTestSize,testDim));
end

disp(size(M,2)-sum(ks1))
disp(size(M,2)-sum(ks3))
disp(size(M,2)-sum(ks3))

figure
subplot(2,2,1)
imagesc(ks1);
colormap(gray);
title(['Kolmogorov-Smirnov Normality Test on WordNet selection selection of ' num2str(size(M,2)) ' words in ' num2str(numCategoriesNorm) ' categories in 300 dimensions'])
subplot(2,2,2)
imagesc(ks2);
colormap(gray);
title(['Kolmogorov-Smirnov Normality Test on ' num2str(size(M,1)) ' random words in 300 dimensions'])
subplot(2,2,[3,4])
imagesc(ks3);
colormap(gray);
title(['Kolmogorov-Smirnov Normality Test on all ' num2str(embeddingTestSize) ' words in 300 dimensions'])

warning('off','stats:adtest:OutOfRangePLow');
ad1 = false(1,size(M,2));
ad2 = false(1,size(M,2));
ad3 = false(1,size(M,2));

for testDim=1:size(M,2)
    ad1(1,testDim)=adtest(M(:,testDim));
    ad2(1,testDim)=adtest(embedding(1:size(M,1),testDim));
    ad3(1,testDim)=adtest(embedding(1:embeddingTestSize,testDim));
end

disp(size(M,2)-sum(ad1))
disp(size(M,2)-sum(ad3))
disp(size(M,2)-sum(ad3))

figure
subplot(2,2,1)
imagesc(ad1);
colormap(gray);
title(['Anderson-Darling normality test on WordNet selection of ' num2str(size(M,1)) ' words in ' num2str(numCategoriesNorm) ' categories in 300 dimensions'])
subplot(2,2,2)
imagesc(ad2);
colormap(gray);
title(['Anderson-Darling normality test on ' num2str(size(M,1)) ' random words in 300 dimensions'])
subplot(2,2,[3,4])
imagesc(ad3);
colormap(gray);
title(['Anderson-Darling normality test on all ' num2str(embeddingTestSize) ' words in 300 dimensions'])

% norm plot
% figure
% normplot(M(:,1:10));
% title('Normal Probabiity Plot for Data');
% figure
% normplot(kpcaM(:,1:10));
% title('Normal Probabiity Plot for gaussian KPCA');
% normplot(kpcaMcos(:,1:10));
% figure
% normplot(kpcaMsimp(:,1:10));
% title('Normal Probabiity Plot for simple KPCA');
