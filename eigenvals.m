%

A = input('give a matrix, and the general solution of the system willl be displayed:  ');
e = eig(A);
[V,D] = eig(A);
M = V;
n = max(size(e));
for i = 1:n
  fprintf('C%d*(%d^n)\n',i,e(i,1));
  disp(M(:,i));  
end
disp('where ci is a constant, e^n is a eigenval and the numbers below are eigenvects');
disp(M)