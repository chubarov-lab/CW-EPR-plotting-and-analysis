clc;
clear;
close all;
%% Load EPR data (input files should be in the same folder as this script)
[xData,  yData]  = eprload('Filename1.DTA');
[xData1, yData1] = eprload('Filename2.DTA');
[xData2, yData2] = eprload('Filename3.DTA');
[xData3, yData3] = eprload('Filename4.DTA');
%% Plot settings
xLimits = [337 349];
yLimits = [-0.15 0.15];
xTicks = 337:3:350;
fontSize = 24;
lineWidth = 1.2;
%% Store data for plotting
xDataAll = {xData, xData1, xData2, xData3};
yDataAll = {yData, yData1, yData2, yData3};
%% Plot and export individual spectra without normalization
for k = 1:4
    fig = figure(k);
    % /10 %Convert magnetic field from Gauss (G) to millitesla (mT)
    plot(xDataAll{k}/10, yDataAll{k}, 'b');
    xlim(xLimits);
    ylim(yLimits);
    xticks(xTicks);
    xlabel('B field [mT]', 'FontSize', fontSize);
    set(gca, 'FontSize', fontSize, 'LineWidth', lineWidth);
    set(gca, 'YColor', 'none');
    grid off;
    % Export figure as TIFF (600 dpi)
    set(fig, 'PaperPositionMode', 'auto');
    print(fig, sprintf('Figure%d.tif', k), '-dtiff', '-r600');
end
%% Plot one Figure with different parameters (optional)
%fig5 = figure(5);
%hold on;
%plot(xData/10,  yData,  'b');
%xlim([337 349]);
%ylim([-0.15 0.15]);
%xticks(337:3:350);
%xlabel('B field [mT]','FontSize',24);
%set(gca,'FontSize',24,'LineWidth',1.2)
%set(gca, 'YColor', 'none');
%grid off;
%set(fig5,'PaperPositionMode','auto');
%print(fig5,'Figure5.tif','-dtiff','-r600');
