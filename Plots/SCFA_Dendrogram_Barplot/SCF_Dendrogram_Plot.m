
%  function to compute hamming distance
load('Binary_SCF.mat');
[SCF, d_y]=computeDistBinarySCF(Binary_SCF);


% dendrogram representation of  organism  based on the metabolite
% production

Org_Name={'{\it B. animalis lactis} Bl 04 ATCC SD5219 ';'{\it B. animalis lactis} DSM 10140';'{\it B. animalis lactis} Bi 07';'{\it B. animalis lactis} V9';'{\it B. animalis lactis} BB. 12';'{\it B. animalis lactis} CNCM I 2494';'{\it B. longum} E18';'{\it B. longum longum} BBMN68';'{\it B. longum longum} JCM 1217';'{\it B. scardovii} JCM 12489';'{\it B. longum} NCC2705';'{\it B. longum longum} JDM301';'{\it B. thermacidophilum subsp} DSM 15837';'{\it B. angulatum} DSM 20098';'{\it B. pseudocatenulatum} DSM 20438';'{\it B. gallicum} DSM 20093 ';'{\it B. catenulatum} DSM 16992';'{\it B. longum} DJO10A';'{\it B. longum infantis} 157F NC';'{\it B. longum longum} ATCC 55813';'{\it B. longum longum} CCUG 52486';'{\it B. kashiwanohense} DSM 21854';'{\it B. dentium} ATCC 27678';'{\it B. stercoris} JCM 15918';'{\it B. coryneforme} DSM 20216';'{\it B. boum} DSM 20432';'{\it B. thermophilum} RBL67';'{\it B. ruminantium} DSM 6489';'{\it B. breve} UCC2003 NCIMB8807';'{\it B. adolescentis} ATCC 15703';'{\it B. pseudolongum subsp} DSM 20099';'{\it B. mongoliense} DSM 21395';'{\it B. longum infantis} ATCC 15697';'{\it B. bifidum} BGN4';'{\it B. bifidum} NCIMB 41171';'{\it B. bifidum} PRL2010'};
Org=linkage(squareform(SCF+SCF'));

Org_Classification=dendrogram(Org,0,'ColorThreshold','default');
set(gca, 'XTick', 1:length(Org_Name),'XTickLabel',Org_Name,'FontSize',14,'FontWeight','bold','XTickLabelRotation',45);
set(Org_Classification, 'LineWidth',3)

set(gcf,'PaperOrientation','landscape','PaperUnits','normalized','PaperPosition', [0 0 1 1]);
print('Fig 2','-dpdf','-r600','-bestfit')
