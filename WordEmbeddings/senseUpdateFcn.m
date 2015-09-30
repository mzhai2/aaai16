function output_txt = senseUpdateFcn(~,event_obj)
foundWords = evalin('base', 'foundWords');
vocab2cat = evalin('base', 'vocab2cat');
foundCategories = evalin('base', 'foundCategories');
global ind;

hObj = get(event_obj,'Target');   %# line object handle
idx = get(event_obj,'DataIndex'); %# index of nearest point
cIdx = str2double(get(hObj,'DisplayName'));
idx = ind{cIdx}(idx);
categories = vocab2cat(foundWords{idx,1});
intersect(categories,foundCategories)
output_txt = [intersect(categories,foundCategories)];
% for categoryIdx=1:size(categories,1)
%     txt{wordIdx,1} = [txt sprintf('\n%s',categories{categoryIdx})];
%     % strcat(dispText{wordIdx,1},' ',categories{categoryIdx});
% end

% pos = get(event_obj,'Position');
% txt = {['Time: ',num2str(pos(1))],...
% 	      ['Amplitude: ',num2str(pos(2))]};