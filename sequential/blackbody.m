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
    0.012498568 0.003767102 0.002107133;...
    0.024997135 0.007534204 0.004214267;...
    0.037495703 0.011301306 0.0063214;...
    0.049258109 0.015068408 0.008428533;...
    0.059416594 0.01883551 0.010535667;...
    0.068447188 0.022602612 0.0126428;...
    0.076636309 0.026369715 0.014749934;...
    0.084167879 0.030136817 0.016857067;...
    0.091168086 0.033903919 0.0189642;...
    0.097727829 0.037671021 0.021071334;...
    0.103915088 0.041414668 0.023178467;...
    0.109782226 0.044974293 0.0252856;...
    0.11537057 0.048364773 0.027392734;...
    0.120713391 0.051606292 0.029499867;...
    0.125837934 0.054715381 0.031607;...
    0.130854585 0.057650568 0.033719339;...
    0.136041902 0.060259083 0.035853445;...
    0.141404177 0.062554231 0.038010921;...
    0.146927404 0.064555729 0.040192257;...
    0.152598731 0.066278736 0.042338968;...
    0.158389635 0.067777838 0.044433913;...
    0.164222599 0.069240182 0.046456344;...
    0.170089016 0.070684885 0.048408697;...
    0.175987921 0.072112061 0.050295821;...
    0.181918422 0.073521817 0.052121993;...
    0.187879699 0.07491425 0.053891012;...
    0.193870991 0.076289449 0.055606268;...
    0.199891592 0.077647497 0.057270799;...
    0.205940844 0.078988468 0.058887339;...
    0.212018132 0.08031243 0.06045836;...
    0.218122883 0.081619445 0.061986104;...
    0.224254557 0.082909567 0.063472612;...
    0.230412647 0.084182845 0.064919744;...
    0.236596675 0.085439323 0.066329206;...
    0.24280619 0.086679037 0.067702563;...
    0.249040765 0.087902021 0.069041254;...
    0.255299995 0.089108301 0.070346607;...
    0.261583495 0.090297899 0.071619848;...
    0.267890899 0.091470832 0.072862115;...
    0.274221857 0.092627112 0.07407446;...
    0.280576038 0.093766747 0.075257864;...
    0.286953122 0.094889739 0.076413239;...
    0.293352803 0.095996088 0.077541434;...
    0.29977479 0.097085788 0.078643244;...
    0.3062188 0.098158827 0.079719409;...
    0.312684565 0.099215193 0.080770625;...
    0.319171135 0.100255026 0.081805591;...
    0.325676915 0.101278632 0.082841239;...
    0.332201791 0.102285973 0.083877572;...
    0.338745651 0.10327701 0.084914597;...
    0.34530838 0.104251701 0.085952321;...
    0.351889863 0.105209999 0.086990751;...
    0.358489984 0.106151854 0.088029891;...
    0.36510863 0.107077214 0.089069749;...
    0.371745684 0.107986022 0.090110328;...
    0.37840103 0.108878218 0.091151635;...
    0.385074555 0.10975374 0.092193674;...
    0.391766144 0.110612521 0.093236451;...
    0.398475683 0.11145449 0.094279969;...
    0.405203057 0.112279573 0.095324234;...
    0.411948155 0.113087693 0.096369249;...
    0.418710863 0.11387877 0.097415019;...
    0.425491072 0.114652718 0.098461547;...
    0.432288669 0.115409448 0.099508837;...
    0.439103545 0.116148869 0.100556893;...
    0.445935592 0.116870883 0.101605718;...
    0.452784701 0.117575391 0.102655315;...
    0.459650766 0.118262288 0.103705688;...
    0.46653368 0.118931466 0.104756838;...
    0.473433338 0.11958281 0.10580877;...
    0.480349636 0.120216205 0.106861486;...
    0.487282471 0.120831529 0.107914988;...
    0.494231741 0.121428655 0.108969278;...
    0.501197345 0.122007452 0.11002436;...
    0.508179182 0.122567785 0.111080235;...
    0.515177155 0.123109513 0.112136905;...
    0.522191165 0.12363249 0.113194373;...
    0.529221115 0.124136564 0.11425264;...
    0.53626691 0.12462158 0.115311708;...
    0.543328454 0.125087376 0.116371579;...
    0.550405654 0.125533783 0.117432254;...
    0.557498417 0.125960628 0.118493735;...
    0.564606651 0.126367731 0.119556023;...
    0.571730266 0.126754906 0.12061912;...
    0.578869172 0.127121961 0.121683027;...
    0.58602328 0.127468695 0.122747744;...
    0.593192502 0.127794902 0.123813274;...
    0.600376752 0.128100369 0.124879618;...
    0.607575944 0.128384874 0.125946775;...
    0.614789993 0.128648188 0.127014747;...
    0.622018815 0.128890073 0.128083536;...
    0.629262328 0.129110283 0.129153141;...
    0.636520448 0.129308564 0.130223563;...
    0.643793096 0.129484652 0.131294804;...
    0.651080191 0.129638272 0.132366863;...
    0.658381654 0.129769142 0.133439741;...
    0.665697405 0.129876967 0.134513439;...
    0.673027369 0.129961442 0.135587957;...
    0.680371467 0.13002225 0.136663296;...
    0.686819633 0.13206114 0.137260536;...
    0.690577321 0.139841365 0.136421938;...
    0.694333453 0.147366584 0.135554156;...
    0.698088047 0.154670101 0.134656431;...
    0.701841119 0.16177911 0.133727969;...
    0.705592689 0.16871613 0.132767932;...
    0.709342771 0.175500035 0.131775442;...
    0.713091385 0.182146813 0.130749571;...
    0.716838546 0.188670137 0.129689344;...
    0.720584271 0.195081798 0.128593729;...
    0.724328577 0.201392035 0.127461634;...
    0.728071479 0.207609807 0.126291906;...
    0.731812993 0.213742994 0.12508332;...
    0.735553136 0.21979857 0.123834577;...
    0.739291923 0.225782733 0.122544293;...
    0.743029369 0.231701023 0.121210997;...
    0.746765489 0.237558408 0.119833118;...
    0.750500299 0.243359362 0.118408976;...
    0.754233813 0.24910793 0.116936772;...
    0.757966046 0.254807779 0.115414575;...
    0.761697013 0.260462246 0.11384031;...
    0.765426727 0.266074376 0.112211738;...
    0.769155204 0.271646953 0.11052644;...
    0.772882457 0.277182532 0.108781796;...
    0.776608499 0.282683461 0.106974961;...
    0.780333346 0.288151905 0.105102834;...
    0.784057009 0.293589863 0.103162025;...
    0.787779503 0.298999182 0.101148819;...
    0.791500841 0.304381578 0.099059127;...
    0.795221036 0.309738642 0.09688843;...
    0.798940101 0.315071856 0.094631717;...
    0.802658048 0.320382598 0.0922834;...
    0.80637489 0.325672157 0.089837222;...
    0.810090641 0.330941736 0.087286134;...
    0.813805311 0.33619246 0.084622152;...
    0.817518914 0.341425387 0.081836168;...
    0.821231462 0.346641504 0.078917716;...
    0.824942966 0.351841743 0.075854673;...
    0.828653438 0.357026979 0.072632864;...
    0.832362891 0.362198034 0.069235541;...
    0.836071335 0.367355685 0.065642679;...
    0.839778783 0.372500664 0.061830004;...
    0.843485244 0.377633663 0.05776761;...
    0.847190732 0.382755336 0.05341796;...
    0.850895256 0.3878663 0.048732845;...
    0.854598828 0.392967142 0.043648615;...
    0.858301459 0.398058417 0.03807962;...
    0.86200316 0.40314065 0.032290439;...
    0.86570394 0.408214342 0.026411834;...
    0.869403811 0.413279967 0.020443259;...
    0.870620849 0.420259688 0.019620704;...
    0.871622154 0.427341619 0.019225059;...
    0.872606439 0.434372519 0.018839607;...
    0.87357363 0.441355114 0.018464558;...
    0.874523654 0.448291941 0.018100119;...
    0.875456436 0.455185362 0.0177465;...
    0.8763719 0.462037582 0.017403909;...
    0.877269972 0.468850662 0.017072555;...
    0.878150573 0.475626531 0.016752647;...
    0.879013625 0.482366997 0.016444393;...
    0.87985905 0.489073758 0.016148002;...
    0.880686767 0.495748408 0.015863683;...
    0.881496696 0.502392449 0.015591645;...
    0.882288754 0.509007295 0.015332095;...
    0.88306286 0.51559428 0.015085244;...
    0.883818928 0.522154663 0.014851299;...
    0.884556874 0.528689635 0.014630469;...
    0.885276613 0.535200322 0.014422963;...
    0.885978056 0.541687792 0.01422899;...
    0.886661117 0.548153055 0.014048759;...
    0.887325705 0.554597072 0.013882477;...
    0.887971731 0.561020753 0.013730354;...
    0.888599102 0.567424963 0.013592599;...
    0.889207727 0.573810528 0.01346942;...
    0.889797511 0.58017823 0.013361026;...
    0.89036836 0.586528817 0.013267625;...
    0.890920176 0.592863001 0.013189427;...
    0.891452863 0.59918146 0.013126639;...
    0.891966321 0.605484842 0.013079471;...
    0.892460451 0.611773768 0.013048132;...
    0.89293515 0.618048827 0.01303283;...
    0.893390316 0.624310588 0.013033773;...
    0.893825845 0.63055959 0.013051171;...
    0.89424163 0.636796352 0.013085233;...
    0.894637565 0.643021372 0.013136166;...
    0.895013542 0.649235124 0.013204179;...
    0.895369449 0.655438065 0.013289482;...
    0.895705176 0.661630634 0.013392283;...
    0.896020608 0.66781325 0.013512791;...
    0.896315632 0.673986317 0.013651214;...
    0.896590131 0.680150224 0.013807761;...
    0.896843987 0.686305342 0.013982641;...
    0.897077079 0.692452031 0.014176062;...
    0.897289287 0.698590635 0.014388234;...
    0.897480488 0.704721486 0.014619364;...
    0.897650555 0.710844904 0.014869662;...
    0.897799363 0.716961197 0.015139336;...
    0.897926782 0.72307066 0.015428596;...
    0.898032682 0.729173581 0.015737649;...
    0.89811693 0.735270235 0.016066704;...
    0.898179391 0.741360887 0.016415971;...
    0.89821993 0.747445794 0.016785657;...
    0.898238406 0.753525204 0.017175972;...
    0.89823468 0.759599356 0.017587124;...
    0.898208609 0.765668481 0.018019322;...
    0.898160046 0.771732801 0.018472774;...
    0.898088845 0.777792533 0.01894769;...
    0.897994856 0.783847885 0.019444278;...
    0.897877926 0.789899059 0.019962746;...
    0.897737902 0.795946249 0.020503304;...
    0.897574625 0.801989644 0.02106616;...
    0.897387937 0.808029426 0.021651523;...
    0.897177675 0.814065773 0.022259601;...
    0.896943675 0.820098856 0.022890604;...
    0.896685769 0.826128839 0.023544739;...
    0.898553008 0.83123325 0.068261008;...
    0.902890379 0.835257283 0.127173792;...
    0.907153202 0.839290415 0.169365964;...
    0.911340063 0.843332745 0.204553626;...
    0.915449563 0.847384367 0.235764225;...
    0.919480315 0.851445371 0.264391329;...
    0.923430941 0.855515845 0.291204862;...
    0.927300074 0.859595875 0.316679373;...
    0.931086353 0.86368554 0.341129702;...
    0.934788419 0.867784921 0.364776124;...
    0.938404919 0.871894093 0.387779074;...
    0.9419345 0.876013129 0.410259139;...
    0.945375806 0.880142099 0.432309279;...
    0.948727482 0.88428107 0.454002666;...
    0.951988167 0.888430108 0.475397903;...
    0.955156491 0.892589275 0.496542621;...
    0.958231082 0.896758631 0.517476025;...
    0.961210553 0.900938233 0.538230742;...
    0.964093508 0.905128136 0.558834179;...
    0.966878539 0.909328393 0.579309557;...
    0.969564221 0.913539054 0.599676698;...
    0.972149113 0.917760167 0.619952629;...
    0.974631755 0.921991779 0.640152069;...
    0.977010668 0.926233933 0.660287806;...
    0.97928435 0.930486671 0.680371005;...
    0.981451275 0.934750033 0.700411456;...
    0.98350989 0.939024057 0.720417777;...
    0.985458616 0.943308778 0.740397582;...
    0.98729584 0.947604231 0.76035762;...
    0.98901992 0.951910447 0.780303888;...
    0.99062918 0.956227458 0.800241733;...
    0.992121903 0.960555292 0.820175933;...
    0.993496336 0.964893975 0.840110766;...
    0.994750684 0.969243534 0.86005007;...
    0.995883106 0.973603991 0.879997297;...
    0.996891715 0.97797537 0.899955552;...
    0.997774575 0.982357689 0.91992764;...
    0.998529695 0.986750969 0.93991609;...
    0.999155029 0.991155227 0.959923188;...
    0.999648472 0.99557048 0.979951007;...
    1 1 1;...
    ];

c = distill(rgb, m);

end