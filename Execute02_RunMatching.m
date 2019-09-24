initialize;
MappingSetup;
load([workingPath 'Flags.mat'])
ExtractInitialMappings;
ComputeFeatureMatching;
Flows = ComputeDirectedFlows(GPDists);      %Will take a while, need to make new method
save([workingPath 'Flows.mat'],'Flows');
MatchesPairsWrapper;

disp('If correspondences are not good, abort and tune parameters via Ctrl+C.')
pause(60);
if Flags('isDisc') == 0
    SetupHypOrb;
    CreateFinalMappingsSphere;
else
    CreateFinalMappingsDisc;
end
