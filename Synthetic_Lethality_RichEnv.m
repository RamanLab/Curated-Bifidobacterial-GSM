% Program to Generate single and double lethals in Nutrient Rich Environment
% in 36 strains of Bifidobacterium
clc
clear
tic;

Saccharides=importdata('Rich_media.txt');
Universal_CDM=importdata('Final_media_without_C_source.txt');

% folder = 'Curated_Bif_Models';
% Files = get_model_names('Curated_Bif_Models');
% cd(folder);

folder = 'A';
Files = get_model_names('A');
cd(folder);


for j=1:size(Files,1)
      
    load(strtrim(Files(j,:)));
     model.csense =char('E' * ones(1,numel(model.mets))).';

         
    filename = strtrim(Files(j,:));
    filename = filename(1:end-4);
    
    model.c(find(model.c ~= 0)) = 1;
    model.lb(printUptakeBound(model))=0;
    model = changeRxnBounds(model,Universal_CDM,-1,'l');
    model = changeRxnBounds(model,Saccharides,-10,'l');
    
    %  model.description=filename;
    elist = model.rxns(find(findExcRxns(model)));
    atp_loc = find(not(cellfun('isempty',strfind(model.rxns, 'DM_atp_c_'))));
    atpm = model.rxns(atp_loc);
                           
    Growth_Bif(j,1) = optimizeCbModel(model,'max','one');
           
              
    [Bif_all_RichEnv_Jsl{j,1},Bif_all_RichEnv_Jdl{j,1}]=doubleSL(model,0.01,elist,atpm);
                
end
toc;




