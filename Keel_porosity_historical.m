% Figure - historical observations of ridge keel porosity
clear; close all; clc

seasonStartMonth = 8;   % e.g. August
seasonStartDay   = 15;  % e.g. 15th
iceSeasonDay = @(t) days(t - datetime( ...
    year(t) - (month(t) < seasonStartMonth | ...
              (month(t)==seasonStartMonth & day(t)<seasonStartDay)), ...
    seasonStartMonth, seasonStartDay));

T = table;

% Datasets
% Hoyland 2002
meta.author = "Høyland, 2002";
meta.name = "Simulations of the consolidation process in first-year sea ice ridges";
meta.url = "https://doi.org/10.1016/S0165-232X(02)00002-2";

t  = datetime({'02-Mar-1998','10-Mar-1999'});
hi = [0.95 0.70];       % initial level ice thickness, m
hc = [1.19 0.91];       % initial consolidated layer thickness, m
hk = [4.4  5.0];          % keel depth, m
pr = [0.325 0.35];      % rubble porosity
pk = pr .* (hk - hc) ./ hk;  % keel-average porosity incl. CL

T = addData(T,t,pk,hk,pr,meta);

% Bonnemaire et al., 2003
meta.author = "Bonnemaire et al., 2003";
meta.name = "Barents Sea ridge";
meta.url = "https://poac.com/PapersOnline.html";

t  = datetime('06-May-2002');
hi = 1.35;    % level ice thickness, m
hc = 1.90;    % consolidated layer thickness, m
hk = 15.0;    % keel depth, m
pr = 0.297;   % rubble porosity
pt = 0.24;    % total ridge porosity
ps = 0.153;   % sail porosity
pk = pr .* (hk - hc) ./ hk;  % keel-average porosity

T = addData(T,t,pk,hk,pr,meta);

% Kharitonov, 2005
meta.author = "Kharitonov, 2005";
meta.name = "Peculiarities of Fractional Composition of the Pechora Sea First-Year Ridges";
meta.url = "https://poac.com/PapersOnline.html";

t  = datetime('15-Apr-1999');  % measurement period: April 1999
hi = 0.70;                     % level ice thickness, m
hc = 0.54;                     % refrozen layer, used as CL analogue, m
hk = 6.09;                     % mean keel depth, m
pk = 0.17;                     % total ridge / bulk porosity
pr = pk .* hk ./ (hk - hc);     % rubble porosity assuming zero porosity in CL

T = addData(T,t,pk,hk,pr,meta);

% Kharitonov & Morev, 2005
meta.author = "Kharitonov & Morev, 2005";
meta.name = "Central Arctic ridge observations";
meta.url = "https://poac.com/PapersOnline.html";

t  = repmat(datetime(2004,9,6),3,1);  % 5-9 Sep 2004, midpoint
pk = [0.12 0.16 0.15];               % void fraction in keel
hk = [3.82 5.95 4.98];  % average keel draft (Table 2)
pr = pk;   % best available representation

T = addData(T,t,pk,hk,pr,meta);

% Hoyland, 2007
meta.author = "Høyland, 2007";
meta.name = "Morphology and small-scale strength of ridges in the North-Western Barents Sea";
meta.url = "https://doi.org/10.1016/j.coldregions.2006.10.010";

t  = datetime({'15-Mar-2002','15-Mar-2003','15-Mar-2004','15-Mar-2005'}); % Measurement periods (approximate, based on campaign years)
hk = [8.3 6.2 7.6 7.1];   % keel depth (m) Table 1 values
hc = [2.7 1.5 2.9 2.0];   % consolidated layer thickness (m) Table 1 values
pr = [0.30 0.10 0.36 0.45]; % Rubble porosity (Appendix table, η_r)
pk = pr .* (hk - hc) ./ hk; % Compute keel-average porosity
T = addData(T,t,pk,hk,pr,meta);

% Strub-Klein et al., 2009
meta.author = "Strub-Klein et al., 2009";
meta.name = "Ridge porosity observations";
meta.url = "https://poac.com/PapersOnline.html";

t  = [datetime(2008,5,1); datetime(2008,9,7)];
pk = [0.275; 0.1157];  % keel macroporosity
pr = [0.275; 0.1157];   % same: reported as keel/rubble macroporosity
hk     = [8.0; 4.33];   % mean keel depth (approx)
hk_max = [8.20; 5.03];  % max keel depth

T = addData(T,t,pk,hk,pr,meta);

% Kharitonov, 2012
meta.author = "Kharitonov, 2012";
meta.name = "Internal structure and porosity of ice ridges investigated at «North Pole‐38» drifting station";
meta.url = "https://doi.org/10.1016/j.coldregions.2012.05.018";

t  = datetime({'08-Apr-2011','24-May-2011','04-Jun-2011'});  % midpoints of measurement periods
hi = [1.02 1.7 1.7];         % level ice thickness, m; R1 range 0.86-1.18, mean approximated as 1.02
hc = [3.00 5.4 1.8];         % consolidated layer thickness, m
hk = [6.67 12.65 9.40];      % mean keel depth, m
pk = [0.18 0.08 0.09];       % keel porosity incl. CL
pr = hk ./ (hk - hc) .* pk;  % derived rubble porosity

T = addData(T,t,pk,hk,pr,meta);

% Sand et al., 2015
meta.author = "Sand et al., 2015";
meta.name = "ColdTech field data";
meta.url = "https://poac.com/PapersOnline.html";

t  = datetime({'19-Mar-2011';'29-Mar-2011';'14-Mar-2012';'27-Apr-2013';'28-Apr-2013';'29-Apr-2013'});
pk = [0.11; 0.13; 0.06; 0.04; 0.14; 0.16];  % keel macroporosity / void fraction
pr = pk;  % rubble porosity (same definition in this dataset)
hk = 0.59 * [5.1; 6.8; 6.7; 3.4; 6.8; 7.6];        % max keel depth (Table 2) + Hk_avg ≈ 0.59 Hk_max (Strub-Klein & Sudom, 2012)

T = addData(T,t,pk,hk,pr,meta);

% Bonath 2018
meta.author = "Bonath, 2018";
meta.name = "Morphology, internal structure and formation of ice ridges in the sea around Svalbard";
meta.url = "https://doi.org/10.1016/j.coldregions.2018.08.011";

t  = datetime({'29-Mar-2011','29-Mar-2011','29-Mar-2011','14-Mar-2012','14-Mar-2012','14-Mar-2012','28-Apr-2013','28-Apr-2013','28-Apr-2013'});
hi = [0.80 0.94 1.14 0.64 0.62 0.62 0.62 0.67 0.67];  % level ice thickness, m
hc = [2.02 2.82 1.64 1.36 1.84 1.85 1.33 1.73 1.92];  % consolidated layer thickness, m
pk = [0.05 0.02 0.01 0.03 0.06 0.05 0.02 0.08 0.12];  % keel macroporosity
pr = [0.31 0.22 0.20 0.27 0.34 0.31 0.19 0.38 0.51];  % rubble porosity
hk = 0.59 * [5.1 5.1 5.1 6.7 6.7 6.7 6.8 6.8 6.8];    % max keel depth per ridge + Hk_avg = 0.59 Hk_max (Strub-Klein & Sudom, 2012)
pk = pr .* (hk - hc) ./ hk;  % keel-average porosity (Estimated as reported keel porosity seems too low)

T = addData(T,t,pk,hk,pr,meta);

% Ervik, N-ICE 2018
meta.author = "Ervik et al., 2018";
meta.name = "On the decay of first-year ice ridges: Measurements and evolution of rubble macroporosity, ridge drilling resistance and consolidated layer strength";
meta.url = "https://doi.org/10.1016/j.coldregions.2018.03.024";

t  = datetime({'22-May-2015','03-Jun-2015','24-May-2015','31-May-2015','10-Jun-2015','12-Jun-2015'});
hi = [1.40 1.24 1.30 1.30 0.64 0.64];  % level ice thickness, m; check source, not from Ervik Table 2
hc = [2.50 2.70 0.80 0.80 2.30 3.00];  % consolidated layer thickness from drilling, m
hk = [10.8 10.6 3.2 3.3 4.8 7.3];     % maximum keel depth, m
pk = [0.06 0.06 0.12 0.04 0.08 0.08];  % keel macroporosity incl. CL
pr = [0.11 0.10 0.25 0.16 0.22 0.27];  % rubble macroporosity

T = addData(T,t,pk,hk,pr,meta);

% Salganik et al., 2023
meta.author = "Salganik et al., 2023";
meta.name = "Different mechanisms of Arctic first-year sea-ice ridge consolidation observed during the MOSAiC expedition";
meta.url = "https://doi.org/10.1525/elementa.2023.00008";

t  = datetime({'05-Feb-2020','26-Jul-2020'});
hi = [1.17 1.07];  % level ice thickness at coring site, m
hc = [1.70 3.90];  % consolidated layer thickness, mean ridge values, m
hk = [5.60 4.70];  % mean keel depth, m
pr = [0.29 0.15];  % rubble macroporosity; summer value = max flank / remaining rubble
pk = [0.22 0.03];  % total keel macroporosity incl. CL; summer all-transect mean

T = addData(T,t,pk,hk,pr,meta);

% Guzenko et al., 2025
meta.author = "Guzenko et al., 2025";
meta.name = "Formation and Consolidation of a First-year Ridge Based on Nine Months of Observations at the Drifting Station 'North Pole-41'";
meta.url = "https://doi.org/10.17736/ijope.2025.jc943";

t  = datetime({'15-May-2020','05-Jul-2020','01-Aug-2020','15-May-2020','05-Jul-2020','01-Aug-2020','15-May-2020','05-Jul-2020','01-Aug-2020'});
hc = [2.45 2.65 2.34 2.58 2.95 2.64 2.29 2.75 2.46];           % consolidated layer thickness, m
cl_hi = [1.4 1.5 1.5 1.5 1.6 1.7 1.3 1.5 1.6];                 % CL / level ice thickness
hi = hc ./ cl_hi;                                               % derived level ice thickness, m
hk = [2.81 2.89 2.17 3.75 3.65 2.34 3.82 3.43 2.30];           % keel thickness / draft, m
pr = [0.020 0.022 0.000 0.121 0.302 0.000 0.111 0.066 0.000];  % rubble porosity
pk = pr .* (hk - hc) ./ hk;                                     % keel-average porosity incl. CL

T = addData(T,t,pk,hk,pr,meta);

% Guzenko et al., 2026
meta.author = "Guzenko et al., 2026";
meta.name = "Morphometry and internal structure of large ice ridges and stamukhas in the Kara, Laptev and East Siberian seas";
meta.url = "https://doi.org/10.1016/j.joes.2026.03.004";

t  = datetime({'13-Apr-2014','12-Apr-2015','28-Apr-2014','02-Jun-2015','13-May-2014','15-May-2015','23-May-2014','07-May-2015','30-Mar-2017','25-Mar-2017'},'InputFormat','dd-MMM-yyyy');
hi = [0.89 0.94 1.51 1.38 0.97 1.15 1.46 1.55 1.76 1.65];  % level ice thickness, m
hc = [1.54 1.39 1.96 2.18 1.69 2.16 3.02 2.61 2.51 2.38];  % consolidated layer thickness, m
pr = [0.24 0.31 0.28 0.25 0.36 0.26 0.27 0.25 0.29 0.20];  % rubble porosity
hk = [5.12 4.88 6.21 6.80 5.02 5.45 5.68 5.71 4.33 5.58];  % keel thickness / draft, m
pk = pr .* (hk - hc) ./ hk;                                 % keel-average porosity incl. CL

T = addData(T,t,pk,hk,pr,meta);

T.xseason = iceSeasonDay(T.time);
T.source  = T.author;
load lipari.mat; cmap = lipari;

%% Predictive model: parameterization plot

validModel = ~isnan(T.pk) & ~isnan(T.hk) & T.pk >= 0;
M = T(validModel,:);

x = M.xseason;
h = M.hk;
p = M.pk;

pmax = 0.30;

% Model:
% pk = (b1 + b2*hk) * exp(-b3 * max(0, xseason - tb))
% bounded between 0 and pmax
modelFun = @(b,xh) min(pmax, max(0, ...
    (b(1) + b(2).*xh(:,2)) .* ...
    exp(-b(3).*max(0,xh(:,1)-b(4))) ));

X = [x h];

% Initial guesses: [intercept, depth slope, decay rate, breakpoint]
b0 = [0.00 0.04 0.005 260];

mdl = fitnlm(X,p,modelFun,b0);

disp(mdl)

b = mdl.Coefficients.Estimate;

tb = b(4);
t_break = datetime(2019,seasonStartMonth,seasonStartDay) + days(tb);

fprintf('Estimated breakpoint: seasonal day %.1f = %s\n', ...
    tb, datestr(t_break,'dd-mmm'));

modelEval = @(x,h) min(pmax, max(0, ...
    (b(1) + b(2).*h) .* exp(-b(3).*max(0,x-b(4))) ));

% Seasonal axis
t0 = datetime(2019,seasonStartMonth,seasonStartDay);

tTicks = datetime(2019,9,1):calmonths(2):datetime(2020,9,1);
xTicks = days(tTicks - t0);
xTickLabels = cellstr(datestr(tTicks,'mmm'));

xLimSeason = [0 days(datetime(2020,9,1)-t0)];

% Load lipari colormap if needed
if ~exist('cmap','var')
    load lipari.mat
    if exist('lipari','var')
        cmap = lipari;
    else
        vars = whos;
        cmap = eval(vars(1).name);
    end
end

% Shared color mapping
xCLim = xLimSeason;
hCLim = [min(h) max(h)];

mapToCmap = @(val,clim,cmap) interp1( ...
    linspace(clim(1),clim(2),size(cmap,1)), ...
    cmap, ...
    min(max(val,clim(1)),clim(2)) );

% Selected parameter lines
selDates = datetime(2020,[3 5 6 7 8],1);
selDays  = days(selDates - t0);
selLabs  = {'Mar','May','Jun','Jul','Aug'};

selH = [3 5 7 9];

figParam = figure;
tl = tiledlayout(1,2,'TileSpacing','compact','Padding','compact');

% ── Panel 1: porosity vs keel depth for selected months ───────────────────
ax1 = nexttile;
hold(ax1,'on'); box(ax1,'on')

hPlot = linspace(min(h),max(h),200);

for i = 1:numel(selDays)
    pLine = modelEval(selDays(i),hPlot);
    thisColor = mapToCmap(selDays(i),xCLim,cmap);

    plot(ax1,hPlot,pLine,'LineWidth',2.0, ...
         'Color',thisColor, ...
         'DisplayName',selLabs{i});
end

scatter(ax1,h,p,32,x,'o','filled', ...
        'MarkerEdgeColor',[0.35 0.35 0.35], ...
        'LineWidth',0.4, ...
        'HandleVisibility','off');

colormap(ax1,cmap)
clim(ax1,xCLim)

cb1 = colorbar(ax1);
cb1.Label.String = 'Seasonal day';

ylim(ax1,[0 0.4])
xlim(ax1,[min(h) max(h)])

xlabel(ax1,'Average keel depth, m')
ylabel(ax1,'Keel macroporosity, {\it p_k}')
title(ax1,'a) Depth dependence')

legend(ax1,'Location','northwest','Box','off','NumColumns',2)

% ── Panel 2: porosity vs seasonal day for selected keel depths ─────────────
ax2 = nexttile;
hold(ax2,'on'); box(ax2,'on')

xPlot = linspace(xLimSeason(1),xLimSeason(2),300);

for i = 1:numel(selH)
    pLine = modelEval(xPlot,selH(i));
    thisColor = mapToCmap(selH(i),hCLim,cmap);

    plot(ax2,xPlot,pLine,'LineWidth',2.0, ...
         'Color',thisColor, ...
         'DisplayName',sprintf('h_k = %.0f m',selH(i)));
end

scatter(ax2,x,p,32,h,'o','filled', ...
        'MarkerEdgeColor',[0.35 0.35 0.35], ...
        'LineWidth',0.4, ...
        'HandleVisibility','off');

colormap(ax2,cmap)
clim(ax2,hCLim)

cb2 = colorbar(ax2);
cb2.Label.String = 'Keel depth, m';

xline(ax2,tb,'--k',datestr(t_break,'dd-mmm'), ...
      'LabelOrientation','horizontal', ...
      'LabelVerticalAlignment','bottom', ...
      'HandleVisibility','off');

xticks(ax2,xTicks)
xticklabels(ax2,xTickLabels)
xtickangle(ax2,0)

xlim(ax2,xLimSeason)
ylim(ax2,[0 0.4])

xlabel(ax2,'Seasonal day')
ylabel(ax2,'Keel macroporosity, {\it p_k}')
title(ax2,'b) Seasonal evolution')

legend(ax2,'Location','northwest','Box','off','NumColumns',2)

figParam.Units = 'inches';
figParam.Position = [3 3 10.5 4.5];

% exportgraphics(figParam,'Historical_keel_porosity_parameterization_lines.png','Resolution',300);

%% Figure 2: keel porosity vs time
fig = figure; hold on; box on

% ── 0. Reference line ────────────────────────────────────────────────────────
yline(0, '--', 'Color', [0.8 0.8 0.8], 'LineWidth', 1, 'HandleVisibility', 'off');

% ── 1. Compute per-bin statistics (single pass; reused for plot + table) ─────
t0 = datetime(2019,seasonStartMonth,seasonStartDay);
tBinEdges = [datetime(2019,8,15), ...
             datetime(2019,9:12,1), ...
             datetime(2020,1:8,1), ...
             datetime(2020,9,1)]; 
binEdges = days(tBinEdges - t0);
minN  = 3;
gap   = 1;   % visual gap between monthly boxes, days
nBins = numel(binEdges) - 1;

binStats = struct('valid', false, 'label', '', 'xc', NaN, ...
                  'x1', NaN, 'x2', NaN, 'med', NaN, ...
                  'q1', NaN, 'q3', NaN, 'N', 0);
binStats = repmat(binStats, nBins, 1);

for k = 1:nBins
    inBin = T.xseason >= binEdges(k) & T.xseason < binEdges(k+1);
    if sum(inBin) < minN, continue; end
    binStats(k).N = sum(inBin);

    q = quantile(T.pk(inBin), [0.25 0.75]);
    xc = mean(binEdges(k:k+1));

    binStats(k).valid = true;
binStats(k).label = datestr(tBinEdges(k), 'mmm');
binStats(k).xc    = xc;
binStats(k).x1    = binEdges(k)   + gap;
binStats(k).x2    = binEdges(k+1) - gap;
    binStats(k).med   = median(T.pk(inBin), 'omitnan');
    binStats(k).q1    = q(1);
    binStats(k).q3    = q(2);
end

% ── 2. IQR shading + median lines ────────────────────────────────────────────
for k = 1:nBins
    if ~binStats(k).valid, continue; end
    s = binStats(k);

    fill([s.x1 s.x2 s.x2 s.x1], [s.q1 s.q1 s.q3 s.q3], ...
         [0.85 0.85 0.85], 'FaceAlpha', 0.25, 'EdgeColor', 'none', ...
         'HandleVisibility', 'off');

    plot([s.x1 s.x2], [s.med s.med], '-', ...
         'Color', [0.35 0.35 0.35], 'LineWidth', 1.4, 'HandleVisibility', 'off');
end
plot(nan, nan, '-', 'Color', [0.35 0.35 0.35], 'LineWidth', 1.4, ...
     'DisplayName', 'Seasonal median (IQR)');

% ── 3. Per-source scatter ─────────────────────────────────────────────────────
sources  = unique(T.source, 'stable');
nSources = numel(sources);
% Requires linspecer from: https://www.mathworks.com/matlabcentral/fileexchange/42673
C        = linspecer(nSources);
markers  = {'o','s','d','^','v','>','<','p','h'};
msz      = 6;

for i = 1:nSources
    inSrc = T.source == sources(i);
    mk    = markers{mod(i-1, numel(markers)) + 1};

    plot(T.xseason(inSrc), T.pk(inSrc), mk, ...
         'LineStyle', 'none', 'Color', C(i,:), 'DisplayName', sources(i), ...
         'MarkerSize', msz, 'MarkerFaceColor', C(i,:), ...
         'MarkerEdgeColor', [0.7 0.7 0.7], 'LineWidth', 0.5);
end

% ── 4. In-axes statistics table ───────────────────────────────────────────────
valid   = [binStats.valid];
labels  = {binStats(valid).label};
medvals = [binStats(valid).med];
q1vals  = [binStats(valid).q1];
q3vals  = [binStats(valid).q3];
Nvals   = [binStats(valid).N];

x0  = 60;    y0 = 0.13;   dy = 0.015;
col = [0, 30, 55, 100];  % Month | p_k | IQR | N

text(x0+col(1), y0, 'Month', 'FontWeight', 'bold', 'FontSize', 8);
text(x0+col(2), y0, '{\it p_k}', 'FontWeight', 'bold', 'FontSize', 8);
text(x0+col(3), y0, '[IQR]', 'FontWeight', 'bold', 'FontSize', 8);
text(x0+col(4), y0, 'N', 'FontWeight', 'bold', 'FontSize', 8);

for i = 1:numel(labels)
    y = y0 - i*dy;
text(x0+col(1), y, labels{i}, 'FontSize', 8);
text(x0+col(2), y, sprintf('%.2f', medvals(i)), 'FontSize', 8);
text(x0+col(3), y, sprintf('[%.2f %.2f]', q1vals(i), q3vals(i)), 'FontSize', 8);
text(x0+col(4), y, sprintf('%d', Nvals(i)), 'FontSize', 8);
end

% ── 5. Axes formatting & export ───────────────────────────────────────────────
% axis
tTicks = [datetime(2019,9:12,1), ...
          datetime(2020,1:9,1)];   % includes 1 Sep at the end

xTicks = days(tTicks - t0);

xticks(xTicks)
xticklabels({'Sep','Oct','Nov','Dec','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep'})
xlim([0 days(datetime(2020,9,1)-t0)])
ylim([-0.02 0.35])

xlabel('Seasonal day');
ylabel('Keel macroporosity, {\it p_k}')
leg = legend('Location', 'northwest', 'NumColumns', 2, 'FontSize', 7.0, 'Box', 'off');
leg.ItemTokenSize = [30*0.25, 18*0.2];

fig.Units    = 'inches';
fig.Position = [3 3 8 5];
exportgraphics(fig, 'Historical_keel_porosity.png', 'Resolution', 300);

%% Figure 3: Porosity vs time and keel depth
% Seasonal day
seasonStartMonth = 8;
seasonStartDay   = 15;

iceSeasonDay = @(t) days(t - datetime( ...
    year(t) - (month(t) < seasonStartMonth | ...
    (month(t)==seasonStartMonth & day(t)<seasonStartDay)), ...
    seasonStartMonth, seasonStartDay));

T.xseason = iceSeasonDay(T.time);
T.source  = T.author;

% Common seasonal axis
tTicks = datetime(2019,9,1):calmonths(2):datetime(2020,9,1);
t0 = datetime(2019,seasonStartMonth,seasonStartDay);
xTicks = days(tTicks - t0);
xTickLabels = cellstr(datestr(tTicks,'mmm'));

% Monthly statistics for Panel 1 shading
tBinEdges = [datetime(2019,8,15), ...
             datetime(2019,9:12,1), ...
             datetime(2020,1:8,1), ...
             datetime(2020,9,1)];

binEdges = days(tBinEdges - t0);

minN  = 3;
gap   = 1;
nBins = numel(binEdges)-1;

binStats = struct('valid',false,'x1',NaN,'x2',NaN, ...
                  'med',NaN,'q1',NaN,'q3',NaN);
binStats = repmat(binStats,nBins,1);

for k = 1:nBins
    inBin = T.xseason >= binEdges(k) & T.xseason < binEdges(k+1);
    if sum(inBin) < minN, continue; end

    q = quantile(T.pk(inBin),[0.25 0.75]);

    binStats(k).valid = true;
    binStats(k).x1    = binEdges(k)   + gap;
    binStats(k).x2    = binEdges(k+1) - gap;
    binStats(k).med   = median(T.pk(inBin),'omitnan');
    binStats(k).q1    = q(1);
    binStats(k).q3    = q(2);
end

fig2 = figure;
tl = tiledlayout(2,2,'TileSpacing','compact','Padding','compact');

sources  = unique(T.source,'stable');
nSources = numel(sources);
msz      = 46;

% Panel 1: same as old figure, but round markers colored by keel depth
ax1 = nexttile;
hold(ax1,'on'); box(ax1,'on')

yline(ax1,0,'--','Color',[0.8 0.8 0.8],'LineWidth',1,'HandleVisibility','off');

for k = 1:nBins
    if ~binStats(k).valid, continue; end
    s = binStats(k);

    fill(ax1,[s.x1 s.x2 s.x2 s.x1],[s.q1 s.q1 s.q3 s.q3], ...
         [0.85 0.85 0.85],'FaceAlpha',0.25,'EdgeColor','none', ...
         'HandleVisibility','off');

    plot(ax1,[s.x1 s.x2],[s.med s.med],'-', ...
         'Color',[0.35 0.35 0.35],'LineWidth',1.4,'HandleVisibility','off');
end

for i = 1:nSources
    inSrc = T.source == sources(i);

    scatter(ax1,T.xseason(inSrc),T.pk(inSrc),msz,T.hk(inSrc), ...
            'o','filled', ...
            'MarkerEdgeColor',[0.55 0.55 0.55], ...
            'LineWidth',0.5, ...
            'DisplayName',sources(i));
end

colormap(ax1,cmap)
cb1 = colorbar(ax1);
cb1.Label.String = 'Keel depth, m';

xticks(ax1,xTicks)
xticklabels(ax1,xTickLabels)
xlim(ax1,[0 days(datetime(2020,9,1)-t0)])
ylim(ax1,[-0.02 0.35])

xlabel(ax1,'Seasonal day'); xtickangle(0)
ylabel(ax1,'Keel macroporosity, {\it p_k}')
title(ax1,'a) Seasonal evolution')

% leg2 = legend(ax1,'Location','northwest','NumColumns',1,'FontSize',6.5,'Box','off');
% leg2.ItemTokenSize = [8 6];

% Panel 2: keel porosity vs keel depth, color = time
ax2 = nexttile;
hold(ax2,'on'); box(ax2,'on')

validDepth = ~isnan(T.hk) & ~isnan(T.pk);

scatter(ax2,T.hk(validDepth),T.pk(validDepth),msz,T.xseason(validDepth), ...
        'o','filled', ...
        'MarkerEdgeColor',[0.55 0.55 0.55], ...
        'LineWidth',0.5);

colormap(ax2,cmap)
cb2 = colorbar(ax2);
cb2.Label.String = 'Seasonal day';

ylim(ax2,[-0.02 0.35])
xlabel(ax2,'Keel depth, m')
ylabel(ax2,'Keel macroporosity, {\it p_k}')
title(ax2,'b) Depth dependence')

% Panel 3: rubble porosity vs keel depth, color = time
ax3 = nexttile;
hold(ax3,'on'); box(ax3,'on')

validRubble = ~isnan(T.hk) & ~isnan(T.pr);

scatter(ax3,T.hk(validRubble),T.pr(validRubble),msz,T.xseason(validRubble), ...
        '^','filled', ...
        'MarkerEdgeColor',[0.55 0.55 0.55], ...
        'LineWidth',0.5);

colormap(ax3,cmap)
cb3 = colorbar(ax3);
cb3.Label.String = 'Seasonal day';

ylim(ax3,[-0.02 0.55])
xlabel(ax3,'Keel depth, m')
ylabel(ax3,'Rubble macroporosity, {\it p_r}')
title(ax3,'c) Rubble porosity')

% Panel 4: rubble porosity vs seasonal day, color = keel depth
ax4 = nexttile;
hold(ax4,'on'); box(ax4,'on')

scatter(ax4,T.xseason(validRubble),T.pr(validRubble),msz,T.hk(validRubble), ...
        '^','filled', ...
        'MarkerEdgeColor',[0.55 0.55 0.55], ...
        'LineWidth',0.5);

colormap(ax4,cmap)
cb4 = colorbar(ax4);
cb4.Label.String = 'Keel depth, m';

xticks(ax4,xTicks)
xticklabels(ax4,xTickLabels)
xlim(ax4,[0 days(datetime(2020,9,1)-t0)])
ylim(ax4,[-0.02 0.55])

xlabel(ax4,'Seasonal day')
ylabel(ax4,'Rubble macroporosity, {\it p_r}')
title(ax4,'d) Rubble seasonality')
xtickangle(ax4,0)

fig2.Units = 'inches';
fig2.Position = [1 2 10 8];
% exportgraphics(fig2,'Historical_keel_porosity_two_panel.png','Resolution',300);

%% Helpers
function T = addData(T,t,pk,hk,pr,meta)
    n = numel(pk);

    if isempty(hk)
        hk = nan(n,1);
    end
    if isscalar(hk)
        hk = repmat(hk,n,1);
    end

    if isempty(pr)
        pr = nan(n,1);
    end
    if isscalar(pr)
        pr = repmat(pr,n,1);
    end

    Ti = table;
    Ti.time   = t(:);
    Ti.pk     = pk(:);
    Ti.hk     = hk(:);
    Ti.pr     = pr(:);
    Ti.author = repmat(meta.author,n,1);
    Ti.name   = repmat(meta.name,n,1);
    Ti.url    = repmat(meta.url,n,1);

    T = [T; Ti];
end