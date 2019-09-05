%  Program to Convert SCFA with flux Values to Binary 
load('Total_SCF_Prodn_max.mat');

% Rounding off to 2 decimals
for org=1:size(Total_SCF_Prodn_max,1)
    for niches=1:size(Total_SCF_Prodn_max,2)
       SCF_Round_off_Bif_All_Env{org,niches}= round(Total_SCF_Prodn_max{org,niches},2);

    end
end

%  Replacing []  with zero

tf = cellfun('isempty',SCF_Round_off_Bif_All_Env);
SCF_Round_off_Bif_All_Env(tf) = {0}   ; 


% Converting nonzero values to 1

for j=1:length(SCF_Round_off_Bif_All_Env)
    for k=1:size(SCF_Round_off_Bif_All_Env,2)
    
    Binary_SCF{j,k}=SCF_Round_off_Bif_All_Env{j,k}~=0;
end
end