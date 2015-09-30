function plotfig = clusterPlot(visible,showWindows,mappedX2,clusterIndices,subscript,algorithm)

if (showWindows == 1 || showWindows==3)
    if ~visible
        plotfig=figure('Visible','off');
    else
        plotfig=figure;
    end
    hold on
    gscatter(mappedX2(:,1), mappedX2(:,2),clusterIndices ,[], 'ox+*sdv^<>ph',12)
    title(strcat(algorithm,' using ',distance,' distance ', kernelMethod));
    [annotations,~] = createAnnotations(foundWords,vocab2cat);
    if subscript
        text(mappedX2(:,1),mappedX2(:,2),annotations, 'horizontal','left', 'vertical','bottom')
    else
        text(mappedX2(:,1),mappedX2(:,2),strrep(foundWords,'_',' '), 'horizontal','left', 'vertical','bottom')
    end
    hold off
end