

% circuit.LTspice.data.rawfile.valuesline
filename=circuit.LTspice.raw.file;
% 
fileID = fopen(filename,'rb'); % Opens file

[buf, count] = fread(fileID, 1, 'uint16');
dec2hex(buf)

char(buf)
[buf, count] = fread(fileID, 1, 'double');


fseek(fileID, circuit.LTspice.data.rawfile.valuesposition+1, 'bof'); % data position
[buf, count] = fread(fileID, 1, 'double');
[buf, count] = fread(fileID,'single');



[buf, count] = fread(fileID, 1, 'uint16=>char', 0, 'ieee-le');
position = ftell(fileID)

dec2hex(position)

fseek(fileID, circuit.LTspice.data.rawfile.valuesposition+1, 'bof'); % data position
[buf, count] = fread(fileID, 1, 'double');

fseek(fileID, circuit.LTspice.data.rawfile.valuesposition, 'bof');

[buf, count] = fread(fileID,'uint16=>char', 0, 'ieee-le');
frewind(fileID);


c1 = fread(fileID,1,'float64');


% % tlineB = fgetl(fileID);
% fclose(fileID); % Close file
% 
% tmpchar = fgetl(fileID);
% 
% tline{1}=tmpchar(2:2:end);
% 
% disp(tline{1})
% 
% newStr = strtrim(tmpchar)
