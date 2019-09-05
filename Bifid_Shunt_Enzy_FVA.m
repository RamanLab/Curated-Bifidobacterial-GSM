% Program to compute FVA on Bifid Shunt Pathway to identify the conserved
% and non-conserved reactions
clc
clear

Saccharides=importdata('30_Saccharides.txt');
Universal_CDM=importdata('Final_media_without_C_source.txt');
Bif_major_enzymes=importdata('Bifid_Shunt_Enzymes.txt');

folder = 'Curated_Bif_Models';
Files = get_model_names('Curated_Bif_Models');
cd(folder);

for Org=1:size(Files,1)
    
    load(strtrim(Files(Org,:)));
    model.csense = char('E' * ones(1,numel(model.mets))).';

   
   model.c(find(model.c ~= 0)) = 1;
   model.lb(printUptakeBound(model))=0;
   model = changeRxnBounds(model,Universal_CDM,-1 ,'l');
    
    
   Bifid_Major_Enzy{Org,1}=findRxnIDs(model,Bif_major_enzymes);
    
    
   for C_source=1:length(Saccharides)
      
        Rxn_ID(Org,C_source)= findRxnIDs(model,Saccharides(C_source));
        
        New_model=model;

        if(Rxn_ID(Org,C_source)~=0)
            
        New_model.lb(Rxn_ID(Org,C_source))=-10;
            
        else
            
        end
        
        
          Fix_Biomass_Growth(Org,C_source)= optimizeCbModel(New_model,'max','one');
          Biomass_Growth(Org,C_source)= Fix_Biomass_Growth(Org,C_source).f;
          Biomass_Growth=round(Biomass_Growth,2,'decimal');

                          
                       if (Biomass_Growth(Org,C_source)~=0)

[minFlux_Bifid_Shunt{Org,C_source},maxFlux_Bifid_Shunt{Org,C_source}] =fluxVariability(New_model,100,'max',New_model.rxns(Bifid_Major_Enzy{Org,1}));
        
        
end
end
end



max_Flux = cellfun('isempty',maxFlux_Bifid_Shunt); % true for empty cells
maxFlux_Bifid_Shunt(max_Flux) = {0}   ;  % replace by a cell with a zero 

min_Flux = cellfun('isempty',minFlux_Bifid_Shunt); % true for empty cells
minFlux_Bifid_Shunt(min_Flux) = {0}   ;  % replace by a cell with a zero 




