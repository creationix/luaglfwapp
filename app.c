#include <stdio.h>
#include <stdlib.h>

#include "lua.h"
#include "lauxlib.h"

#define GLFW_INCLUDE_GLU
#include "GL/glfw3.h"

int main(int argc, char* argv[]) {
  // Pull in glfw library
  void* p = glfwInit;

  lua_State* L = luaL_newstate();
  luaL_openlibs(L);

  if (argc < 2) {
    fprintf(stderr, "Please enter script to execute\n");
    return 1;
  }
  if (luaL_loadfile(L, argv[1])) {
    fprintf(stderr, "Couldn't load file: %s\n", lua_tostring(L, -1));
    return 1;
  }

  if (lua_pcall(L, 0, LUA_MULTRET, 0)) {
    fprintf(stderr, "Failed to run script: %s\n", lua_tostring(L, -1));
    return 1;
  }

  lua_close(L);
  return 0;
}
