% E Plant
c = 1722; % [MW] E plant capacity
c_f = .53; % Capacity factor
PPA = .05; % [$/KWH] Power Purchase Agreement
eta = .53; % Thermal efficiency
fc = 8.71; % [$/Million BTU] fuel cost
c02e = 117; % [lbs c02/Million BTU] c02 emmisions
cf = 60; % [$/ton c02] carbon fee
cc = 2152.5  % [M$] construction cost

e_py = c * c_f * 365 * 24 * 1000 * PPA; % [$] earned per year

qinc = c * c_f * 81891387.76 * 365 /eta; % BTUs produced in 1 year

cof = (qinc/1000000) * fc; % [$] cost of fuel per year
c02 = (qinc/1000000) * c02e; % [lbs] of c02 per year
cfc = (cf/2000) * c02; % [$] carbon fee per year

net_e = e_py - cof; % Net earned per year (no carbon fee)
net_e_cf = net_e - cfc; % Net earned per year (with carbon fee)

CF = [-.3*cc;-.3*cc;-.2*cc;-.3*cc;net_e.*ones(25,1)];
i = [0:29]';
PV = CF./(1+.07).^i;

NPV_NoCarbon = (sum(PV)/1000000); %[M$] Net Present Value (No C02 tax)

CF_Carbon = [-.3*cc;-.3*cc;-.2*cc;-.3*cc;net_e_cf.*ones(25,1)];
PV_C = CF_Carbon./(1+.07).^i;

NPV_Carbon = (sum(PV_C)/1000000); %[M$] Net Present Value (w/C02 tax)

Cum_cash(1)=CF_Carbon(1);
	for k=3:28;
    	Cum_cash(k)=Cum_cash(k-1)+CF_Carbon(k);
    end


x_pts = 0:27;  %x values
y_pts = Cum_cash; %y values
f = @(x)interp1(x_pts,y_pts,x,'linear'); 
plot(x_pts,y_pts)
%find where the interpolation yields zero.
[year,prof]=fzero(f,10); % 5 is a guess
PayBackPeriod = year
%ROI=Average Profit/ Total Investment
%C=[-10000,-5000,7000,7000,15000];
Av_prof= sum(CF_Carbon)/28;
Inv= (cc);

ROI=Av_prof/Inv; %
ROI_CCGT = ROI*100

[xval,fval] = fzero(@(x)(CF_Carbon'*(1+x).^-(0:length(CF_Carbon')-1).'), 3);

IRR=xval;
IRR_CCGT = IRR*100