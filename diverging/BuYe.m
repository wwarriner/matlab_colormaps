function c = diverging_bwy(m)

if nargin < 1
    m = 256;
end

assert(isnumeric(m));
assert(isscalar(m));
assert(isreal(m));
assert(isfinite(m));
assert(mod(m, 1) == 0);
assert(1 <= m);

b = [0.217 0.525 0.910];
y = [0.677 0.492 0.093];
w = [0.865 0.865 0.865];
c = diverging_map(m, b, y, 0.5, w);

end

