local ffi = require 'ffi'
local C = ffi.C
local glu = {}

ffi.cdef "void gluPerspective(double fovy, double aspect, double zNear, double zFar);"
glu.Perspective = C.gluPerspective

ffi.cdef [[void gluLookAt(double eyeX, double eyeY, double eyeZ,
                         double centerX, double centerY, double centerZ,
                         double upX, double upY, double upZ);]]
glu.LookAt = C.gluLookAt

return glu
