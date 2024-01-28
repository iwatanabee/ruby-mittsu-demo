require 'mittsu'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

# シーン1の作成
scene1 = Mittsu::Scene.new

# カメラの作成
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)
camera.position.z = 5
# レンダラーの作成
renderer = Mittsu::OpenGLRenderer.new(width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '01 Scene Example')

# 立方体の作成
geometry = Mittsu::BoxGeometry.new(1, 1, 1)
material = Mittsu::MeshBasicMaterial.new(color: 0x00ff00)
cube = Mittsu::Mesh.new(geometry, material)
scene1.add(cube)

# シーン2の作成
scene2 = Mittsu::Scene.new

# 球体の作成
sphere_geometry = Mittsu::SphereGeometry.new(0.5, 32, 32)
sphere_material = Mittsu::MeshBasicMaterial.new(color: 0xff0000)
sphere = Mittsu::Mesh.new(sphere_geometry, sphere_material)
scene2.add(sphere)

# 現在のシーン
@current_scene = scene1

def transition_screen(renderer, camera, scene1, scene2)
  renderer.window.on_key_pressed do |glfw_key|
    if glfw_key == GLFW_KEY_SPACE
      if @current_scene == scene1
        @current_scene = scene2
      else
        @current_scene = scene1
      end
    end
  end
  renderer.render(@current_scene, camera)
end

# アニメーションの開始
renderer.window.run do
  transition_screen(renderer, camera, scene1, scene2)
end



