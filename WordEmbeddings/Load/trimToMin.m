function wordClassCells = trimToMin(wordClassCells,min)
B = cell(0);
for rowB=1:size(wordClassCells,1)
    if size(wordClassCells{rowB,1},1) >= min
        B{size(B,1)+1,1}= wordClassCells{rowB,1};
        B{size(B,1),2}= wordClassCells{rowB,2};
        B{size(B,1),3}=size(B{size(B,1),1},1);
    end
end

e1 = [B{:,3}];
[~, O] = sort(e1(1,:),'descend');
B = B(O,1:2);
wordClassCells=B;
return 
%% write top found sense file
% fid = fopen('data\topFoundSenses.txt','w');
% for rowT=1:size(B,1)
%     s = [B{rowT,2} char(9)];
%     for wordIdx=1:size(B{rowT},1)
%         s = [s,B{rowT}{wordIdx},','];
%     end
%     fprintf(fid,'%s\n',s);
% end
% fclose(fid);
% save 'data/BsenseFoundNYT' wordClassCells