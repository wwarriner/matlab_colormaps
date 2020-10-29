function showcase_cmap(c)

if nargin < 1
    c = viridis;
end

[X, Y, Z] = peaks(100);

fh = figure();
fh.MenuBar = "none";
fh.ToolBar = "none";
fh.DockControls = "off";
fh.Color = [0.9 0.9 0.9];
fh.Position(2) = 50;
fh.Position(3:4) = [1280 960];

axh = subplot(2, 3, 1);
sh = surfc(axh, X, Y, Z);
sh(1).EdgeColor = "interp";
sh(1).FaceColor = "interp";
sh(1).FaceLighting = "gouraud";
view(axh, 3);
colormap(axh, c);
axis(axh, "square", "vis3d");
axh.Title.String = "surfc(peaks(100)), view(1)";

axh = subplot(2, 3, 2);
sh = surf(axh, X, Y, Z);
sh(1).EdgeColor = "interp";
sh(1).FaceColor = "interp";
sh(1).FaceLighting = "gouraud";
view(axh, 2);
colormap(axh, c);
axis(axh, "square");
axh.Title.String = "surfc(peaks(100)), view(2)";

axh = subplot(2, 3, 3);
Z = peaks(20);
ih = imagesc(axh, Z);
axh.YDir = "normal";
colormap(axh, c);
axis(axh, "square");
axh.Title.String = "imagesc(peaks(20))";

axh = subplot(2, 3, 4);
im = imread("rice.png");
im = imadjust(im);
ih = imagesc(axh, im);
colormap(axh, c);
axis(axh, "square");
axh.Title.String = "rice.png";

axh = subplot(2, 3, [5 6]);
im = ramp_sine_test();
ih = imagesc(axh, im);
colormap(axh, c);
axis(axh, "equal");
axh.Box = "off";
axh.XAxis.Visible = "off";
axh.YAxis.Visible = "off";
axh.Color = [0.9 0.9 0.9];
axh.Title.String = "Sinusoidal Ramp";

end

