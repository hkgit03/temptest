#include <stdio.h>
#include <GLFW/glfw3.h>

void error_callback(int error, const char* description)
{
    fprintf(stderr, "GLFW error occured: %s\n", description);
}

void run_glfw_stuff()
{
    printf("Hello, GLFW!\n");
}

int main(int argc, char** argv)
{
    glfwSetErrorCallback(error_callback);
    if(glfwInit() != GLFW_TRUE)
    {
        return 1;
    }
    run_glfw_stuff();
    glfwTerminate();
    return 0;
}
