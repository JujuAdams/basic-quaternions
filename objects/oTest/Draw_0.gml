var _matrix = QuatGetRotationMatrix(quat);
_matrix = matrix_multiply(_matrix, matrix_build(x, y, z,   0,0,0,   1,1,1));
matrix_set(matrix_world, _matrix);
UggAABB(0, 0, 0, 70, 70, 70);
matrix_set(matrix_world, matrix_build_identity());