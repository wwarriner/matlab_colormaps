function c = sinebow(m)
% Credit to Charlie Loyd
% Adapted for MATLAB by William Warriner 2020
% pulled from
% https://basecase.org/env/on-rainbows

if nargin < 1
    m = 256;
end

assert(isnumeric(m));
assert(isscalar(m));
assert(isreal(m));
assert(isfinite(m));
assert(mod(m, 1) == 0);
assert(1 <= m);

h = linspace(0, 1, m);
c = hue_to_rgb(h);
    
end


function rgb = hue_to_rgb(h)

assert(isnumeric(h));
assert(isvector(h));

h = h(:);

h = h + 1/2;
h = -h;
r = sin(pi * h);
g = sin(pi * (h + 1/3));
b = sin(pi * (h + 2/3));
rgb = [r g b] .^ 2;

end
