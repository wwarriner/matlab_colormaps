function c = nuukS(varargin)
%credit to Fabio Crameri, see: http://www.fabiocrameri.ch/colourmaps.php

parsed = mc_input_parse(varargin{:});
m = parsed.m;

rgb = [...
    [0.018013, 0.350759, 0.550621];...
    [0.996243, 0.996171, 0.698978];...
    [0.630330, 0.649163, 0.594880];...
    [0.326271, 0.465925, 0.521293];...
    [0.764075, 0.762421, 0.523289];...
    [0.177458, 0.391784, 0.513049];...
    [0.861512, 0.860452, 0.540887];...
    [0.491529, 0.561375, 0.569911];...
    [0.708812, 0.709534, 0.568766];...
    [0.933100, 0.932200, 0.610780];...
    [0.736247, 0.734937, 0.545368];...
    [0.409218, 0.512981, 0.544212];...
    [0.802191, 0.800830, 0.514461];...
    [0.247844, 0.424274, 0.509654];...
    [0.111530, 0.368473, 0.528660];...
    [0.567427, 0.607888, 0.589076];...
    [0.676996, 0.683188, 0.586270];...
    [0.367501, 0.489060, 0.531815];...
    [0.722948, 0.722327, 0.557351];...
    [0.211608, 0.406770, 0.509516];...
    [0.749600, 0.748000, 0.533633];...
    [0.829003, 0.827817, 0.521841];...
    [0.600848, 0.629364, 0.593876];...
    [0.655625, 0.667078, 0.592201];...
    [0.897426, 0.896421, 0.571595];...
    [0.144686, 0.379151, 0.519678];...
    [0.530693, 0.585077, 0.580845];...
    [0.073701, 0.359182, 0.539198];...
    [0.781043, 0.779497, 0.516019];...
    [0.966076, 0.965459, 0.654183];...
    [0.286174, 0.444150, 0.513674];...
    [0.450777, 0.537224, 0.557322];...
    [0.695057, 0.697744, 0.577758];...
    [0.981443, 0.981063, 0.676508];...
    [0.229427, 0.415209, 0.509106];...
    [0.160967, 0.385187, 0.516015];...
    [0.430056, 0.525086, 0.550751];...
    [0.549422, 0.596618, 0.585361];...
    [0.584599, 0.618823, 0.591946];...
    [0.388342, 0.500959, 0.537855];...
    [0.756623, 0.754973, 0.528201];...
    [0.128323, 0.373600, 0.523925];...
    [0.616108, 0.639492, 0.594855];...
    [0.471298, 0.549333, 0.563759];...
    [0.511351, 0.573311, 0.575664];...
    [0.194305, 0.398958, 0.510850];...
    [0.742865, 0.741355, 0.539408];...
    [0.346799, 0.477365, 0.526255];...
    [0.266757, 0.433929, 0.511179];...
    [0.049338, 0.354908, 0.544840];...
    [0.666762, 0.675347, 0.589592];...
    [0.790986, 0.789529, 0.514339];...
    [0.915496, 0.914534, 0.590402];...
    [0.093625, 0.363683, 0.533770];...
    [0.949988, 0.949200, 0.632179];...
    [0.643489, 0.658356, 0.593978];...
    [0.844633, 0.843518, 0.529830];...
    [0.814834, 0.813567, 0.516827];...
    [0.879265, 0.878238, 0.554923];...
    [0.306067, 0.454839, 0.517072];...
    [0.729654, 0.728619, 0.551380];...
    [0.686388, 0.690633, 0.582290];...
    [0.772146, 0.770535, 0.519134];...
    [0.716043, 0.715996, 0.563175];...
    [0.703111, 0.704568, 0.572773];...
    [0.608614, 0.634489, 0.594485];...
    [0.746207, 0.744643, 0.536499];...
    [0.521092, 0.579218, 0.578325];...
    [0.084046, 0.361406, 0.536460];...
    [0.377914, 0.494993, 0.534782];...
    [0.808328, 0.807015, 0.515329];...
    [0.440432, 0.531151, 0.554040];...
    [0.136500, 0.376327, 0.521730];...
    [0.661315, 0.671269, 0.590991];...
    [0.481447, 0.555359, 0.566883];...
    [0.776480, 0.774894, 0.517432];...
    [0.671988, 0.679316, 0.588014];...
    [0.836643, 0.835499, 0.525456];...
    [0.821730, 0.820503, 0.518989];...
    [0.238555, 0.419670, 0.509259];...
    [0.169188, 0.388418, 0.514450];...
    [0.852937, 0.851853, 0.534973];...
    [0.719530, 0.719173, 0.560283];...
    [0.033826, 0.352811, 0.547716];...
    [0.924378, 0.923444, 0.600430];...
    [0.637043, 0.653816, 0.594542];...
    [0.649688, 0.662780, 0.593195];...
    [0.699151, 0.701189, 0.575319];...
    [0.768018, 0.766385, 0.521095];...
    [0.888327, 0.887307, 0.562964];...
    [0.419650, 0.519033, 0.547467];...
    [0.152787, 0.382103, 0.517778];...
    [0.753066, 0.751437, 0.530868];...
    [0.357142, 0.483182, 0.528972];...
    [0.870305, 0.869266, 0.547548];...
    [0.461063, 0.543281, 0.560560];...
    [0.796417, 0.795008, 0.514147];...
    [0.220468, 0.410915, 0.509193];...
    [0.185830, 0.395300, 0.511845];...
    [0.941643, 0.940794, 0.621377]...
    ];

c = distill(rgb, m);

end