function dumpstruc(allvariables)


fields = fieldnames(allvariables);
values = struct2cell(allvariables);

%// Optional: add enclosing apostrophes around string values
idx = cellfun(@ischar, values); 
values(idx) = cellfun(@(x){['''', x, '''']}, values(idx));

%// Convert numerical values to strings
idx = cellfun(@isnumeric, values); 
values(idx) = cellfun(@num2str, values(idx), 'UniformOutput', false);

%// Convert cell arrays of strings to comma-delimited strings
idx = cellfun(@iscellstr, values);
stringify_cellstr = @(x){['{' sprintf('''%s'', ', x{1:end - 1}) ...
   sprintf('''%s''', x{end}) '}']};
values(idx) = cellfun(stringify_cellstr, values(idx));

%// Convert cell array of numbers to strings
idx = cellfun(@iscell, values);
isnumber = @(x)isnumeric(x) && isscalar(x);
idx_num = cellfun(@(x)all(arrayfun(@(k)isnumber(x{k}),1:numel(x))), values(idx));
idx(idx) = idx_num;
stringify_cellnum = @(x){['{' sprintf('%d, ', x{1:end - 1}) num2str(x{end}) '}']};
values(idx) = cellfun(stringify_cellnum, values(idx));

%// Combine field names and values in the same array
C = {fields{:}; values{:}};

%// Write fields to text file
fid = fopen('output.txt', 'wt');
fprintf(fid, repmat('%s = %s\n', 1, size(C, 2)), C{:});
fclose(fid);
end