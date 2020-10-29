function preview_all(file_path)

if nargin < 1
    file_path = [];
end

ALL = containers.Map("keytype", "char", "valuetype", "any");
total = 0;

t = make_table({...
    "cividis", cividis; ...
    "inferno", inferno; ...
    "magma", magma; ...
    "plasma", plasma; ...
    "viridis", viridis; ...
    "turbo", turbo; ...
    });
total = total + height(t);
ALL('Linear') = t;

t = make_table({...
    "sinebow", sinebow; ...
    "twilight", twilight; ...
    });
total = total + height(t);
ALL('Circular') = t;

t = make_table({...
    "BuRe", BuRe; ...
    "BuYe", BuYe; ...
    "GrPi", GrPi; ...
    "GrPu", GrPu; ...
    "PuOr", PuOr; ...
    });
total = total + height(t);
ALL('Diverging') = t;
    

fh = figure();
fh.MenuBar = "none";
fh.ToolBar = "none";
fh.DockControls = "off";
fh.Color = [0.9 0.9 0.9];
fh.Position(2) = 50;
fh.Position(3:4) = [720 720];

k = ALL.keys();
p = 0;
for i = 1 : ALL.Count()
    key = k{i};
    t = ALL(key);
    for j = 1 : height(t)
        p = p + 1;
        name = t{j, "name"};
        fn = t{j, "fn"}{1};
        axh = subplot(total, 1, p);
        preview_cmap(fn, axh);
        axh.XAxis.Visible = "off";
        axh.YAxis.Visible = "off";
        axh.YLabel.Visible = "on";
        axh.YLabel.String = name;
        axh.YLabel.FontSize = 16;
        axh.YLabel.Rotation = 0;
        axh.YLabel.HorizontalAlignment = "right";
        axh.YLabel.VerticalAlignment = "middle";
    end
end

end


function t = make_table(c)

VARIABLE_NAMES = ["name", "fn"];
t = cell2table(c, "variablenames", VARIABLE_NAMES);

end

