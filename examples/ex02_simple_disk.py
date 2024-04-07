"""
in this example, we create a simple disk and render it.
"""

from OpenGLRenderer import Renderer, Disk, Camera, Scene
import matplotlib.pyplot as plt

disk = Disk(name="my disk", diameter=1000)  # create a disk
cam = Camera()  # create camera
scene = Scene(actors=[disk], cameras=[cam])  # create a scene and insert 3d objects and cameras

ren = Renderer()  # create opengl renderer
ren.background_color = [0.8, 0.8, 0.8, 1.0]  # set background color of the renderer. values between 0 and 1; format: RGBA.
ren.bind_scene(scene)  # bind the scene to the renderer (very important)

ren.set_resolution(1080, 1080)  # set rendering resolution
rendered_img = ren.render(0)  # render from the camera of index 0 (we have only one camera in this example)

# show the outputs
plt.imshow(rendered_img)
plt.axis("off")
plt.axis("equal")
plt.show()
