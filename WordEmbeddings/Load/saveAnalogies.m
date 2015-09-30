dirname = 'C:\Users\Mike\Desktop\analogies';
d=dir(dirname);
cd(dirname)
Analogies = containers.Map;
for k=1:length(d)
    fname=d(k).name
    if strcmp(fname,'.') | strcmp(fname,'..') | strcmp(fname,'.DS_Store')
        continue
    end
    fid = fopen(fname);
    line = fgetl(fid);
    line = strsplit(strtrim(line))
    Analogies(char(fname)) = line;
end
save('Analogies','Analogies')