local ffi = require('ffi')
local C = ffi.C

local glfw = {}

local function constant(mode)
  if type(mode) == "string" then
    return glfw[mode]
  end
  return mode
end

ffi.cdef "const char* glfwGetVersionString(void);"
function glfw.GetVersionString()
  return ffi.string(C.glfwGetVersionString())
end

ffi.cdef "int glfwInit(void);"
function glfw.Init()
  return C.glfwInit() ~= 0
end

ffi.cdef "void glfwTerminate(void);"
function glfw.Terminate()
  return C.glfwTerminate()
end

glfw.WINDOWED = 0x00010001
glfw.FULLSCREEN = 0x00010002
ffi.cdef "typedef void* GLFWwindow;"
ffi.cdef "GLFWwindow glfwCreateWindow(int width, int height, int mode, const char* title, GLFWwindow share);"
function glfw.CreateWindow(width, height, mode, title, share)
  return C.glfwCreateWindow(width, height, constant(mode), title, share)
end

ffi.cdef "void glfwMakeContextCurrent(GLFWwindow window);"
glfw.MakeContextCurrent = C.glfwMakeContextCurrent

ffi.cdef "void glfwSwapInterval(int interval);"
glfw.SwapInterval = C.glfwSwapInterval


glfw.CURSOR_MODE          = 0x00030001
glfw.STICKY_KEYS          = 0x00030002
glfw.STICKY_MOUSE_BUTTONS = 0x00030003
glfw.SYSTEM_KEYS          = 0x00030004
glfw.KEY_REPEAT           = 0x00030005

ffi.cdef "int glfwGetInputMode(GLFWwindow window, int mode);"
function glfw.GetInputMode(window, mode)
  return C.glfwGetInputMode(window, constant(mode))
end

ffi.cdef "int glfwSetInputMode(GLFWwindow window, int mode, int value);"
function glfw.SetInputMode(window, mode, value)
  return C.glfwSetInputMode(window, constant(mode), value)
end

ffi.cdef "void glfwGetCursorPos(GLFWwindow window, int* xpos, int* ypos);"
function glfw.GetCursorPos(window)
  local _x = ffi.new("int[1]")
  local _y = ffi.new("int[1]")
  C.glfwGetCursorPos(window, _x, _y)
  return _x[0], _y[0]
end

ffi.cdef "void glfwGetWindowSize(GLFWwindow window, int* width, int* height);"
function glfw.GetWindowSize(window)
  local _width = ffi.new("int[1]")
  local _height = ffi.new("int[1]")
  C.glfwGetWindowSize(window, _width, _height);
  return _width[0], _height[0]
end

ffi.cdef "void glfwSetWindowSize(GLFWwindow window, int width, int height);"
glfw.SetWindowSize = C.glfwSetWindowSize

ffi.cdef "void glfwSetWindowTitle(GLFWwindow window, const char* title);"
glfw.SetWindowTitle = C.glfwSetWindowTitle

ffi.cdef "void glfwSwapBuffers(GLFWwindow window);"
glfw.SwapBuffers = C.glfwSwapBuffers

ffi.cdef "void glfwPollEvents(void);"
glfw.PollEvents = C.glfwPollEvents

ffi.cdef "void glfwWaitEvents(void);"
glfw.WaitEvents = C.glfwWaitEvents

glfw.KEY_ESCAPE                 = 256
glfw.KEY_ENTER                  = 257
glfw.KEY_TAB                    = 258
glfw.KEY_BACKSPACE              = 259
glfw.KEY_INSERT                 = 260
glfw.KEY_DELETE                 = 261
glfw.KEY_RIGHT                  = 262
glfw.KEY_LEFT                   = 263
glfw.KEY_DOWN                   = 264
glfw.KEY_UP                     = 265
glfw.KEY_PAGE_UP                = 266
glfw.KEY_PAGE_DOWN              = 267
glfw.KEY_HOME                   = 268
glfw.KEY_END                    = 269
glfw.KEY_CAPS_LOCK              = 280
glfw.KEY_SCROLL_LOCK            = 281
glfw.KEY_NUM_LOCK               = 282
glfw.KEY_PRINT_SCREEN           = 283
glfw.KEY_PAUSE                  = 284
glfw.KEY_F1                     = 290
glfw.KEY_F2                     = 291
glfw.KEY_F3                     = 292
glfw.KEY_F4                     = 293
glfw.KEY_F5                     = 294
glfw.KEY_F6                     = 295
glfw.KEY_F7                     = 296
glfw.KEY_F8                     = 297
glfw.KEY_F9                     = 298
glfw.KEY_F10                    = 299
glfw.KEY_F11                    = 300
glfw.KEY_F12                    = 301
glfw.KEY_F13                    = 302
glfw.KEY_F14                    = 303
glfw.KEY_F15                    = 304
glfw.KEY_F16                    = 305
glfw.KEY_F17                    = 306
glfw.KEY_F18                    = 307
glfw.KEY_F19                    = 308
glfw.KEY_F20                    = 309
glfw.KEY_F21                    = 310
glfw.KEY_F22                    = 311
glfw.KEY_F23                    = 312
glfw.KEY_F24                    = 313
glfw.KEY_F25                    = 314
glfw.KEY_KP_0                   = 320
glfw.KEY_KP_1                   = 321
glfw.KEY_KP_2                   = 322
glfw.KEY_KP_3                   = 323
glfw.KEY_KP_4                   = 324
glfw.KEY_KP_5                   = 325
glfw.KEY_KP_6                   = 326
glfw.KEY_KP_7                   = 327
glfw.KEY_KP_8                   = 328
glfw.KEY_KP_9                   = 329
glfw.KEY_KP_DECIMAL             = 330
glfw.KEY_KP_DIVIDE              = 331
glfw.KEY_KP_MULTIPLY            = 332
glfw.KEY_KP_SUBTRACT            = 333
glfw.KEY_KP_ADD                 = 334
glfw.KEY_KP_ENTER               = 335
glfw.KEY_KP_EQUAL               = 336
glfw.KEY_LEFT_SHIFT             = 340
glfw.KEY_LEFT_CONTROL           = 341
glfw.KEY_LEFT_ALT               = 342
glfw.KEY_LEFT_SUPER             = 343
glfw.KEY_RIGHT_SHIFT            = 344
glfw.KEY_RIGHT_CONTROL          = 345
glfw.KEY_RIGHT_ALT              = 346
glfw.KEY_RIGHT_SUPER            = 347
glfw.KEY_MENU                   = 348
glfw.KEY_LAST                   = glfw.KEY_MENU


ffi.cdef "int glfwGetKey(GLFWwindow window, int key);"
function glfw.GetKey(window, key)
  return C.glfwGetKey(window, constant(key))
end

glfw.ACTIVE               = 0x00020001
glfw.ICONIFIED            = 0x00020002
glfw.CLOSE_REQUESTED      = 0x00020003
glfw.OPENGL_REVISION      = 0x00020004
ffi.cdef "int glfwGetWindowParam(GLFWwindow window, int param);"
function glfw.GetWindowParam(window, param)
  return C.glfwGetWindowParam(window, constant(param))
end

return glfw
