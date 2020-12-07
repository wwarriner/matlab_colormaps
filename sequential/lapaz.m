function c = lapaz(varargin)
%credit to Fabio Crameri, see: http://www.fabiocrameri.ch/colourmaps.php

parsed = mc_input_parse(varargin{:});
m = parsed.m;

rgb = [...
    [0.103516, 0.047787, 0.393530];...
    [0.104891, 0.053521, 0.396743];...
    [0.106384, 0.059148, 0.399962];...
    [0.107720, 0.064483, 0.403185];...
    [0.109104, 0.069760, 0.406401];...
    [0.110449, 0.074827, 0.409614];...
    [0.111749, 0.079829, 0.412831];...
    [0.113050, 0.084796, 0.416030];...
    [0.114243, 0.089643, 0.419241];...
    [0.115510, 0.094446, 0.422431];...
    [0.116730, 0.099126, 0.425637];...
    [0.117933, 0.103813, 0.428830];...
    [0.119106, 0.108384, 0.432027];...
    [0.120235, 0.113025, 0.435205];...
    [0.121361, 0.117507, 0.438371];...
    [0.122480, 0.121983, 0.441541];...
    [0.123592, 0.126483, 0.444704];...
    [0.124696, 0.130936, 0.447839];...
    [0.125807, 0.135324, 0.450989];...
    [0.126828, 0.139672, 0.454121];...
    [0.127907, 0.144071, 0.457236];...
    [0.128916, 0.148382, 0.460341];...
    [0.129993, 0.152699, 0.463441];...
    [0.130992, 0.157010, 0.466534];...
    [0.131988, 0.161319, 0.469615];...
    [0.132983, 0.165534, 0.472664];...
    [0.133979, 0.169826, 0.475718];...
    [0.134969, 0.174047, 0.478744];...
    [0.135893, 0.178292, 0.481764];...
    [0.136892, 0.182461, 0.484757];...
    [0.137889, 0.186673, 0.487756];...
    [0.138819, 0.190854, 0.490726];...
    [0.139754, 0.195043, 0.493668];...
    [0.140766, 0.199185, 0.496597];...
    [0.141712, 0.203360, 0.499513];...
    [0.142665, 0.207508, 0.502416];...
    [0.143626, 0.211653, 0.505290];...
    [0.144593, 0.215776, 0.508162];...
    [0.145575, 0.219893, 0.510990];...
    [0.146497, 0.223982, 0.513817];...
    [0.147494, 0.228107, 0.516608];...
    [0.148441, 0.232196, 0.519386];...
    [0.149461, 0.236283, 0.522132];...
    [0.150439, 0.240331, 0.524870];...
    [0.151423, 0.244401, 0.527578];...
    [0.152426, 0.248494, 0.530265];...
    [0.153444, 0.252535, 0.532927];...
    [0.154482, 0.256572, 0.535558];...
    [0.155540, 0.260614, 0.538183];...
    [0.156604, 0.264639, 0.540764];...
    [0.157646, 0.268677, 0.543330];...
    [0.158755, 0.272676, 0.545871];...
    [0.159813, 0.276698, 0.548383];...
    [0.160964, 0.280675, 0.550863];...
    [0.162111, 0.284675, 0.553315];...
    [0.163261, 0.288671, 0.555744];...
    [0.164432, 0.292642, 0.558150];...
    [0.165586, 0.296623, 0.560533];...
    [0.166843, 0.300573, 0.562887];...
    [0.168054, 0.304534, 0.565194];...
    [0.169354, 0.308487, 0.567495];...
    [0.170614, 0.312410, 0.569751];...
    [0.171920, 0.316363, 0.571989];...
    [0.173261, 0.320291, 0.574188];...
    [0.174648, 0.324189, 0.576375];...
    [0.176006, 0.328102, 0.578508];...
    [0.177479, 0.332008, 0.580625];...
    [0.178923, 0.335895, 0.582704];...
    [0.180394, 0.339788, 0.584762];...
    [0.181911, 0.343652, 0.586779];...
    [0.183476, 0.347530, 0.588765];...
    [0.185095, 0.351381, 0.590726];...
    [0.186704, 0.355244, 0.592662];...
    [0.188390, 0.359065, 0.594548];...
    [0.190072, 0.362901, 0.596411];...
    [0.191813, 0.366733, 0.598235];...
    [0.193613, 0.370536, 0.600036];...
    [0.195424, 0.374356, 0.601796];...
    [0.197303, 0.378144, 0.603531];...
    [0.199191, 0.381929, 0.605220];...
    [0.201145, 0.385703, 0.606888];...
    [0.203166, 0.389479, 0.608518];...
    [0.205211, 0.393235, 0.610101];...
    [0.207319, 0.396980, 0.611662];...
    [0.209453, 0.400739, 0.613179];...
    [0.211665, 0.404450, 0.614666];...
    [0.213901, 0.408173, 0.616123];...
    [0.216213, 0.411881, 0.617536];...
    [0.218546, 0.415577, 0.618923];...
    [0.220963, 0.419268, 0.620264];...
    [0.223407, 0.422932, 0.621560];...
    [0.225926, 0.426601, 0.622832];...
    [0.228495, 0.430255, 0.624066];...
    [0.231110, 0.433884, 0.625253];...
    [0.233772, 0.437528, 0.626406];...
    [0.236537, 0.441129, 0.627522];...
    [0.239324, 0.444741, 0.628602];...
    [0.242179, 0.448322, 0.629632];...
    [0.245082, 0.451902, 0.630636];...
    [0.248092, 0.455457, 0.631588];...
    [0.251124, 0.459003, 0.632503];...
    [0.254223, 0.462523, 0.633378];...
    [0.257378, 0.466038, 0.634215];...
    [0.260601, 0.469550, 0.635000];...
    [0.263901, 0.473016, 0.635749];...
    [0.267221, 0.476488, 0.636460];...
    [0.270662, 0.479939, 0.637121];...
    [0.274124, 0.483358, 0.637738];...
    [0.277664, 0.486772, 0.638314];...
    [0.281249, 0.490161, 0.638845];...
    [0.284909, 0.493528, 0.639333];...
    [0.288645, 0.496877, 0.639778];...
    [0.292426, 0.500203, 0.640175];...
    [0.296276, 0.503508, 0.640524];...
    [0.300180, 0.506793, 0.640826];...
    [0.304147, 0.510052, 0.641084];...
    [0.308175, 0.513289, 0.641296];...
    [0.312252, 0.516494, 0.641462];...
    [0.316418, 0.519677, 0.641582];...
    [0.320626, 0.522837, 0.641654];...
    [0.324864, 0.525966, 0.641679];...
    [0.329198, 0.529070, 0.641656];...
    [0.333561, 0.532136, 0.641585];...
    [0.337970, 0.535170, 0.641466];...
    [0.342455, 0.538188, 0.641300];...
    [0.346979, 0.541154, 0.641087];...
    [0.351541, 0.544103, 0.640829];...
    [0.356170, 0.547014, 0.640524];...
    [0.360819, 0.549891, 0.640171];...
    [0.365541, 0.552731, 0.639769];...
    [0.370290, 0.555531, 0.639318];...
    [0.375088, 0.558300, 0.638823];...
    [0.379928, 0.561035, 0.638283];...
    [0.384797, 0.563739, 0.637697];...
    [0.389709, 0.566390, 0.637069];...
    [0.394658, 0.569000, 0.636397];...
    [0.399630, 0.571580, 0.635673];...
    [0.404644, 0.574114, 0.634914];...
    [0.409695, 0.576622, 0.634116];...
    [0.414760, 0.579073, 0.633268];...
    [0.419859, 0.581482, 0.632384];...
    [0.424982, 0.583855, 0.631463];...
    [0.430122, 0.586191, 0.630505];...
    [0.435295, 0.588472, 0.629501];...
    [0.440469, 0.590724, 0.628476];...
    [0.445670, 0.592938, 0.627405];...
    [0.450901, 0.595097, 0.626305];...
    [0.456135, 0.597226, 0.625177];...
    [0.461391, 0.599309, 0.624023];...
    [0.466657, 0.601347, 0.622832];...
    [0.471940, 0.603355, 0.621614];...
    [0.477222, 0.605313, 0.620388];...
    [0.482525, 0.607248, 0.619130];...
    [0.487841, 0.609136, 0.617842];...
    [0.493147, 0.610986, 0.616551];...
    [0.498489, 0.612795, 0.615232];...
    [0.503819, 0.614576, 0.613904];...
    [0.509165, 0.616333, 0.612569];...
    [0.514519, 0.618048, 0.611232];...
    [0.519869, 0.619742, 0.609876];...
    [0.525243, 0.621396, 0.608531];...
    [0.530620, 0.623035, 0.607177];...
    [0.536002, 0.624643, 0.605815];...
    [0.541393, 0.626229, 0.604481];...
    [0.546807, 0.627800, 0.603143];...
    [0.552224, 0.629346, 0.601817];...
    [0.557650, 0.630889, 0.600512];...
    [0.563095, 0.632409, 0.599231];...
    [0.568544, 0.633927, 0.597963];...
    [0.574017, 0.635428, 0.596735];...
    [0.579518, 0.636939, 0.595529];...
    [0.585029, 0.638440, 0.594365];...
    [0.590556, 0.639951, 0.593245];...
    [0.596118, 0.641459, 0.592171];...
    [0.601704, 0.642989, 0.591137];...
    [0.607328, 0.644526, 0.590163];...
    [0.612966, 0.646088, 0.589253];...
    [0.618659, 0.647671, 0.588412];...
    [0.624377, 0.649288, 0.587646];...
    [0.630138, 0.650926, 0.586960];...
    [0.635943, 0.652601, 0.586361];...
    [0.641792, 0.654323, 0.585856];...
    [0.647693, 0.656096, 0.585447];...
    [0.653648, 0.657914, 0.585142];...
    [0.659659, 0.659784, 0.584952];...
    [0.665727, 0.661724, 0.584884];...
    [0.671854, 0.663726, 0.584946];...
    [0.678048, 0.665796, 0.585146];...
    [0.684298, 0.667952, 0.585491];...
    [0.690623, 0.670187, 0.585987];...
    [0.697019, 0.672507, 0.586641];...
    [0.703483, 0.674915, 0.587468];...
    [0.710016, 0.677433, 0.588473];...
    [0.716622, 0.680035, 0.589666];...
    [0.723287, 0.682758, 0.591058];...
    [0.730033, 0.685590, 0.592654];...
    [0.736837, 0.688533, 0.594444];...
    [0.743708, 0.691588, 0.596458];...
    [0.750639, 0.694763, 0.598689];...
    [0.757620, 0.698063, 0.601149];...
    [0.764653, 0.701485, 0.603849];...
    [0.771730, 0.705033, 0.606775];...
    [0.778837, 0.708706, 0.609936];...
    [0.785977, 0.712489, 0.613340];...
    [0.793132, 0.716409, 0.616996];...
    [0.800292, 0.720435, 0.620887];...
    [0.807448, 0.724584, 0.625012];...
    [0.814587, 0.728840, 0.629376];...
    [0.821705, 0.733207, 0.633983];...
    [0.828779, 0.737670, 0.638805];...
    [0.835797, 0.742236, 0.643850];...
    [0.842753, 0.746885, 0.649121];...
    [0.849627, 0.751621, 0.654582];...
    [0.856405, 0.756422, 0.660250];...
    [0.863083, 0.761293, 0.666100];...
    [0.869635, 0.766222, 0.672129];...
    [0.876063, 0.771202, 0.678318];...
    [0.882346, 0.776217, 0.684656];...
    [0.888482, 0.781266, 0.691134];...
    [0.894454, 0.786340, 0.697742];...
    [0.900253, 0.791422, 0.704464];...
    [0.905879, 0.796513, 0.711290];...
    [0.911317, 0.801607, 0.718196];...
    [0.916568, 0.806696, 0.725189];...
    [0.921627, 0.811765, 0.732241];...
    [0.926488, 0.816815, 0.739352];...
    [0.931155, 0.821841, 0.746497];...
    [0.935622, 0.826833, 0.753683];...
    [0.939894, 0.831794, 0.760897];...
    [0.943965, 0.836710, 0.768122];...
    [0.947844, 0.841589, 0.775364];...
    [0.951530, 0.846418, 0.782609];...
    [0.955031, 0.851205, 0.789852];...
    [0.958348, 0.855950, 0.797083];...
    [0.961481, 0.860641, 0.804310];...
    [0.964444, 0.865281, 0.811517];...
    [0.967245, 0.869874, 0.818701];...
    [0.969877, 0.874421, 0.825872];...
    [0.972359, 0.878918, 0.833018];...
    [0.974685, 0.883371, 0.840145];...
    [0.976874, 0.887774, 0.847236];...
    [0.978925, 0.892139, 0.854310];...
    [0.980850, 0.896458, 0.861358];...
    [0.982652, 0.900735, 0.868388];...
    [0.984338, 0.904979, 0.875383];...
    [0.985912, 0.909180, 0.882357];...
    [0.987387, 0.913355, 0.889315];...
    [0.988763, 0.917498, 0.896251];...
    [0.990052, 0.921606, 0.903168];...
    [0.991256, 0.925692, 0.910067];...
    [0.992385, 0.929753, 0.916951];...
    [0.993443, 0.933791, 0.923821];...
    [0.994431, 0.937817, 0.930680];...
    [0.995360, 0.941823, 0.937528];...
    [0.996235, 0.945814, 0.944370];...
    [0.997061, 0.949794, 0.951206]...
    ];

c = distill(rgb, m);

end