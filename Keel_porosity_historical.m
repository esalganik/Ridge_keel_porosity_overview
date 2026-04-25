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

T = addData(T,t,pk,meta);

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

T = addData(T,t,pk,meta);

% Bonath 2018
meta.author = "Bonath, 2018";
meta.name = "Morphology, internal structure and formation of ice ridges in the sea around Svalbard";
meta.url = "https://doi.org/10.1016/j.coldregions.2018.08.011";

t  = datetime({'29-Mar-2011','29-Mar-2011','29-Mar-2011','14-Mar-2012','14-Mar-2012','14-Mar-2012','28-Apr-2013','28-Apr-2013','28-Apr-2013'});
hi = [0.80 0.94 1.14 0.64 0.62 0.62 0.62 0.67 0.67];  % level ice thickness, m
hc = [2.02 2.82 1.64 1.36 1.84 1.85 1.33 1.73 1.92];  % consolidated layer thickness, m
pk = [0.05 0.02 0.01 0.03 0.06 0.05 0.02 0.08 0.12];  % keel macroporosity
pr = [0.31 0.22 0.20 0.27 0.34 0.31 0.19 0.38 0.51];  % rubble porosity

T = addData(T,t,pk,meta);

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

T = addData(T,t,pk,meta);

% Hoyland 2002
meta.author = "Høyland, 2002";
meta.name = "Simulations of the consolidation process in first-year sea ice ridges";
meta.url = "https://doi.org/10.1016/S0165-232X(02)00002-2";

t  = datetime({'02-Mar-1998','10-Mar-1999','25-Feb-1999'});
hi = [0.95 0.70 0.47];       % initial level ice thickness, m
hc = [1.19 0.91 0.50];       % initial consolidated layer thickness, m
hk = [4.4 5.0 4.5];          % keel depth, m
pr = [0.325 0.35 0.38];      % rubble porosity
pk = pr .* (hk - hc) ./ hk;  % keel-average porosity incl. CL

T = addData(T,t,pk,meta);

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

T = addData(T,t,pk,meta);

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

T = addData(T,t,pk,meta);

% Kharitonov, 2005
meta.author = "Kharitonov, 2005";
meta.name = "Peculiarities of Fractional Composition of the Pechora Sea First-Year Ridges";
meta.url = "https://poac.com/PapersOnline.html";

t  = datetime('15-Apr-1999');  % measurement period: April 1999
hi = 0.70;                     % level ice thickness, m
hc = 0.54;                     % refrozen layer, used as CL analogue, m
hk = 6.09;                     % mean keel depth, m
pk = 0.17;                     % total ridge / bulk porosity

T = addData(T,t,pk,meta);

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

T = addData(T,t,pk,meta);

% Strub-Klein et al., 2009
meta.author = "Strub-Klein et al., 2009";
meta.name = "Ridge porosity observations";
meta.url = "https://poac.com/PapersOnline.html";

t  = [datetime(2008,5,1); datetime(2008,9,7)];
pk = [0.275; 0.1157];  % keel macroporosity

T = addData(T,t,pk,meta);

% Kharitonov & Morev, 2005
meta.author = "Kharitonov & Morev, 2005";
meta.name = "Central Arctic ridge observations";
meta.url = "https://poac.com/PapersOnline.html";

t  = repmat(datetime(2004,9,6),3,1);  % 5-9 Sep 2004, midpoint
pk = [0.12 0.16 0.15];               % void fraction in keel

T = addData(T,t,pk,meta);

% Sand et al., 2015
meta.author = "Sand et al., 2015";
meta.name = "ColdTech field data";
meta.url = "https://poac.com/PapersOnline.html";

t  = datetime({'19-Mar-2011';'29-Mar-2011';'14-Mar-2012';'27-Apr-2013';'28-Apr-2013';'29-Apr-2013'});
pk = [0.11; 0.13; 0.06; 0.04; 0.14; 0.16];  % keel macroporosity / void fraction

T = addData(T,t,pk,meta);

T.xseason = iceSeasonDay(T.time);
T.source  = T.author;

% ── Figure setup ─────────────────────────────────────────────────────────────
fig = figure; hold on; box on

% ── 0. Reference line ────────────────────────────────────────────────────────
yline(0, '--', 'Color', [0.8 0.8 0.8], 'LineWidth', 1, 'HandleVisibility', 'off');

% ── 1. Compute per-bin statistics (single pass; reused for plot + table) ─────
binEdges = [0 45 170 210 250 290 330 365];
minN     = 3;
xPad     = 4;
binGap   = 2;
nBins    = numel(binEdges) - 1;

binStats = struct('valid', false, 'label', '', 'xc', NaN, ...
                  'x1', NaN, 'x2', NaN, 'med', NaN, 'q1', NaN, 'q3', NaN);
binStats = repmat(binStats, nBins, 1);

for k = 1:nBins
    inBin = T.xseason >= binEdges(k) & T.xseason < binEdges(k+1);
    if sum(inBin) < minN, continue; end

    q = quantile(T.pk(inBin), [0.25 0.75]);
    xc = mean(binEdges(k:k+1));

    binStats(k).valid = true;
    binStats(k).label = datestr(datetime(2019, 8, 15) + days(xc), 'mmm');
    binStats(k).xc    = xc;
    binStats(k).x1    = max(min(T.xseason(inBin)) - xPad, binEdges(k)   + binGap);
    binStats(k).x2    = min(max(T.xseason(inBin)) + xPad, binEdges(k+1) - binGap);
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

x0  = 50;    y0 = 0.11;   dy = 0.015;
col = [0, 30, 55];  % x offsets: Month | Median | IQR

text(x0+col(1), y0, 'Month', 'FontWeight', 'bold', 'FontSize', 8);
text(x0+col(2), y0, '{\it p_k}',   'FontWeight', 'bold', 'FontSize', 8);
text(x0+col(3), y0, '[IQR]', 'FontWeight', 'bold', 'FontSize', 8);

for i = 1:numel(labels)
    y = y0 - i*dy;
    text(x0+col(1), y, labels{i},                                    'FontSize', 8);
    text(x0+col(2), y, sprintf('%.2f', medvals(i)),                  'FontSize', 8);
    text(x0+col(3), y, sprintf('[%.2f %.2f]', q1vals(i), q3vals(i)), 'FontSize', 8);
end

% ── 5. Axes formatting & export ───────────────────────────────────────────────
xticks(0:30:360);
xticklabels({'Aug','Sep','Oct','Nov','Dec','Jan','Feb','Mar','Apr','May','Jun','Jul','Aug'});
xlim([0 365]);  ylim([-0.02 0.35]);

xlabel('Seasonal day');
ylabel('Keel macroporosity, {\it p_k}')
leg = legend('Location', 'northwest', 'NumColumns', 2, 'FontSize', 7.5, 'Box', 'off');
leg.ItemTokenSize = [30*0.3, 18*0.2];

fig.Units    = 'inches';
fig.Position = [3 3 8 5];
exportgraphics(fig, 'Historical_keel_porosity.png', 'Resolution', 300);

%% Helpers
function T = addData(T, t, pk, meta)
    n  = numel(pk);
    Ti = table;
    Ti.time   = t(:);
    Ti.pk     = pk(:);
    Ti.author = repmat(meta.author, n, 1);
    Ti.name   = repmat(meta.name,   n, 1);
    Ti.url    = repmat(meta.url,    n, 1);
    T = [T; Ti];
end