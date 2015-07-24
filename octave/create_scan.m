function scan = create_scan()

	%%Vertikale Linie (Start: (-5,-5) Ende (-5, 5))
	vert_x = linspace(-5, -5, 10);
	vert_y = linspace(-5, 5, 10);	

	%%Horizontale Linie (Start (-5, 5) Ende (5,5))
	horz_x = linspace(-5, 5, 10);
	horz_y = linspace(5,5,10);

	%%Kreis
	center = [2.5, 2,5];
	radius = 2.5;
	phi = linspace(-pi/2, pi/2, 10);
	kreis_x = center(1) + radius * cos(phi);
	kreis_y = center(2) + radius * sin(phi);
	

	%Vertikale Vektoren für X und Y
	x = [ vert_x'; horz_x'; kreis_y']
	y = [ vert_y'; horz_y'; kreis_y']

	% Scan nachricht
	% x1 y1
	% x2 y2
	scan = [x,y];
end

