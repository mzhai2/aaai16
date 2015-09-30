function clusterID = naiveAgglomerative(M)
    clusterID = cell(size(M,1)*2-1,1);
    protoC = containers.Map('KeyType','double','ValueType','any');
    processed = 0;
    while(size(M,1) > 1)
        protoM = zeros(0);
        D = triu(squareform(pdist(M,'cosine')));
        D(D==0)=100; 
        leaves = 1:size(M,1);
        protoC.keys

        protoCtmp=zeros(0,3);
        if size(M,1)<4
            return
        end
        while size(protoM,1) < size(M,1)/2
            [m,I]=min(D(:));
            if m ==100
                break;
            end
            [I,J]=ind2sub(size(D,1),I);
            leaves(I) = 0;
            leaves(J) = 0;
            parent = size(M,1)+processed+size(protoCtmp,1)+1;
            clusterID = incrementChildren([I+processed,J+processed],[parent parent],clusterID,protoC);
            protoM(size(protoM,1)+1,:) = mean([M(I,:);M(J,:)]);
            protoCtmp(size(protoCtmp,1)+1,:) = [size(M,1)+processed+size(protoCtmp,1)+1,I+processed,J+processed];
                        
            D(I,:)=100;
            D(J,:)=100;
            D(:,I)=100;
            D(:,J)=100;
        end
        leaves(leaves==0) = [];
        if size(leaves,2) > 0
            protoM(size(protoM,1)+1,:) = M(leaves(1));
            protoC(size(M,1)+processed+size(protoCtmp,1)+1) = leaves(1);
%             disp(processed)
%             disp(size(protoCtmp,1)+1)
        end
        for t=1:size(protoCtmp,1)
            protoC(protoCtmp(t,1))=protoCtmp(t,2:3); %??
        end

        processed = processed + size(M,1);
        M = protoM;
    end
end

function clusterID = incrementChildren(nodeQ,parentQ,clusterID,protoC)
    while size(nodeQ,2) > 0
        parent = parentQ(1);
        parentQ(1) = [];
        I = nodeQ(1);
        nodeQ(1) = [];
        if rem(size(nodeQ,2),2)==0
            num = '0';
        else
            num = '1';
        end
        clusterID{I,1} = [clusterID{parent,1} num];
        if isKey(protoC,I)
            nodeQ = horzcat(nodeQ,protoC(I));
            parentQ = horzcat(parentQ,[I I]);
%             disp('x')
%             disp(I);
        else
%             disp('u')
%             I
        end
%         disp(protoC.keys)
    end
end