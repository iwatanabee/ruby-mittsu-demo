require 'mittsu'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

# カメラの作成
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)
camera.position.z = 5

# レンダラーの作成
renderer = Mittsu::OpenGLRenderer.new(width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: 'Scene button Example')

# カーソルの作成
cursor = Mittsu::Mesh.new(Mittsu::SphereGeometry.new(0.1), Mittsu::MeshBasicMaterial.new(color: 0x00ffff))

# シーン1の作成
scene1 = Mittsu::Scene.new
cubes = Mittsu::Group.new

geometry = Mittsu::BoxGeometry.new(3, 1, 1)
material = Mittsu::MeshBasicMaterial.new(color: 0x00ff00)
cube = Mittsu::Mesh.new(geometry, material)
cube.position.x = 2

cube1 = cube.clone()
cube1.position.x = -2

cubes.add(cube, cube1)
scene1.add(cubes, cursor)

# シーン2の作成
scene2 = Mittsu::Scene.new

geometry2 = Mittsu::BoxGeometry.new(3, 3, 1)
material2 = Mittsu::MeshBasicMaterial.new(color: 0xff0000)
sphere = Mittsu::Mesh.new(geometry2, material2)
scene2.add(sphere)

# 現在のシーン
@current_scene = scene1

# カーソルの設定
mouse_position = Mittsu::Vector2.new

def screen_to_world(vector, camera)
  vector.unproject(camera).sub(camera.position).normalize()
  distance = -camera.position.z / vector.z
  vector.multiply_scalar(distance).add(camera.position)
end

renderer.window.on_mouse_move do |position|
  mouse_position.x = ((position.x/SCREEN_WIDTH)*2.0-1.0)
  mouse_position.y = ((position.y/SCREEN_HEIGHT)*-2.0+1.0)
  screen_to_world(cursor.position.set(mouse_position.x, mouse_position.y, 0.5), camera)
  p cursor.position
end

renderer.window.on_resize do |width, height|
  screen_width, screen_height = width, height
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

raycaster = Mittsu::Raycaster.new

# renderer.window.run do
#   raycaster.set_from_camera(mouse_position, camera)
#   intersects = raycaster.intersect_objects(cubes.children)

#   cubes.children.each do |cube|
#     cube.material.color.set(0x00ff00)
#   end
#   cursor.position.copy(intersects.first[:point]) unless intersects.empty?
#   intersects.each do |intersect|
#     intersect[:object].material.color.set(0xff00ff)
#   end

#   renderer.render(@current_scene, camera)
# end

# ブロックを押したらシーンを切り替える
def transition_screen(renderer, camera, scene1, scene2, cursor)
  renderer.window.on_key_pressed do |glfw_key|
    if glfw_key == GLFW_KEY_SPACE
      if @current_scene == scene1
        @current_scene = scene2
      else
        @current_scene = scene1
      end
    end
  end
  @current_scene.add(cursor)
  renderer.render(@current_scene, camera)
end

# アニメーションの開始
renderer.window.run do
  raycaster.set_from_camera(mouse_position, camera)
  intersects = raycaster.intersect_objects(cubes.children)

  cubes.children.each do |cube|
    cube.material.color.set(0x00ff00)
  end

  cursor.position.copy(intersects.first[:point]) unless intersects.empty?
  intersects.each do |intersect|
    intersect[:object].material.color.set(0xff00ff)
  end
  transition_screen(renderer, camera, scene1, scene2, cursor)
end



