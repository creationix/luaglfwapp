OS_NAME=$(shell uname -s)
MH_NAME=$(shell uname -m)
ifeq (${OS_NAME},Darwin)
ifeq (${MH_NAME},x86_64)
LDFLAGS+= -lm -ldl -o app -pagezero_size 10000 -image_base 100000000 -fPIC -framework GLUT -framework OpenGL -framework AppKit -framework IOKit -framework Foundation -framework ApplicationServices
else
LDFLAGS+= -lm -ldl -o app -fPIC -framework GLUT -framework OpenGL -framework AppKit -framework IOKit -framework Foundation -framework ApplicationServices
endif
else ifeq (${OS_NAME},Linux)
LDFLAGS+=-lX11 -lGL -lglut -lGLU -lXrandr -lm -ldl -o app -rdynamic
endif

app: app.o luajit/src/libluajit.a glfw/src/libglfw3.a libuv/uv.a
	$(CC) -g app.o luajit/src/libluajit.a glfw/src/libglfw3.a libuv/uv.a ${LDFLAGS}

app.o: app.c
	$(CC) -g -c app.c -Iglfw/include -Ilibuv/include -Iluajit/src

luajit/src/libluajit.a:
	$(MAKE) -C luajit

libuv/uv.a:
	$(MAKE) -C libuv

glfw/src/libglfw3.a: glfw/Makefile
	$(MAKE) -C glfw

glfw/Makefile:
	cd glfw && cmake .

clean:
	rm -f app.o app
	$(MAKE) -C libuv clean
	$(MAKE) -C luajit clean
	$(MAKE) -C glfw clean
