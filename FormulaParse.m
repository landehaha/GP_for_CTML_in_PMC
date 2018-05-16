% clear;
% clc;
% M f U_+^t g
% Formula = input('Input a Formula:','s');
function [SubFormula1,SubFormula2,OP,TI] = FormulaParse(s)
% Formula = 'M one U+10000 succ';
Formula = s;
L = length(Formula);
% l1 = strfind(Formula,'M');
l2 = strfind(Formula,'U');
if isempty(l2)
    l2 = strfind(Formula,'V');
end
l3 = strfind(Formula,' ');
SubFormula1 = Formula(l3(1)+1:l3(2)-1);
SubFormula2 = Formula(l3(3)+1:L);
OP = Formula(l2:l2+1);
if Formula(l2+2) ~= ' '
    TI = Formula(l2+2:l3(3)-1);
    TI = str2double(TI);
else TI = -1;
end
