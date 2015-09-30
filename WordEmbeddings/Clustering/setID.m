function setID(nodeMap,treeMap,nodes)
    while size(nodes,1) > 0
        node = nodes(1);
        nodes(1,:) = [];
        if isKey(nodeMap,node)
            c = nodeMap(node);
            curID = treeMap(node);
            treeMap(c(1))= [curID '0'];
            treeMap(c(2))= [curID '1'];
            nodes(size(nodes,1)+1,1) = c(1);
            nodes(size(nodes,1)+1,1) = c(2);
        end
    end
end
