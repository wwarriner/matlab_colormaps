function c = diverging_gwr(m)

if nargin < 1
    m = 256;
end

assert(isnumeric(m));
assert(isscalar(m));
assert(isreal(m));
assert(isfinite(m));
assert(mod(m, 1) == 0);
assert(1 <= m);

g = [0.085 0.532 0.201];
r = [0.758 0.214 0.233];
w = [0.865 0.865 0.865];
c = diverging_map(m, g, r, 0.5, w);

end

