"""
in this example, we simply display the opengl info of the current device
"""

from OpenGLRenderer import Renderer


ren = Renderer()  # create opengl renderer
print("OpenGL and graphic driver info:\n", ren.get_opengl_info())  # print info about opengl on this device
