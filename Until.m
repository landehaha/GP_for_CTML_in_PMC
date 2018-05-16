function h = Until(SubFormula1, SubFormula2, OP, Path, TI1, x3)
if TI1 == -1
    TI1 = length(Path);
end
f = str2func(SubFormula1);
g = str2func(SubFormula2);
ctr = 1;
if length(Path) > TI1
    Path = Path(1:TI1);
end
n = length(Path);
if OP == '+'
% checkforuntilproperty
    h = 0;
    for i = 1:n-1
        if g(Path(i)) == 0;
            h = h + f(Path(i)) + x3;
        else
            ctr = -1;
            break;
        end
    end
    if ctr == -1
        for ii = i:n-1
            if g(Path(ii)) > 0
                h = h + f(Path(ii)) + x3;
            else
                h = 0;
                break;
            end
        end
    end
    elseif OP == '*'
    % checkforuntilproperty
        h = 1;
        for i = 1:n-1
            if g(Path(i)) == 0;
                h = h * f(Path(i));
            else
                ctr = -1;
                break;
            end
        end
        if ctr == -1
            for ii = i:n-1
                if g(Path(ii)) > 0
                    h = h * f(Path(ii));
                else
                    h = 0;
                end
            end
        end
end
h = h * g(Path(n));
end
    