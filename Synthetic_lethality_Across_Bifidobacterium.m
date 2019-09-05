% Program to Generate single and double lethal in each of the nutrient
% enironment
clc
clear
tic;

Saccharides=importdata('30_Saccharides.txt');
Universal_CDM=importdata('Final_media_without_C_source.txt');

folder = 'Curated_Bif_Models';
Files = get_model_names('Curated_Bif_Models');
cd(folder);


for j=1:size(Files,1)
    
    load(strtrim(Files(j,:)));
    model.csense =char('E' * ones(1,numel(model.mets))).';
 
   
    filename = strtrim(Files(j,:));
    filename = filename(1:end-4);
    
    model.c(find(model.c ~= 0)) = 1;
    model.lb(printUptakeBound(model))=0;
    model = changeRxnBounds(model,Universal_CDM,-1,'l');
    
    elist = model.rxns(find(findExcRxns(model)));
    atp_loc = find(not(cellfun('isempty',strfind(model.rxns, 'DM_atp_c_'))));
    atpm = model.rxns(atp_loc);
    
    
    for m=1:length(Saccharides)
        
        Rxn_ID(j,m) = findRxnIDs(model,Saccharides(m));
        
        
        New_model=model;
        
        if(Rxn_ID(j,m)~=0)
            
            New_model.lb(Rxn_ID(j,m))=-10;
            
            
            Growth_Bif(j,m) = optimizeCbModel(New_model,'max','one');
            
            if(Growth_Bif(j,m).f~=0)
                
                [Bif_all_Env_Jsl{j,m},Bif_all_Env_Jdl{j,m}]=doubleSL(New_model,0.01,elist,atpm);
                
            end
        end
    end
end
toc;





