function W = weight_Matrix(x,sigma1,sigma2,max_dist)
%Returns the weight/similarity matrix of a data vector x

m = size(x,1); %Number of pixels
entries = round((max_dist/sqrt(m))*(m^2)); %number of expected entries in the sparse matrix


%index locations
i = zeros(entries,1);
j = zeros(entries,1);
v = zeros(entries,1);

count = 1;


%traversing similarity matrix
for a = 1:m
    for b = 1:m
        dist = pixDistance(a,b,sqrt(m));
        if(dist <= max_dist) %pixel is within neighborhood
            i(count) = a;
            j(count) = b;
            
            %calculate similarity
            v(count) = exp(-1*((norm(x(a)-x(b))^2)/(sigma1^2))-(dist/(sigma2^2)));
            
            count = count+1;
        end
        if count > entries+1
            error('too many non-zero entries');
        end
    end
end

i = i(1:count-1);
j = j(1:count-1);
v = v(1:count-1);
W = sparse(i,j,v);

%outputs how much of the sparse matrix was used
usage = count/(m^2)

end

