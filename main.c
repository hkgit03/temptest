#include <GLFW/glfw3.h>
#include <stdio.h>
#include <stdlib.h>
#include <GL/gl.h>

//temporary
#include <unistd.h> // sleep

void error_callback(int error, const char* description) {
    fprintf(stderr, "GLFW error occured: %s\n", description);
}

int main(int argc, char** argv) {

    // set up GLFW
    glfwSetErrorCallback(error_callback);
    if(glfwInit() != GLFW_TRUE) {
        exit(1);
    }
    glfwWindowHint(GLFW_CONTEXT_VERSION_MAJOR, 2);
    glfwWindowHint(GLFW_CONTEXT_VERSION_MINOR, 0);

    // get a window
    GLFWwindow* window = glfwCreateWindow(640, 480, "temptest", NULL, NULL);
    if(!window) {
        fprintf(stderr, "GLFW window creation failed\n");
        exit(1);
    }

    // draw things
    printf("Window acquired. Wayland display: %s\n",
            getenv("WAYLAND_DISPLAY"));
    int width, height;
    glfwMakeContextCurrent(window);
    glfwGetFramebufferSize(window, &width, &height);
    glViewport(0, 0, width, height);
    glClearColor(1.0f, 1.0f, 1.0f, 0.0f);

    sleep(1);
    glfwSwapBuffers(window);
    sleep(1);

    // clean up
    glfwDestroyWindow(window);
    glfwTerminate();
    return 0;
}
