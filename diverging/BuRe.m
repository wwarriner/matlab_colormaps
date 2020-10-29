function c = diverging_bwr(m)

if nargin < 1
    m = 256;
end

assert(isnumeric(m));
assert(isscalar(m));
assert(isreal(m));
assert(isfinite(m));
assert(mod(m, 1) == 0);
assert(1 <= m);

b = [0.230 0.299 0.754];
r = [0.706 0.016 0.150];
w = [0.865 0.865 0.865];
c = diverging_map(m, b, r, 0.5, w);

end

