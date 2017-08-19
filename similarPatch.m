function [w] = similarPatch(P1, P2, h)
%SIMILARPATCH Summary of this function goes here
%   Detailed explanatiooes here
    p1 = P1(:);
    p2 = P2(:);
    P1
    P2
    display('new')
    %diffp = p1-p2;
    %diffp = diffp.^2;
    
    %sdiff = sum(diffp);
    %w = exp(-(sdiff/h^2));
    
    w = sum(p1.*p2)/(norm(p1)*norm(p2));
end

