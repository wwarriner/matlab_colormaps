function c = twilight_shifted(m)
% Idea sources from matplotlib, originally from Bastian Bechtold, see twilight.m
% Adapted for MATLAB by William Warriner 2020

if nargin < 1
    m = 256;
end

assert(isnumeric(m));
assert(isscalar(m));
assert(isreal(m));
assert(isfinite(m));
assert(mod(m, 1) == 0);
assert(1 <= m);

rgb = twilight;
rgb = rgb(1 : end - 1, :);
rgb = circshift(rgb, -128, 1);
rgb(end + 1, :) = rgb(1, :);
rgb = flipud(rgb);

c = distill(rgb, m);

end
