% E Plant
clear
c = 1722; % [MW] E plant capacity
c_f = .53; % Capacity factor
PPA = .51; % [$/KWH] Power Purchase Agreement
eta = .53; % Thermal efficiency
fc = 8.71; % [$/Million BTU] fuel cost
c02e = 117; % [lbs c02/Million BTU] c02 emmisions
cf = 60; % [$/ton c02] carbon fee
cc = 2152.5;  % [M$] construction cost

e_py = c * c_f * 365 * 24 * PPA * 1000; % [$] earned per year

qinc = c * c_f * 81891387.76 * 365 /eta; % BTUs produced in 1 year

cof = (qinc/1000000) * fc; % [$] cost of fuel per year
c02 = (qinc/1000000) * c02e; % [lbs] of c02 per year
cfc = (cf/2000) * c02; % [$] carbon fee per year

net_e = (e_py - cof)/1000000; % [M$] Net earned per year (no carbon fee)
net_e_cf = net_e - (cfc/1000000); % [M$] Net earned per year (with carbon fee)

CF_Carbon = [-.3*cc;-.3*cc;-.2*cc;-.3*cc;net_e_cf.*ones(25,1)];
i = [0:28]';
PV_C = CF_Carbon./(1+.1).^i; % Present Value Assuming 10% interest rate

NPV_Carbon = sum(PV_C); %[M$] Net Present Value (w/C02 tax)

Cum_cash(1)=CF_Carbon(1); %Cumulative Cash w/ carbon fee
	for k=2:29;
    	Cum_cash(k)=Cum_cash(k-1)+CF_Carbon(k);
    end

% With Carbon Fee
x_pts = 0:28;  %x values
y_pts = Cum_cash; %y values
fc = @(x)interp1(x_pts,y_pts,x,'linear'); 
plot(x_pts,y_pts)
title('Cash Flow diagram for Plant E (w/Carbon Fee)')
xlabel('Years')
ylabel('Millions of Dollars')
%find where the interpolation yields zero.
[year,prof] = fzero(fc,5); % 5 is a guess
PayBackPeriod = year
%ROI=Average Profit/ Total Investment
%C=[-10000,-5000,7000,7000,15000];
Av_prof = sum(CF_Carbon)/28;
Inv = (cc);

ROI=Av_prof/Inv; %
ROI_CCGT = ROI*100

[xval,fval] = fzero(@(x)(CF_Carbon'*(1+x).^-(0:length(CF_Carbon')-1).'), 3);

IRR = xval;
IRR_CCGT = IRR*100 % Percent
pause
% F Plant

c = 1512; % [MW] E plant capacity
c_f = .53; % Capacity factor
PPA = .51; % [$/KWH] Power Purchase Agreement
eta = .604; % Thermal efficiency
fc = 8.71; % [$/Million BTU] fuel cost
c02e = 117; % [lbs c02/Million BTU] c02 emmisions
cf = 60; % [$/ton c02] carbon fee
cc = 2041.2;  % [M$] construction cost

e_py = c * c_f * 365 * 24 * PPA * 1000; % [$] earned per year

qinc = c * c_f * 81891387.76 * 365 /eta; % BTUs produced in 1 year

cof = (qinc/1000000) * fc; % [$] cost of fuel per year
c02 = (qinc/1000000) * c02e; % [lbs] of c02 per year
cfc = (cf/2000) * c02; % [$] carbon fee per year

net_e = (e_py - cof)/1000000; % [M$] Net earned per year (no carbon fee)
net_e_cf = net_e - (cfc/1000000); % [M$] Net earned per year (with carbon fee)

CF_Carbon = [-.3*cc;-.3*cc;-.2*cc;-.3*cc;net_e_cf.*ones(25,1)];
i = [0:28]';
PV_C = CF_Carbon./(1+.1).^i; % Present Value Assuming 10% interest rate

NPV_Carbon = sum(PV_C); %[M$] Net Present Value (w/C02 tax)

Cum_cash(1)=CF_Carbon(1); %Cumulative Cash w/ carbon fee
	for k=2:29;
    	Cum_cash(k)=Cum_cash(k-1)+CF_Carbon(k);
    end

% With Carbon Fee
x_pts = 0:28;  %x values
y_pts = Cum_cash; %y values
fc = @(x)interp1(x_pts,y_pts,x,'linear'); 
plot(x_pts,y_pts)
title('Cash Flow diagram for Plant E (w/Carbon Fee)')
xlabel('Years')
ylabel('Millions of Dollars')
%find where the interpolation yields zero.
[year,prof] = fzero(fc,5); % 5 is a guess
PayBackPeriod = year
%ROI=Average Profit/ Total Investment
%C=[-10000,-5000,7000,7000,15000];
Av_prof = sum(CF_Carbon)/28;
Inv = (cc);

ROI=Av_prof/Inv; %
ROI_CCGT = ROI*100

[xval,fval] = fzero(@(x)(CF_Carbon'*(1+x).^-(0:length(CF_Carbon')-1).'), 3);

IRR = xval;
IRR_CCGT = IRR*100 % Percent
pause
% H Plant

c = 1760; % [MW] E plant capacity
c_f = .53; % Capacity factor
PPA = .51; % [$/KWH] Power Purchase Agreement
eta = .626; % Thermal efficiency
fc = 8.71; % [$/Million BTU] fuel cost
c02e = 117; % [lbs c02/Million BTU] c02 emmisions
cf = 60; % [$/ton c02] carbon fee
cc = 2376;  % [M$] construction cost

e_py = c * c_f * 365 * 24 * PPA * 1000; % [$] earned per year

qinc = c * c_f * 81891387.76 * 365 /eta; % BTUs produced in 1 year

cof = (qinc/1000000) * fc; % [$] cost of fuel per year
c02 = (qinc/1000000) * c02e; % [lbs] of c02 per year
cfc = (cf/2000) * c02; % [$] carbon fee per year

net_e = (e_py - cof)/1000000; % [M$] Net earned per year (no carbon fee)
net_e_cf = net_e - (cfc/1000000); % [M$] Net earned per year (with carbon fee)

CF_Carbon = [-.3*cc;-.3*cc;-.2*cc;-.3*cc;net_e_cf.*ones(25,1)];
i = [0:28]';
PV_C = CF_Carbon./(1+.1).^i; % Present Value Assuming 10% interest rate

NPV_Carbon = sum(PV_C); %[M$] Net Present Value (w/C02 tax)

Cum_cash(1)=CF_Carbon(1); %Cumulative Cash w/ carbon fee
	for k=2:29;
    	Cum_cash(k)=Cum_cash(k-1)+CF_Carbon(k);
    end

% With Carbon Fee
x_pts = 0:28;  %x values
y_pts = Cum_cash; %y values
fc = @(x)interp1(x_pts,y_pts,x,'linear'); 
plot(x_pts,y_pts)
title('Cash Flow diagram for Plant E (w/Carbon Fee)')
xlabel('Years')
ylabel('Millions of Dollars')
%find where the interpolation yields zero.
[year,prof] = fzero(fc,5); % 5 is a guess
PayBackPeriod = year
%ROI=Average Profit/ Total Investment
%C=[-10000,-5000,7000,7000,15000];
Av_prof = sum(CF_Carbon)/28;
Inv = (cc);

ROI=Av_prof/Inv; %
ROI_CCGT = ROI*100

[xval,fval] = fzero(@(x)(CF_Carbon'*(1+x).^-(0:length(CF_Carbon')-1).'), 3);

IRR = xval;
IRR_CCGT = IRR*100 % Percent