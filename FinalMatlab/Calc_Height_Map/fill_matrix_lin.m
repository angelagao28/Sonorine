function A = fill_matrix_lin(num_rows, num_cols, Z)
    total = num_rows*num_cols;
    A = sparse(3*total, total);
    one = ones(total, 1);
    columns = [one, -one];
    start1 = -(num_cols + 2)+1;
    start2 = start1+2;
    d = [start1+num_cols start2+num_cols];
    A(1:total, :) = spdiags(columns, d, total, total);
    
    columns = [one,-one];
    start1 = -(num_cols + 2)+1;
    start2 = start1 + 2*num_cols;
    d = [start1+1 start2+1];
    A(total+1:total*2, :) = spdiags(columns, d, total, total);
    
    A3_main_diag = reshape(Z, total, 1);
    A(total*2+1:total*3, :) = spdiags(A3_main_diag, 0, total, total);
end