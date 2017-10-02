% based on function example shown in https://stackoverflow.com/questions/18204535/write-field-name-and-value-form-structures-to-a-file


function fid = serialize(allvariables, fid, prefix)

%  get the fields
fields = fieldnames(allvariables);
values = struct2cell(allvariables);

% sort the fields based on the string
[fields, idx] = sort(fields);
values = values(idx);



%%  all the convertion need to be processed
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



%%
numField = length(values);

for ifield = 1 : numField
    if (isstruct(values{ifield}))       % this particular field is structure
        % recurcive call here
        fieldname = fields{ifield};
        nextprefix = [prefix, fieldname, '.'];
        fid = serialize(allvariables.(fields{ifield}),fid, nextprefix);     %allvariables.(fields{ifield}) is using dynamic field access, see https://blogs.mathworks.com/loren/2005/12/13/use-dynamic-field-references/
    else
        fprintf(fid, '%s%s = %s\n', prefix, fields{ifield},values{ifield} );
    end
end


end