clc
clear

Saccharides=importdata('30_Saccharides.txt');
Universal_CDM=importdata('Final_media_without_C_source.txt');
SCF_List=importdata('SCF_List.txt');


% Folder with Curated Bifidobacterial Models
folder = 'Curated_Bifidobacterial_Models';
Files = get_model_names('Curated_Bifidobacterial_Models');
cd(folder);


for Org=1:size(Files,1)
    
    load(strtrim(Files(Org,:)));                
    model.csense = char('E' * ones(1,numel(model.mets))).';

model.lb(printUptakeBound(model))=0;
model = changeRxnBounds(model,Universal_CDM,-1,'l');


    filename = strtrim(Files(Org,:));
    filename = filename(1:end-4);

SCF_id{Org,1}= findRxnIDs(model,SCF_List);


for C_source=1:length(Saccharides)
    
    Rxn_ID(Org,C_source)= findRxnIDs(model,Saccharides(C_source));
    
    New_model=model;
    
    if(Rxn_ID(Org,C_source)~=0)
        
        New_model.lb(Rxn_ID(Org,C_source))=-10;
            else
        
    end
        
        
        Fix_Biomass_Growth= optimizeCbModel(New_model,'max','one');
        Biomass_Growth(Org,C_source)= Fix_Biomass_Growth.f;
        Biomass_Growth=round(Biomass_Growth,2,'decimal');

    
    if (Fix_Biomass_Growth.f>1e-02)

 [Total_SCF_Prodn_min{Org,C_source},Total_SCF_Prodn_max{Org,C_source}] =fluxVariability(New_model,100,'max',New_model.rxns(SCF_id{Org,1}));
    else 
 
                     
% end
end
end 
end



