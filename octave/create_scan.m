function scan = create_scan()

	%%Vertikale Linie (Start: (-5,-5) Ende (-5, 5))
	[vert_x, vert_y] = linie([-5,-5], [-5,5], 20);

	%%Horizontale Linie (Start (-5, 5) Ende (5,5))
	[horz_x, horz_y] = linie([-5,5], [5,5], 20);

	%%Kreis
	center = [7.5, 7.5];
	radius = 2.5;
	phi = linspace(pi * 1.25, -pi * 0.25, 20)
	kreis_x = center(1) + cos(phi) .* radius
	kreis_y = center(2) + sin(phi) .* radius;
	
	%%Noch eine Linie 
	[horz2_x, horz2_y] = linie([10,5], [20,5], 20);

	%%Und nochmal eine
	[horz3_x, horz3_y] = linie([21,5], [25,2], 20 );

	
	
	%Vertikale Vektoren für X und Y
	x = [ vert_x'; horz_x'; kreis_x'; horz2_x'; horz3_x']
	y = [ vert_y'; horz_y'; kreis_y'; horz2_y'; horz3_y']

	% Scan nachricht
	% x1 y1
	% x2 y2
	scan = [x,y];
end


%Linienerzeugung, Punkte als [x,y]
function [line_x, line_y] = linie(start, ende, anzahl)
	line_x = linspace(start(1), ende(1), anzahl);
	line_y = linspace(start(2), ende(2), anzahl)
end
