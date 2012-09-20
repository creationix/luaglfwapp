local p = require('utils').prettyPrint
local glfw = require 'glfw'
local gl = require 'gl'
local glu = require 'glu'

if not glfw.Init() then error("Failed to initialize GLFW") end

local window = glfw.CreateWindow(640, 480, "WINDOWED", "Spinning Triangle", nil)
if not window then error("Failed to open GLFW window") end

-- Enable vertical sync (on cards that support it)
glfw.MakeContextCurrent(window)
glfw.SwapInterval(1)

-- Ensure we can capture the escape key being pressed below
glfw.SetInputMode(window, "STICKY_KEYS", true)

while true do

  local x = glfw.GetCursorPos(window)
  local width, height = glfw.GetWindowSize(window)

  -- Special case: avoid division by zero below
  if height == 0 then height = 1 end

  gl.Viewport(0, 0, width, height)

  -- Clear color buffer to black
  gl.ClearColor(0, 0, 0, 0)
  gl.Clear("COLOR_BUFFER_BIT")

  -- Select and setup the projection matrix
  gl.MatrixMode("PROJECTION")
  gl.LoadIdentity()
  glu.Perspective(65, width / height, 1, 100)

  -- Select and setup the modelview matrix
  gl.MatrixMode("MODELVIEW")
  gl.LoadIdentity()
  glu.LookAt(0,  1, 0,   -- Eye-position
             0, 20, 0,   -- View-point
             0,  0, 1)   -- Up-vector

  -- Draw a rotating colorful triangle
  gl.Translatef(0, 14, 0)
  gl.Rotatef(0.3 * x, 0, 0, 1)

  gl.Begin("TRIANGLES")
  gl.Color3f(1, 0, 0)
  gl.Vertex3f(-5, 0, -4)
  gl.Color3f(0, 1, 0)
  gl.Vertex3f(5, 0, -4)
  gl.Color3f(0, 0, 1)
  gl.Vertex3f(0, 0, 6)
  gl.End()

  glfw.SwapBuffers(window);
  glfw.PollEvents();

  -- Check if the ESC key was pressed or the window should be closed
  if glfw.GetKey(window, "KEY_ESCAPE") ~= 0 then
    break;
  end
  if glfw.GetWindowParam(window, "CLOSE_REQUESTED") ~= 0 then
    break;
  end

end

glfw.Terminate()
