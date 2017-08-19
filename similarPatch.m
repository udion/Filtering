function [w] = similarPatch(P1, P2, h)
%SIMILARPATCH Summary of this function goes here
%   Detailed explanatiooes here
    dim1 = size(P1);
    dim2 = size(P2);
    r = min(dim1(1),dim2(1));
    c = min(dim1(2),dim2(2));
    p1 = P1(1:r,1:c);
    p2 = P2(1:r,1:c);
    p1 = p1(:);
    p2 = p2(:);
    diffp = p1-p2;
    diffp = diffp.^2;
    
    sdiff = sum(diffp);
    w = exp(-(sdiff/h^2));
end

