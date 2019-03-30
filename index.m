% script for testdata
clear all
clc
str=which('index.m'); % find filename dir
filepath = fileparts(str);

circuit.LTspice.simsdir = [ filepath '\testdata\text\op\'];
circuit.LTspice.name = 'op';
circuit = ltasc2net(circuit); % Generates the net file

%% ascii (Text)
[status cmdout]= system(['XVIIx64.exe -Run -b -ascii ' circuit.LTspice.net.file]); % Run simulation, raw is ascii (text)
circuit.LTspice.raw.file = [circuit.LTspice.simsdir circuit.LTspice.name '.raw'];
% raw_data = LTspice2Matlab(circuit.LTspice.raw.file);

data = rawltspice(circuit.LTspice.raw.file);


%% Binary
[status cmdout]= system(['XVIIx64.exe -Run -b ' circuit.LTspice.net.file]); % Run simulation, raw is Binary
circuit.LTspice.raw.file = [circuit.LTspice.simsdir circuit.LTspice.name '.raw'];
% raw_data2 = LTspice2Matlab(circuit.LTspice.raw.file);

data = rawltspice(circuit.LTspice.raw.file);


%%


