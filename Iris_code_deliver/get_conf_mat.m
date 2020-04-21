function [conf_mat, error_rate] = get_conf_mat(data,T,W)
%Returns confution matrix and error rate.
n_data = size(data,2);
n_classes = size(T,1);

conf_mat = zeros(n_classes,n_classes);
for k=1:(n_data)
   g =  W*[data(:,k);1];
   [max_T, ind] = max(T(:,k));
   [max_g, indd] = max(g);
   conf_mat(ind,indd) = conf_mat(ind,indd)+1;
end
n_correct = 0;
for i = 1:n_classes
    n_correct = n_correct+ conf_mat(i,i);
end
error_rate = (n_data-n_correct)/n_data;

end

