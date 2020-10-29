function c = diverging_gov(m)

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
v = [0.436 0.308 0.631];
w = [0.865 0.865 0.865];
c = diverging_map(m, g, v, 0.5, w);

end

