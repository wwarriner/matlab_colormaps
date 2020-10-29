function c = diverging_vwo(m)

if nargin < 1
    m = 256;
end

assert(isnumeric(m));
assert(isscalar(m));
assert(isreal(m));
assert(isfinite(m));
assert(mod(m, 1) == 0);
assert(1 <= m);

v = [0.436 0.308 0.631];
o = [0.759 0.334 0.046];
w = [0.865 0.865 0.865];
c = diverging_map(m, v, o, 0.5, w);

end

