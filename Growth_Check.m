% Program to compute growth of 36 Bifidobacterial Models in 30
% different Environment

clc
clear

% List of Carbon Sources
Saccharides=importdata('30_Saccharides.txt');
% Universal Media
Universal_CDM=importdata('Final_media_without_C_source.txt');

% Folder with Curated Bifidobacterial Models
folder = 'Curated_Bif_models';
Files = get_model_names('Curated_Bif_models');
cd(folder);


for Org=1:size(Files,1)
    
    load(strtrim(Files(Org,:)));  
    model.csense =char('E' * ones(1,numel(model.mets))).';
    
model.lb(printUptakeBound(model))=0;
model = changeRxnBounds(model,Universal_CDM,-1,'l');


for C_source=1:length(Saccharides)
      
        Rxn_ID(Org,C_source) = findRxnIDs(model,Saccharides(C_source));
        
        New_model=model;
        
         
        if(Rxn_ID(Org,C_source)~=0)
            
            New_model.lb(Rxn_ID(Org,C_source))=-10;
            
        else
            
        end
      
 
     Bif_Growth(Org,C_source)= optimizeCbModel(New_model);

    Specific_Growth(Org,C_source)= Bif_Growth(Org,C_source).f;
        
end
end

Specific_Growth=round(Specific_Growth,2,'decimal');
save('Specific_Growth.mat','Specific_Growth','-double');


