%Program to Generate HeatMap
h=heatmap(PGK_PGM_PGMT)

h=heatmap(PGK_PGM_PGMT)
h = gca;
h.XData = {'PGK';'PGM';'PGMT'};


h.YDisplayLabels = repmat({''}, size(h.YData));  %remove row labels
a2 = axes('Position', h.Position);               %new axis on top
a2.Color = 'none';                               %new axis transparent
a2.YTick = 1:size(h.ColorData,1);                %set y ticks to number of rows
a2.XTick = [];                                   %Remove xtick
ylim(a2, [0.5, size(h.ColorData,1)+.5])          %center the tick marks
a2.YDir = 'Reverse';                             %flip your y axis to correspond with heatmap's
a2.YTickLabel = {'{\it B. adolescentis} ATCC 15703';'{\it B. angulatum} DSM 20098';'{\it B. animalis lactis} BB. 12';'{\it B. animalis lactis} Bi 07';'{\it B. animalis lactis} Bl 04 ATCC SD5219 ';'{\it B. animalis lactis} CNCM I 2494';'{\it B. animalis lactis} DSM 10140';'{\it B. animalis lactis} V9';'{\it B. bifidum} BGN4';'{\it B. bifidum} NCIMB 41171';'{\it B. bifidum} PRL2010';'{\it B. boum} DSM 20432';'{\it B. breve} UCC2003 NCIMB8807';'{\it B. catenulatum} DSM 16992';'{\it B. coryneforme} DSM 20216';'{\it B. dentium} ATCC 27678';'{\it B. gallicum} DSM 20093 ';'{\it B. kashiwanohense} DSM 21854';'{\it B. longum} DJO10A';'{\it B. longum} E18';'{\it B. longum} NCC2705';'{\it B. longum infantis} 157F NC';'{\it B. longum infantis} ATCC 15697';'{\it B. longum longum} ATCC 55813';'{\it B. longum longum} BBMN68';'{\it B. longum longum} CCUG 52486';'{\it B. longum longum} JCM 1217';'{\it B. longum longum} JDM301';'{\it B. mongoliense} DSM 21395';'{\it B. pseudocatenulatum} DSM 20438';'{\it B. pseudolongum subsp} DSM 20099';'{\it B. ruminantium} DSM 6489';'{\it B. scardovii} JCM 12489';'{\it B. stercoris} JCM 15918';'{\it B. thermacidophilum subsp} DSM 15837';'{\it B. thermophilum} RBL67'};