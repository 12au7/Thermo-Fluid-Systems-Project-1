% E Plant
clear

c = 1722; % [MW] E plant capacity
c_f = .53; % Capacity factor
PPA = .14; % [$/KWH] Power Purchase Agreement
eta = .53; % Thermal efficiency
fcc = 8.71; % [$/Million BTU] fuel cost
c02e = 117; % [lbs c02/Million BTU] c02 emmisions
cf = 60; % [$/ton c02] carbon fee
cc = 2152.5; % [M$] construction cost

e_py = c * c_f * 365 * 24 * PPA * 1000; % [$] earned per year
qinc = c * c_f * 81891387.76 * 365 /eta; % BTUs produced in 1 year

cof = (qinc/1000000) * fcc; % [$] cost of fuel per year
c02 = (qinc/1000000) * c02e; % [lbs] of c02 per year
cfc = (cf/2000) * c02; % [$] carbon fee per year

net_e = (e_py - cof)/1000000; % [M$] Net earned per year (no carbon fee)
net_e_cf = net_e - (cfc/1000000); % [M$] Net earned per year (with carbon fee)



% Without Carbon Fee
CF_Carbon = [-.3*cc;-.3*cc;-.2*cc;-.3*cc;net_e.*ones(25,1)];
i = [0:28]';
PV_C = CF_Carbon./(1+.1).^i; % Present Value Assuming 10% interest rate
NPV_Carbon = sum(PV_C); %[M$] Net Present Value (w/C02 tax)
NPV_Plant_E = NPV_Carbon;

Cum_cash(1)=CF_Carbon(1); %Cumulative Cash w/ carbon fee
	for k=2:29;
    	Cum_cash(k)=Cum_cash(k-1)+CF_Carbon(k);
    end

x_ptsEN = 0:28;  %x values
y_ptsEN = Cum_cash; %y values
fc = @(x)interp1(x_ptsEN,y_ptsEN,x,'linear');
%find where the interpolation yields zero.
[year,prof] = fzero(fc,5); % 5 is a guess
PayBackPeriod_Plant_E = year;

Av_prof = sum(CF_Carbon)/28; % Average Profit
Inv = (cc); % Investment

ROI=Av_prof/Inv; % Return on Investment
ROI_Plant_E = ROI*100;

[xval,fval] = fzero(@(x)(CF_Carbon'*(1+x).^-(0:length(CF_Carbon')-1).'), 3);

IRR = xval;
IRR_Plant_E = IRR*100; % Percent



% With Carbon Fee
CF_Carbon = [-.3*cc;-.3*cc;-.2*cc;-.3*cc;net_e_cf.*ones(25,1)];
i = [0:28]';
PV_C = CF_Carbon./(1+.1).^i; % Present Value Assuming 10% interest rate
NPV_Carbon = sum(PV_C); %[M$] Net Present Value (w/C02 tax)
NPV_Plant_E_Carbon_Fee = NPV_Carbon;

Cum_cash(1)=CF_Carbon(1); %Cumulative Cash w/ carbon fee
	for k=2:29;
    	Cum_cash(k)=Cum_cash(k-1)+CF_Carbon(k);
    end

x_ptsE = 0:28;  %x values
y_ptsE = Cum_cash; %y values
fc = @(x)interp1(x_ptsE,y_ptsE,x,'linear');
figure(1)
plot(x_ptsE,y_ptsE,x_ptsEN,y_ptsEN)
grid on
title('Cumulative Cash Flow diagram for Plant E')
xlabel('Years')
ylabel('Millions of Dollars')
legend('W/ Carbon Fee','W/o Carbon Fee')
%find where the interpolation yields zero.
[year,prof] = fzero(fc,5); % 5 is a guess
PayBackPeriod_Plant_E_Carbon_Fee = year;

Av_prof = sum(CF_Carbon)/28; % Average Profit
Inv = (cc); % Investment

ROI=Av_prof/Inv; % Return on Investment
ROI_Plant_E_Carbon_Fee = ROI*100;

[xval,fval] = fzero(@(x)(CF_Carbon'*(1+x).^-(0:length(CF_Carbon')-1).'), 3);

IRR = xval;
IRR_Plant_E_Carbon_Fee = IRR*100; % Percent
pause



% F Plant



c = 1512; % [MW] F plant capacity
eta = .604; % Thermal efficiency
cc = 2041.2;  % [M$] construction cost

e_py = c * c_f * 365 * 24 * PPA * 1000; % [$] earned per year
qinc = c * c_f * 81891387.76 * 365 /eta; % BTUs produced in 1 year

cof = (qinc/1000000) * fcc; % [$] cost of fuel per year
c02 = (qinc/1000000) * c02e; % [lbs] of c02 per year
cfc = (cf/2000) * c02; % [$] carbon fee per year

net_e = (e_py - cof)/1000000; % [M$] Net earned per year (no carbon fee)
net_e_cf = net_e - (cfc/1000000); % [M$] Net earned per year (with carbon fee)



% Without Carbon Fee
CF_Carbon = [-.3*cc;-.3*cc;-.2*cc;-.3*cc;net_e.*ones(25,1)];
i = [0:28]';
PV_C = CF_Carbon./(1+.1).^i; % Present Value Assuming 10% interest rate
NPV_Carbon = sum(PV_C); %[M$] Net Present Value (w/C02 tax)
NPV_Plant_F = NPV_Carbon;

Cum_cash(1)=CF_Carbon(1); %Cumulative Cash w/ carbon fee
	for k=2:29;
    	Cum_cash(k)=Cum_cash(k-1)+CF_Carbon(k);
    end

x_ptsFN = 0:28;  %x values
y_ptsFN = Cum_cash; %y values
fc = @(x)interp1(x_ptsFN,y_ptsFN,x,'linear');
%find where the interpolation yields zero.
[year,prof] = fzero(fc,5); % 5 is a guess
PayBackPeriod_Plant_F = year;

Av_prof = sum(CF_Carbon)/28; % Average Profit
Inv = (cc); % Investment

ROI=Av_prof/Inv; % Return on Investment
ROI_Plant_F = ROI*100;

[xval,fval] = fzero(@(x)(CF_Carbon'*(1+x).^-(0:length(CF_Carbon')-1).'), 3);

IRR = xval;
IRR_Plant_F = IRR*100; % Percent



% With Carbon Fee
CF_Carbon = [-.3*cc;-.3*cc;-.2*cc;-.3*cc;net_e_cf.*ones(25,1)];
i = [0:28]';
PV_C = CF_Carbon./(1+.1).^i; % Present Value Assuming 10% interest rate
NPV_Carbon = sum(PV_C); %[M$] Net Present Value (w/C02 tax)
NPV_Plant_F_Carbon_Fee = NPV_Carbon;

Cum_cash(1)=CF_Carbon(1); %Cumulative Cash w/ carbon fee
	for k=2:29;
    	Cum_cash(k)=Cum_cash(k-1)+CF_Carbon(k);
    end

x_ptsF = 0:28;  %x values
y_ptsF = Cum_cash; %y values
fc = @(x)interp1(x_ptsF,y_ptsF,x,'linear');
figure(2)
plot(x_ptsF,y_ptsF,x_ptsFN,y_ptsFN)
grid on
title('Cumulative Cash Flow diagram for Plant F')
xlabel('Years')
ylabel('Millions of Dollars')
legend('W/ Carbon Fee','W/o Carbon Fee')
%find where the interpolation yields zero.
[year,prof] = fzero(fc,5); % 5 is a guess
PayBackPeriod_Plant_F_Carbon_Fee = year;

Av_prof = sum(CF_Carbon)/28; % Average Profit
Inv = (cc); % Investment

ROI=Av_prof/Inv; % Return on Investment
ROI_Plant_F_Carbon_Fee = ROI*100;

[xval,fval] = fzero(@(x)(CF_Carbon'*(1+x).^-(0:length(CF_Carbon')-1).'), 3);

IRR = xval;
IRR_Plant_F_Carbon_Fee = IRR*100; % Percent
pause
pause



% H Plant



c = 1760; % [MW] H plant capacity
eta = .626; % Thermal efficiency
cc = 2376;  % [M$] construction cost

e_py = c * c_f * 365 * 24 * PPA * 1000; % [$] earned per year

qinc = c * c_f * 81891387.76 * 365 /eta; % BTUs produced in 1 year

cof = (qinc/1000000) * fcc; % [$] cost of fuel per year
c02 = (qinc/1000000) * c02e; % [lbs] of c02 per year
cfc = (cf/2000) * c02; % [$] carbon fee per year

net_e = (e_py - cof)/1000000; % [M$] Net earned per year (no carbon fee)
net_e_cf = net_e - (cfc/1000000); % [M$] Net earned per year (with carbon fee)


% Without Carbon Fee
CF_Carbon = [-.3*cc;-.3*cc;-.2*cc;-.3*cc;net_e.*ones(25,1)];
i = [0:28]';
PV_C = CF_Carbon./(1+.1).^i; % Present Value Assuming 10% interest rate
NPV_Carbon = sum(PV_C); %[M$] Net Present Value (w/C02 tax)
NPV_Plant_H = NPV_Carbon;

Cum_cash(1)=CF_Carbon(1); %Cumulative Cash w/ carbon fee
	for k=2:29;
    	Cum_cash(k)=Cum_cash(k-1)+CF_Carbon(k);
    end

x_ptsHN = 0:28;  %x values
y_ptsHN = Cum_cash; %y values
fc = @(x)interp1(x_ptsHN,y_ptsHN,x,'linear');
%find where the interpolation yields zero.
[year,prof] = fzero(fc,5); % 5 is a guess
PayBackPeriod_Plant_H = year;

Av_prof = sum(CF_Carbon)/28; % Average Profit
Inv = (cc); % Investment

ROI=Av_prof/Inv; % Return on Investment
ROI_Plant_H = ROI*100;

[xval,fval] = fzero(@(x)(CF_Carbon'*(1+x).^-(0:length(CF_Carbon')-1).'), 3);

IRR = xval;
IRR_Plant_H = IRR*100; % Percent



% With Carbon Fee
CF_Carbon = [-.3*cc;-.3*cc;-.2*cc;-.3*cc;net_e_cf.*ones(25,1)];
i = [0:28]';
PV_C = CF_Carbon./(1+.1).^i; % Present Value Assuming 10% interest rate
NPV_Carbon = sum(PV_C); %[M$] Net Present Value (w/C02 tax)
NPV_Plant_H_Carbon_Fee = NPV_Carbon;

Cum_cash(1)=CF_Carbon(1); %Cumulative Cash w/ carbon fee
	for k=2:29;
    	Cum_cash(k)=Cum_cash(k-1)+CF_Carbon(k);
    end

x_ptsH = 0:28;  %x values
y_ptsH = Cum_cash; %y values
fc = @(x)interp1(x_ptsH,y_ptsH,x,'linear');
figure(3)
plot(x_ptsH,y_ptsH,x_ptsHN,y_ptsHN)
grid on
title('Cumulative Cash Flow diagram for Plant H (w/Carbon Fee)')
xlabel('Years')
ylabel('Millions of Dollars')
legend('W/ Carbon Fee','W/o Carbon Fee')
%find where the interpolation yields zero.
[year,prof] = fzero(fc,5); % 5 is a guess
PayBackPeriod_Plant_H_Carbon_Fee = year;

Av_prof = sum(CF_Carbon)/28; % Average Profit
Inv = (cc); % Investment

ROI=Av_prof/Inv; % Return on Investment
ROI_Plant_H_Carbon_Fee = ROI*100;

[xval,fval] = fzero(@(x)(CF_Carbon'*(1+x).^-(0:length(CF_Carbon')-1).'), 3);

IRR = xval;
IRR_Plant_H_Carbon_Fee = IRR*100; % Percent
pause


% Outputs

NPV_Plant_E
NPV_Plant_E_Carbon_Fee
PayBackPeriod_Plant_E
PayBackPeriod_Plant_E_Carbon_Fee
ROI_Plant_E
ROI_Plant_E_Carbon_Fee
IRR_Plant_E
IRR_Plant_E_Carbon_Fee

NPV_Plant_F
NPV_Plant_F_Carbon_Fee
PayBackPeriod_Plant_F_Carbon_Fee
PayBackPeriod_Plant_F
ROI_Plant_F
ROI_Plant_F_Carbon_Fee
IRR_Plant_F
IRR_Plant_F_Carbon_Fee

NPV_Plant_H
NPV_Plant_H_Carbon_Fee
PayBackPeriod_Plant_H
PayBackPeriod_Plant_H_Carbon_Fee
ROI_Plant_H
ROI_Plant_H_Carbon_Fee
IRR_Plant_H
IRR_Plant_H_Carbon_Fee

figure(4)
plot(x_ptsE,y_ptsE,x_ptsF,y_ptsF,x_ptsH,y_ptsH)
grid on
title('Cumulative Cash Flow for all Plants (w/Carbon Fee)')
xlabel('Years')
ylabel('Millions of Dollars')
legend('Plant E', 'Plant F', 'Plant H')

figure(5)
plot(x_ptsEN,y_ptsEN,x_ptsFN,y_ptsFN,x_ptsHN,y_ptsHN)
grid on
title('Cumulative Cash Flow for all Plants (w/o Carbon Fee)')
xlabel('Years')
ylabel('Millions of Dollars')
legend('Plant E', 'Plant F', 'Plant H')