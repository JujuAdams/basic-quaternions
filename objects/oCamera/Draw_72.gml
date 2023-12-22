//Turn on z-writing and z-testing so we're ready for 3D rendering
gpu_set_ztestenable(true);
gpu_set_zwriteenable(true);

//Counterclockwise faces are backfaces. We want to cull these so we're drawing less
gpu_set_cullmode(cull_counterclockwise);

//Set our view + projection matrices
old_world_matrix      = matrix_get(matrix_world); 
old_view_matrix       = matrix_get(matrix_view); 
old_projection_matrix = matrix_get(matrix_projection);

matrix_set(matrix_view, view_matrix);
matrix_set(matrix_projection, projection_matrix);