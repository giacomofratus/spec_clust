function dist = pixDistance(a,b,m)
%Returns the distance between pixel i and j (ordered column-wise)

%pixel -a- coordinates
i1 = mod(a,m);
if i1 == 0
    i1 = m;
end
j1 = ((a-i1)/m)+1;

%pixel -b- coordinates
i2 = mod(b,m);
if i2 == 0
    i2 = m;
end
j2 = ((b-i2)/m)+1;


%distance between pixel a and b
dist = sqrt((i1-i2)^2 + (j1-j2)^2);


end

