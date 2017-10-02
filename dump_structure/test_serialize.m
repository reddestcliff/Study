close all
clear all
a.field2  = 1;
a.field3 ='string1'
a.field1 =[1,2,3]
b.field1 = 2
b.field2 = 'test'

a.sub=b
% dumpstruc(a)


allvariables = a;


%  get the fields
fields = fieldnames(allvariables);
values = struct2cell(allvariables);

% sort the fields based on the string
[fields, idx] = sort(fields);
values = values(idx);


prefix ='';
fid = fopen('output.txt', 'wt');
fid = serialize(allvariables, fid, prefix);
fclose(fid);


