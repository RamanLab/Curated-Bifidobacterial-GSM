% Generate clustergram as PDF

load('Specific_Growth.mat');

Specific_Growth=Specific_Growth~=0;
Specific_Growth=double(Specific_Growth);

C_sources={'D\_Glucose';'D\_Fructose';'N\_ACNAM';'N\_ACGAM';'D\_Galactose';'Ribose';'D\_Xylose';'L\_Arabinose';'D\_Glucosamine';'D\_Mannose';'D\_Mannitol';'Salicin';'Maltose';'Lactose';'Sucrose';'Cellobiose';'Trehalose';'Melibiose';'Maltotriose';'Amylose';'Starch\_str\_1';'Starch\_str\_2';'Starch';'Maltohexaose';'Amylopectin';'Xylan';'Inulin';'Arab\_triose';'Arab\_galactan';'Arab\_ xylan'};
Org_Name= {'{\it B. adolescentis} ATCC 15703';'{\it B. angulatum} DSM 20098';'{\it B. animalis lactis} BB. 12';'{\it B. animalis lactis} Bi 07';'{\it B. animalis lactis} Bl 04 ATCC SD5219 ';'{\it B. animalis lactis} CNCM I 2494';'{\it B. animalis lactis} DSM 10140';'{\it B. animalis lactis} V9';'{\it B. bifidum} BGN4';'{\it B. bifidum} NCIMB 41171';'{\it B. bifidum} PRL2010';'{\it B. boum} DSM 20432';'{\it B. breve} UCC2003 NCIMB8807';'{\it B. catenulatum} DSM 16992';'{\it B. coryneforme} DSM 20216';'{\it B. dentium} ATCC 27678';'{\it B. gallicum} DSM 20093 ';'{\it B. kashiwanohense} DSM 21854';'{\it B. longum} DJO10A';'{\it B. longum} E18';'{\it B. longum} NCC2705';'{\it B. longum infantis} 157F NC';'{\it B. longum infantis} ATCC 15697';'{\it B. longum longum} ATCC 55813';'{\it B. longum longum} BBMN68';'{\it B. longum longum} CCUG 52486';'{\it B. longum longum} JCM 1217';'{\it B. longum longum} JDM301';'{\it B. mongoliense} DSM 21395';'{\it B. pseudocatenulatum} DSM 20438';'{\it B. pseudolongum subsp} DSM 20099';'{\it B. ruminantium} DSM 6489';'{\it B. scardovii} JCM 12489';'{\it B. stercoris} JCM 15918';'{\it B. thermacidophilum subsp} DSM 15837';'{\it B. thermophilum} RBL67'};

map= [1 1 1  
      1 1 1
      0 0 1];
cg = clustergram(Specific_Growth,'RowLabels',Org_Name, 'ColumnLabels',C_sources,'Colormap',map);

plot(cg)

set(gcf,'PaperOrientation','landscape','PaperUnits','normalized','PaperPosition', [0 0 0.1 0.1]);
print('Fig 1','-dpdf','-r600','-bestfit')
 