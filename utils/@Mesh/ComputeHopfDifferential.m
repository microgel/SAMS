function mu = ComputeHopfDifferential(G,K)
% Computes Hopf differential, complex valued curvature from surface
% geometry
% G is the original mesh, K is the uniformized mesh. All arguments required
% Adapted from code from Ronald Lui
F=G.F;
KV=K.V;
if ~all(F(:)==K.F(:)) % if faces are not the same
    error('G and K have different topology.');
end
if any(K.V(3,:)) % Graph is not planar
    error('K is not planar.');
end

f=(KV(1,:)+1i*KV(2,:)).';
[gradx,grady] = ComputeGradientMatrix(G);
dz=   0.5*(gradx-1i*grady);
dzbar=0.5*(gradx+1i*grady);
mu=(dzbar*f)./(dz*f);
end

