function c = blackbody(m)
% Originally created by Kenneth Moreland
% Adapted for MATLAB by William Warriner 2020
% rgb values pulled from
% https://www.kennethmoreland.com/color-advice/

if nargin < 1
    m = 256;
end

assert(isnumeric(m));
assert(isscalar(m));
assert(isreal(m));
assert(isfinite(m));
assert(mod(m, 1) == 0);
assert(1 <= m);

rgb = [...
    0 0 0;...
    0.017991146 0.000920065 0.015615718;...
    0.035957339 0.001785532 0.031968615;...
    0.052717505 0.002528874 0.048594448;...
    0.066459367 0.003223123 0.062987553;...
    0.078378908 0.003801565 0.07587282;...
    0.089019446 0.00426759 0.087740796;...
    0.098526871 0.004758808 0.09870303;...
    0.107066589 0.005231577 0.109516759;...
    0.114490125 0.005792922 0.120833508;...
    0.120982701 0.006387352 0.132756773;...
    0.126759943 0.006973024 0.145020001;...
    0.132114156 0.007512258 0.157034898;...
    0.137058036 0.008060042 0.16874091;...
    0.141649688 0.008602059 0.180181586;...
    0.145897662 0.009187402 0.191306061;...
    0.149911731 0.009699307 0.20228018;...
    0.153699795 0.010165163 0.213069107;...
    0.15722905 0.010696665 0.223525579;...
    0.160604334 0.01114745 0.233838502;...
    0.163796763 0.011623137 0.243863642;...
    0.166848448 0.012113442 0.253685703;...
    0.169819141 0.012611448 0.263638187;...
    0.172738904 0.01304563 0.273838903;...
    0.175539874 0.013606017 0.284035835;...
    0.178292711 0.014093826 0.294472727;...
    0.180967301 0.014603144 0.305018418;...
    0.183568732 0.015130494 0.315665343;...
    0.186126598 0.015563808 0.326540251;...
    0.188597679 0.016112598 0.33736714;...
    0.19101528 0.016666139 0.348269803;...
    0.193387472 0.017219151 0.35923894;...
    0.195737845 0.017648527 0.370407572;...
    0.198044113 0.018180748 0.381482231;...
    0.200323209 0.018816828 0.392447153;...
    0.202608743 0.019308032 0.403582869;...
    0.204899513 0.019767509 0.414734365;...
    0.207203487 0.02031851 0.425739793;...
    0.209540691 0.020829322 0.436737009;...
    0.211923424 0.021428697 0.447561641;...
    0.214365277 0.021841405 0.458511304;...
    0.216884168 0.022476171 0.469109682;...
    0.21948513 0.022911157 0.479815538;...
    0.222188068 0.023425826 0.49030581;...
    0.224998688 0.023872871 0.500730804;...
    0.227935386 0.024400354 0.51092309;...
    0.230997962 0.024855743 0.521037675;...
    0.234203821 0.025394792 0.530907891;...
    0.237546373 0.025859839 0.54069376;...
    0.241027047 0.02624758 0.550395119;...
    0.244584485 0.026769344 0.559911669;...
    0.248117522 0.02712744 0.569636574;...
    0.249894758 0.027863136 0.581398672;...
    0.251525497 0.028421972 0.593483257;...
    0.252639758 0.029041629 0.606152585;...
    0.252696089 0.029609462 0.620118666;...
    0.251496133 0.030390942 0.63531372;...
    0.248691606 0.031154778 0.652158617;...
    0.243878138 0.032081776 0.67073133;...
    0.236399628 0.033070662 0.691424807;...
    0.225267245 0.03412526 0.714610867;...
    0.20888985 0.035383241 0.740636386;...
    0.184190459 0.03683276 0.770140652;...
    0.143863415 0.038418444 0.80403988;...
    0.074621964 0.046379895 0.836091604;...
    0.05192968 0.079847299 0.829374358;...
    0.039451528 0.107189845 0.816977772;...
    0.038449783 0.13057294 0.800619639;...
    0.037604908 0.150475346 0.783946104;...
    0.036620916 0.16793731 0.767178192;...
    0.036209539 0.183593243 0.750243007;...
    0.035009786 0.197766484 0.733612553;...
    0.034181662 0.210769331 0.717059182;...
    0.033820728 0.222790052 0.700632749;...
    0.033060224 0.233954588 0.684623431;...
    0.032005447 0.244386794 0.66904942;...
    0.031198594 0.254189693 0.653810061;...
    0.030693154 0.263438905 0.638927319;...
    0.030092324 0.27219625 0.624527084;...
    0.029453283 0.280518738 0.61061376;...
    0.028826676 0.288454797 0.597189243;...
    0.028258219 0.296045951 0.584253244;...
    0.027358109 0.303331721 0.57189568;...
    0.02702966 0.310337007 0.559924872;...
    0.0264448 0.317097232 0.548516148;...
    0.025634514 0.323638968 0.537652139;...
    0.025492766 0.329971351 0.527160032;...
    0.02474017 0.336134493 0.517263776;...
    0.024264411 0.342132084 0.50779288;...
    0.024086023 0.347978814 0.498738245;...
    0.023770524 0.353697971 0.490153194;...
    0.02331504 0.359303427 0.48201716;...
    0.022709995 0.364807798 0.474309413;...
    0.022415523 0.37021054 0.466956888;...
    0.021951069 0.375533039 0.45999793;...
    0.021785245 0.380771775 0.453366342;...
    0.02141098 0.38594788 0.447093322;...
    0.021308363 0.3910553 0.441119612;...
    0.020940964 0.396115196 0.435469406;...
    0.020803223 0.401119315 0.430090411;...
    0.020326797 0.406089062 0.424999914;...
    0.020023219 0.41101424 0.420152583;...
    0.019872805 0.415899382 0.415537874;...
    0.020173039 0.420752205 0.410977893;...
    0.020426913 0.425601519 0.406330936;...
    0.020648269 0.430446944 0.401596641;...
    0.020851538 0.435288096 0.396774686;...
    0.021051725 0.440124593 0.391864798;...
    0.021264392 0.444956048 0.38686676;...
    0.021505631 0.449782076 0.381780421;...
    0.021792042 0.454602292 0.376605702;...
    0.022140698 0.459416312 0.371342618;...
    0.022569113 0.464223753 0.365991281;...
    0.022425956 0.469044405 0.360529878;...
    0.023058079 0.473837792 0.354998748;...
    0.023135067 0.478644109 0.349350101;...
    0.023343983 0.483442807 0.343606556;...
    0.023702843 0.488233513 0.337768885;...
    0.023508105 0.493037171 0.33179487;...
    0.024209893 0.497811022 0.325767842;...
    0.024370999 0.502597538 0.319598396;...
    0.024730286 0.507375061 0.313331518;...
    0.024535618 0.512165385 0.306908018;...
    0.025329418 0.516924115 0.30044854;...
    0.025576677 0.521695388 0.293828618;...
    0.025253994 0.526479458 0.287037203;...
    0.025977892 0.53123082 0.280225448;...
    0.026133172 0.535994757 0.273241168;...
    0.026539984 0.540748306 0.26616608;...
    0.026347513 0.545514588 0.258909641;...
    0.026400512 0.550270319 0.251565875;...
    0.026708122 0.555015283 0.244143955;...
    0.027278455 0.559749287 0.236654848;...
    0.027197896 0.564496122 0.228989322;...
    0.027362888 0.56923196 0.22127138;...
    0.027777471 0.573956677 0.213518486;...
    0.028444431 0.578670178 0.205751414;...
    0.028384329 0.583396856 0.197842236;...
    0.028547652 0.588112449 0.189955335;...
    0.028933114 0.592816945 0.182123551;...
    0.028511588 0.59753514 0.174205065;...
    0.029317533 0.602217649 0.166595805;...
    0.02927791 0.606914201 0.158975696;...
    0.029414083 0.611600149 0.151584202;...
    0.029720091 0.616275666 0.144488804;...
    0.030189461 0.620940969 0.137765523;...
    0.030815366 0.625596326 0.131498161;...
    0.030459678 0.630267392 0.125510285;...
    0.031363195 0.634903951 0.120413273;...
    0.031242878 0.639557177 0.115752028;...
    0.031223543 0.644202264 0.111875435;...
    0.031299156 0.648839822 0.108851437;...
    0.031418411 0.653477231 0.106176992;...
    0.031535473 0.658121194 0.103322272;...
    0.032584944 0.66273238 0.102506293;...
    0.032496462 0.667373625 0.101313673;...
    0.032268139 0.672026774 0.099704638;...
    0.033096994 0.67667084 0.097629589;...
    0.032675722 0.681353425 0.094299613;...
    0.033722999 0.686019956 0.090359711;...
    0.03390642 0.690717832 0.084903042;...
    0.03341481 0.695443242 0.077652777;...
    0.033742564 0.700167125 0.068650262;...
    0.033820702 0.704910802 0.056740271;...
    0.033874396 0.709670103 0.040391871;...
    0.058733599 0.71392215 0.034390707;...
    0.087429581 0.717891498 0.034678787;...
    0.111915239 0.721799268 0.034819303;...
    0.13412301 0.725643422 0.034803745;...
    0.15534732 0.729397564 0.035371254;...
    0.175139324 0.733108825 0.035025089;...
    0.194611949 0.736726661 0.035259269;...
    0.213537378 0.740273862 0.035317838;...
    0.232332605 0.743724886 0.035968753;...
    0.250513531 0.747126351 0.035658462;...
    0.268691546 0.750429081 0.035938694;...
    0.286648032 0.753655779 0.036025187;...
    0.304629644 0.756781961 0.036715619;...
    0.322255272 0.75985331 0.036398306;...
    0.339942738 0.762822451 0.036684314;...
    0.357515992 0.765711773 0.036760522;...
    0.374994785 0.768520446 0.036619587;...
    0.392536689 0.771225646 0.037097273;...
    0.409994308 0.773849358 0.037358719;...
    0.427379664 0.776391029 0.037397054;...
    0.444702459 0.778850167 0.037205655;...
    0.462079591 0.781205602 0.03765171;...
    0.47939444 0.783478486 0.037870741;...
    0.496653275 0.785668578 0.037856699;...
    0.513861188 0.787775696 0.037603818;...
    0.531105711 0.78978064 0.038011317;...
    0.548295506 0.791703355 0.038184711;...
    0.565434008 0.793543878 0.038118875;...
    0.582591196 0.79528474 0.038737631;...
    0.59963001 0.796961717 0.03818684;...
    0.61668205 0.798540479 0.038327534;...
    0.633682107 0.800038845 0.038226919;...
    0.650680154 0.80144197 0.038841776;...
    0.667576491 0.802781138 0.038255102;...
    0.684464833 0.804027141 0.038392999;...
    0.701333812 0.805182544 0.039276805;...
    0.718108997 0.806274658 0.038941355;...
    0.734858979 0.807278722 0.039362675;...
    0.751524899 0.808219025 0.038543199;...
    0.768180014 0.809064202 0.039510304;...
    0.784981359 0.809779655 0.038986378;...
    0.802205853 0.810269996 0.038672313;...
    0.819870049 0.810514774 0.039587107;...
    0.837964828 0.810508205 0.040734904;...
    0.85649576 0.810239071 0.041153349;...
    0.875477677 0.809684425 0.0418486;...
    0.894915926 0.808826947 0.042826388;...
    0.914815073 0.807648344 0.044086268;...
    0.9351921 0.806127911 0.04475028;...
    0.955553807 0.804329139 0.067382316;...
    0.964388642 0.80474605 0.252819657;...
    0.969264676 0.806479603 0.355213883;...
    0.972679058 0.808946323 0.427168889;...
    0.975344341 0.811910917 0.4826703;...
    0.977488081 0.815263983 0.527978709;...
    0.979325207 0.818911532 0.566044805;...
    0.980856324 0.822821419 0.599002328;...
    0.982248942 0.826925426 0.627796038;...
    0.983429178 0.83122224 0.653523321;...
    0.984581462 0.835645804 0.676478783;...
    0.985530321 0.840229085 0.697479065;...
    0.986439874 0.844915605 0.716603138;...
    0.987284697 0.849701759 0.73419241;...
    0.98809748 0.8545694 0.750435011;...
    0.988784937 0.859536818 0.765642621;...
    0.989434072 0.864572813 0.779848654;...
    0.990132549 0.869646397 0.793083976;...
    0.990726991 0.874795482 0.805638047;...
    0.991275757 0.879998726 0.817531592;...
    0.991837792 0.885234999 0.828784068;...
    0.992337138 0.89052193 0.83954146;...
    0.992819104 0.895843059 0.849818455;...
    0.993184916 0.901223133 0.859755147;...
    0.993764848 0.906565576 0.869111247;...
    0.994158263 0.911981196 0.878275818;...
    0.994542722 0.917417168 0.887132208;...
    0.99495153 0.922861877 0.895689415;...
    0.995417956 0.928304043 0.903955783;...
    0.995805994 0.933779817 0.912062162;...
    0.996137505 0.939281131 0.920014524;...
    0.996434663 0.944800045 0.927818427;...
    0.996898907 0.950279715 0.935356648;...
    0.997197219 0.9558103 0.942878719;...
    0.997527495 0.961336154 0.95026627;...
    0.997911217 0.966850487 0.957523045;...
    0.998179199 0.972397796 0.964774153;...
    0.998536845 0.977921895 0.971900557;...
    0.998809262 0.983468566 0.979026564;...
    0.999205023 0.988981843 0.986032579;...
    0.999545232 0.994508168 0.99304254;...
    1 1 1;...
    ];

c = distill(rgb, m);

end
