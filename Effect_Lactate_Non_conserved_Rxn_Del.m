% Program to check for Lactate production upon deletion of Non conserved
% reaction in each of the 30 different Environments
clc
clear

Saccharides=importdata('30_Saccharides.txt');
Universal_CDM=importdata('Final_media_without_C_source.txt');
Conserved_Rxns= importdata('Non_Conserved_Rxns.txt');


SCF={'EX_lac_L(e)'};

folder = 'Curated_Bif_Models';
Files = get_model_names('Curated_Bif_Models');
cd(folder);


for Org=1:size(Files,1)
    
    load(strtrim(Files(Org,:)));
    model.csense = char('E' * ones(1,numel(model.mets))).';
   
    model.lb(printUptakeBound(model))=0;
    model = changeRxnBounds(model,Universal_CDM,-1 ,'l');
    
    SCF_Lac_ID{Org,1}=findRxnIDs(model,SCF);
    
    for C_source=1:length(Saccharides)
        for Bif_enz=1:length(Conserved_Rxns)
            
            Rxn_ID(Org,C_source)= findRxnIDs(model,Saccharides(C_source));
            Bifid_Major_Enzy(Org,Bif_enz)=findRxnIDs(model,Conserved_Rxns(Bif_enz));
            
            New_model=model;
            
            if(Rxn_ID(Org,C_source)~=0)
                
                
               New_model.lb(Rxn_ID(Org,C_source))=-10;
               New_model.lb(Bifid_Major_Enzy(Org,Bif_enz))=0;
                
               Non_conserved_soln{Org,C_source}(Bif_enz,1) = optimizeCbModel(New_model,'max','one');
               Non_Conserved_Del_Gr{Org,C_source}(Bif_enz,1)=Non_conserved_soln{Org,C_source}(Bif_enz,1).f>1e-02;
               
               
               if (Non_conserved_soln{Org,C_source}(Bif_enz,1).f>1e-02)
                    
               [minFlux_19_rxn_Del_Lac{Org,C_source}(Bif_enz),maxFlux_19_rxn_Del_Lac{Org,C_source}(Bif_enz)] =fluxVariability(New_model,100,'max',New_model.rxns(SCF_Lac_ID{Org,1}));
                    
                    
                end
            end
        end
    end
end