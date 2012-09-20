local ffi = require 'ffi'
ffi.cdef[[
  typedef unsigned int GLenum;
  typedef unsigned char GLboolean;
  typedef unsigned int GLbitfield;
  typedef signed char GLbyte;
  typedef short GLshort;
  typedef int GLint;
  typedef int GLsizei;
  typedef unsigned char GLubyte;
  typedef unsigned short GLushort;
  typedef unsigned int GLuint;
  typedef float GLfloat;
  typedef float GLclampf;
  typedef void GLvoid;
  typedef int GLintptrARB;
  typedef int GLsizeiptrARB;
  typedef int GLfixed;
  typedef int GLclampx;



]]
local C = ffi.C
local gl = {}

local function constant(mode)
  if type(mode) == "string" then
    return gl[mode]
  end
  return mode
end

ffi.cdef "void glViewport(int x, int y, size_t width, size_t height);"
gl.Viewport = C.glViewport

ffi.cdef "void glClearColor(float red, float green, float blue, float alpha);"
gl.ClearColor = C.glClearColor

gl.COLOR_BUFFER_BIT = 0x00004000
ffi.cdef "void glClear(unsigned int mask);"
function gl.Clear(mask)
  return C.glClear(constant(mask))
end

gl.MODELVIEW                      = 0x1700
gl.PROJECTION                     = 0x1701
gl.TEXTURE                        = 0x1702

ffi.cdef "void glMatrixMode(unsigned int mode);"
function gl.MatrixMode(mode)
  return C.glMatrixMode(constant(mode))
end

ffi.cdef "void glLoadIdentity(void);"
gl.LoadIdentity = C.glLoadIdentity

ffi.cdef "void glTranslated(double x, double y, double z);"
gl.Translated = C.glTranslated

ffi.cdef "void glTranslatef(float x, float y, float z);"
gl.Translatef = C.glTranslatef

ffi.cdef "void glRotated(double angle, double x, double y, double z);"
gl.Rotated = C.glRotated

ffi.cdef "void glRotatef(float angle, float x, float y, float z);"
gl.Rotatef = C.glRotatef

gl.POINTS                         = 0x0000
gl.LINES                          = 0x0001
gl.LINE_LOOP                      = 0x0002
gl.LINE_STRIP                     = 0x0003
gl.TRIANGLES                      = 0x0004
gl.TRIANGLE_STRIP                 = 0x0005
gl.TRIANGLE_FAN                   = 0x0006

ffi.cdef "void glBegin(unsigned int mode);"
function gl.Begin(mode)
  return C.glBegin(constant(mode))
end

ffi.cdef "void glColor3f(float red, float green, float blue);"
gl.Color3f = C.glColor3f

ffi.cdef "void glVertex3f(float x, float y, float z);"
gl.Vertex3f = C.glVertex3f

ffi.cdef "void glEnd(void);"
gl.End = C.glEnd

return gl
