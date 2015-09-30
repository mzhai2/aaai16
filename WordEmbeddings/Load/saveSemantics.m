hypoName = 'data/hypo_all.txt';
senseName = 'data/sense_all.txt';
synonymName = 'data/synonym_top_1000.txt';
files = {hypoName,senseName,synonymName};
for i=1:length(files)
    fid = fopen(files{i});
    m = containers.Map;
    curline = fgetl(fid);
    while ischar(curline)
        curline = strrep(curline,' ','_');
        C = strsplit(curline,{'\t',','},'CollapseDelimiters',true);
        word = C(:,1);
        synset = C(:,2:end-1);
        if size(synset,2) > 1
            m(char(word)) = synset;
        end
        curline = fgetl(fid);
    end
    fclose(fid);
    if i == 1
        hypo = m;
    end
    if i == 2
        sense = m;
    end
    if i == 3
        synonym = m;
    end
end
save('data/Semantics.mat', 'hypo','sense','synonym');