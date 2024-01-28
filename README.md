# ruby-mittsu-demo
Mittsu ライブラリにあった公式ドキュメントのコード (document-example)とゲーム開発をするときに使えそうな Tips をまとめてみました。  
Mittsu ライブラリとは、Rubyで3Dゲームを作るためのライブラリです。  
コードと実行結果を貼ってあるので、参考にしてみてください。  
公式ドキュメントはこちら→ https://github.com/danini-the-panini/mittsu
 
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [ドキュメントにあった最初のコード](#%E3%83%89%E3%82%AD%E3%83%A5%E3%83%A1%E3%83%B3%E3%83%88%E3%81%AB%E3%81%82%E3%81%A3%E3%81%9F%E6%9C%80%E5%88%9D%E3%81%AE%E3%82%B3%E3%83%BC%E3%83%89)
- [01 Sceneクラス](#01-scene%E3%82%AF%E3%83%A9%E3%82%B9)
  - [01_scene_example.rb](#01_scene_examplerb)
- [02 ジオメトリ(形状)](#02-%E3%82%B8%E3%82%AA%E3%83%A1%E3%83%88%E3%83%AA%E5%BD%A2%E7%8A%B6)
  - [02_geometries_example.rb](#02_geometries_examplerb)
  - [02_lathe_geometery_example.rb](#02_lathe_geometery_examplerb)
  - [02_parametric_geometry_example.rb](#02_parametric_geometry_examplerb)
  - [02_torus_knot_example.rb](#02_torus_knot_examplerb)
- [03 Objectクラス](#03-object%E3%82%AF%E3%83%A9%E3%82%B9)
  - [03_complex_object_example.rb](#03_complex_object_examplerb)
  - [04_ambient_light_example.rb](#04_ambient_light_examplerb)
  - [04_dir_light_example.rb x](#04_dir_light_examplerb-x)
  - [04_hemi_light_example.rb](#04_hemi_light_examplerb)
  - [04_point_light_example.rb　x](#04_point_light_examplerb%E3%80%80x)
  - [04_spot_light_example.rb x](#04_spot_light_examplerb-x)
  - [05_earth_example.rb](#05_earth_examplerb)
  - [05_earth_moon_example.rb](#05_earth_moon_examplerb)
  - [05_texture_example.rb](#05_texture_examplerb)
  - [06_cube_texture_example.rb x](#06_cube_texture_examplerb-x)
  - [06_skybox_example.rb x](#06_skybox_examplerb-x)
  - [07_earth_normal_example.rb x](#07_earth_normal_examplerb-x)
  - [08_shadow_example.rb x](#08_shadow_examplerb-x)
  - [09_line_example.rb x](#09_line_examplerb-x)
  - [10_obj_loader_example.rb](#10_obj_loader_examplerb)
  - [11_character_input_example.rb](#11_character_input_examplerb)
  - [11_keyboard_input_example.rb](#11_keyboard_input_examplerb)
  - [12_mouse_click_example.rb](#12_mouse_click_examplerb)
  - [12_mouse_motion_example.rb](#12_mouse_motion_examplerb)
  - [12_mouse_scroll_example.rb](#12_mouse_scroll_examplerb)
  - [12_orbit_zoom_example.rb](#12_orbit_zoom_examplerb)
  - [13_joystick_example.rb](#13_joystick_examplerb)
  - [14_sprite_example.rb](#14_sprite_examplerb)
  - [15_raycast_example.rb](#15_raycast_examplerb)
  - [15_raycast_obj_example.rb x](#15_raycast_obj_examplerb-x)
  - [16_transparent_objects_example.rb](#16_transparent_objects_examplerb)
  - [17_point_cloud_example.rb x](#17_point_cloud_examplerb-x)
  - [18_remove_object_example.rb](#18_remove_object_examplerb)
  - [19_mesh_face_material_example.rb](#19_mesh_face_material_examplerb)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## ドキュメントにあった最初のコード
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/4da409cd-a25c-403d-8a9e-3e72d3be584f" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '01 Scene Example'

renderer.window.run do
  renderer.render(scene, camera)
end
```

## 01 Sceneクラス
### 01_scene_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/99e1fa7a-c648-4dac-aff5-0994faf799d4" width="50%">

``` ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '01 Scene Example'

renderer.window.run do
  renderer.render(scene, camera)
end
```

## 02 ジオメトリ(形状)
### 02_geometries_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/be47c8e5-463d-4245-a4b9-4fa2eb76325c" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f
TWO_PI = Math::PI * 2.0

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '02 Geometries Example'

geometries = [
  Mittsu::BoxGeometry.new(1.0, 1.0, 1.0),
  Mittsu::SphereGeometry.new(1.0),
  Mittsu::RingGeometry.new(0.5, 1.0, 16, 4, 0.0, Math::PI*1.2),
  Mittsu::RingGeometry.new(0.5, 1.0),
  Mittsu::CircleGeometry.new(1.0, 8, 0.0, Math::PI * 1.3),
  Mittsu::CircleGeometry.new(1.0, 8),
  Mittsu::CylinderGeometry.new(1.0, 1.0, 2.0),
  Mittsu::DodecahedronGeometry.new,
  Mittsu::IcosahedronGeometry.new,
  Mittsu::OctahedronGeometry.new,
  Mittsu::TetrahedronGeometry.new,
  Mittsu::PlaneGeometry.new(1.0, 1.0),
  Mittsu::TorusGeometry.new(0.5, 0.2),
  Mittsu::TorusGeometry.new(0.5, 0.2, 8, 6, Math::PI * 1.1),
  Mittsu::TorusKnotGeometry.new(0.5, 0.15)
]

colors = [
  0x00ff00,
  0xff0000,
  0x0000ff,
  0xff00ff,
  0xffff00,
  0x00ffff
]

meshes = geometries.each_with_index.map do |geometry, i|
  material = Mittsu::MeshBasicMaterial.new(color: colors[i % colors.length])
  mesh = Mittsu::Mesh.new(geometry, material)
  mesh.position.x = Math.sin((i.to_f / geometries.length.to_f) * TWO_PI) * 6.0
  mesh.position.y = Math.cos((i.to_f / geometries.length.to_f) * TWO_PI) * 6.0
  scene.add(mesh)
  mesh
end

camera.position.z = 10.0

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

renderer.window.run do
  meshes.each do |mesh|
    mesh.rotation.x += 0.05
    mesh.rotation.y += 0.05
  end

  renderer.render(scene, camera)
end
```

### 02_lathe_geometery_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/fcc8900c-8206-4974-98d2-fed6af29db9c" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '02 Lathe geometry Example'

points = 10.times.map do |i|
  Mittsu::Vector2.new(Math.sin(i.to_f * 0.2) * 10.0 + 5.0, (i.to_f - 5.0) * 2.0)
end

geometry = Mittsu::LatheGeometry.new(points, 30, 0.0, Math::PI*1.1)
material = Mittsu::MeshPhongMaterial.new(color: 0x00ff00, side: Mittsu::DoubleSide)
cube = Mittsu::Mesh.new(geometry, material)
scene.add(cube)

box_geometry = Mittsu::BoxGeometry.new(1.0, 1.0, 1.0)
room_material = Mittsu::MeshPhongMaterial.new(color: 0xffffff)
room_material.side = Mittsu::BackSide
room = Mittsu::Mesh.new(box_geometry, room_material)
room.scale.set(10.0, 10.0, 10.0)
scene.add(room)

light = Mittsu::DirectionalLight.new(0xffffff, 0.5) # white, half intensity
light.position.set(0.6, 0.9, 0.5)
light_object = Mittsu::Object3D.new
light_object.add(light)
scene.add(light_object)

camera.position.z = 5.0

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

renderer.window.run do
  cube.rotation.x += 0.01
  cube.rotation.y -= 0.01

  renderer.render(scene, camera)
end
```

### 02_parametric_geometry_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/c2d02d44-b0bf-40eb-be8b-bdab8f4b42fe" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f
TWO_PI = Math::PI * 2.0

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '02 Parametric Geometry Example'

functions = [
  Mittsu::ParametricGeometry.klein,
  Mittsu::ParametricGeometry.plane(10.0, 10.0),
  Mittsu::ParametricGeometry.mobius,
  Mittsu::ParametricGeometry.mobius3d
]

colors = [
  0x00ff00,
  0xff0000,
  0x0000ff,
  0xff00ff,
  0xffff00,
  0x00ffff
]

meshes = functions.each_with_index.map do |func, i|
  geometry = Mittsu::ParametricGeometry.new(func, 25, 25)
  material = Mittsu::MeshPhongMaterial.new(color: colors[i % colors.length], side: Mittsu::DoubleSide)
  mesh = Mittsu::Mesh.new(geometry, material)
  mesh.scale.set(0.1, 0.1, 0.1)
  mesh.position.x = Math.sin((i.to_f / functions.length.to_f) * TWO_PI) * 2.0
  mesh.position.y = Math.cos((i.to_f / functions.length.to_f) * TWO_PI) * 2.0
  scene.add(mesh)
  mesh
end

box_geometry = Mittsu::BoxGeometry.new(1.0, 1.0, 1.0)
room_material = Mittsu::MeshPhongMaterial.new(color: 0xffffff)
room_material.side = Mittsu::BackSide
room = Mittsu::Mesh.new(box_geometry, room_material)
room.scale.set(10.0, 10.0, 10.0)
scene.add(room)

light = Mittsu::DirectionalLight.new(0xffffff, 0.5) # white, half intensity
light.position.set(0.6, 0.9, 0.5)
light_object = Mittsu::Object3D.new
light_object.add(light)
scene.add(light_object)

camera.position.z = 5.0

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

renderer.window.run do
  meshes.each do |mesh|
    mesh.rotation.x += 0.05
    mesh.rotation.y += 0.05
  end

  renderer.render(scene, camera)
end
```

### 02_torus_knot_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/aa14a6b7-e404-4906-b6ff-8137f825999e" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '02 Torus Knot Example'

geometry = Mittsu::TorusKnotGeometry.new(1.0, 0.4, 64, 64)
material = Mittsu::MeshPhongMaterial.new(color: 0x00ff00)
cube = Mittsu::Mesh.new(geometry, material)
scene.add(cube)

box_geometry = Mittsu::BoxGeometry.new(1.0, 1.0, 1.0)
room_material = Mittsu::MeshPhongMaterial.new(color: 0xffffff)
room_material.side = Mittsu::BackSide
room = Mittsu::Mesh.new(box_geometry, room_material)
room.scale.set(10.0, 10.0, 10.0)
scene.add(room)

light = Mittsu::DirectionalLight.new(0xffffff, 0.5) # white, half intensity
light.position.set(0.6, 0.9, 0.5)
light_object = Mittsu::Object3D.new
light_object.add(light)
scene.add(light_object)

camera.position.z = 5.0

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

renderer.window.run do
  cube.rotation.x += 0.01
  cube.rotation.y -= 0.01

  renderer.render(scene, camera)
end
```

## 03 Objectクラス
### 03_complex_object_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/9eee113f-4334-468a-8795-10c9d0181960" width="50%">

``` ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
scene.name = 'Root Scene'
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '03 Complex Object Example'

objects = 3.times.map do |i|
  sphere_geometry = Mittsu::SphereGeometry.new(1.0)
  box_geometry = Mittsu::BoxGeometry.new(1.0, 1.0, 1.0)
  green_material = Mittsu::MeshBasicMaterial.new(color: 0x00ff00)
  blue_material = Mittsu::MeshBasicMaterial.new(color: 0x0000ff)
  cube = Mittsu::Mesh.new(box_geometry, green_material)
  cube.name = 'Green Cube'
  sphere = Mittsu::Mesh.new(sphere_geometry, blue_material)
  sphere.name = 'Blue Ball'

  cube.position.set(0.5, 0.0, 0.0)
  sphere.position.set(-0.5, 0.0, 0.0)

  Mittsu::Object3D.new.tap do |o|
    o.add(cube)
    o.add(sphere)
    o.position.x = -3.0 + (i.to_f * 3.0)

    scene.add(o)
  end
end

scene.print_tree

camera.position.z = 5.0

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

renderer.window.run do
  objects.each do |object|
    object.rotation.x += 0.1
    object.rotation.y += 0.1
  end

  renderer.render(scene, camera)
end
```

### 04_ambient_light_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/b08b201e-b8f7-4d68-af68-a7a335fbe3a0" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '04 Ambient Light Example'

geometry = Mittsu::SphereGeometry.new(1.0)
material = Mittsu::MeshLambertMaterial.new(color: 0x00ff00)
cube = Mittsu::Mesh.new(geometry, material)
scene.add(cube)

box_geometry = Mittsu::BoxGeometry.new(1.0, 1.0, 1.0)
room_material = Mittsu::MeshPhongMaterial.new(color: 0xffffff)
room_material.side = Mittsu::BackSide
room = Mittsu::Mesh.new(box_geometry, room_material)
room.scale.set(10.0, 10.0, 10.0)
scene.add(room)

light = Mittsu::AmbientLight.new(0x404040) # soft white light
scene.add(light)

camera.position.z = 5.0

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

renderer.window.run do
  cube.rotation.x += 0.1
  cube.rotation.y += 0.1

  renderer.render(scene, camera)
end
```

### 04_dir_light_example.rb x
<img src="" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '04 Directional Light Example'

geometry = Mittsu::SphereGeometry.new(1.0)
material = Mittsu::MeshLambertMaterial.new(color: 0x00ff00)
cube = Mittsu::Mesh.new(geometry, material)
scene.add(cube)

box_geometry = Mittsu::BoxGeometry.new(1.0, 1.0, 1.0)
room_material = Mittsu::MeshPhongMaterial.new(color: 0xffffff)
room_material.side = Mittsu::BackSide
room = Mittsu::Mesh.new(box_geometry, room_material)
room.scale.set(10.0, 10.0, 10.0)
scene.add(room)

light = Mittsu::DirectionalLight.new(0xffffff, 0.5) # white, half intensity
light.position.set(0.5, 1.0, 0.0)
light_object = Mittsu::Object3D.new
light_object.add(light)
scene.add(light_object)

camera.position.z = 5.0

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

renderer.window.run do
  light_object.rotation.x += 0.1
  light_object.rotation.y += 0.1

  renderer.render(scene, camera)
end
```

### 04_hemi_light_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/390f9621-d59f-4c06-b3bd-51be1fb91c7a" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '04 Hemisphere Light Example'

geometry = Mittsu::SphereGeometry.new(1.0)

material = Mittsu::MeshLambertMaterial.new(color: 0xff0000)
sphere = Mittsu::Mesh.new(geometry, material)
sphere.position.x = -3.0
scene.add(sphere)

material1 = Mittsu::MeshLambertMaterial.new(color: 0x00ff00)
sphere1 = Mittsu::Mesh.new(geometry, material1)
scene.add(sphere1)

material2 = Mittsu::MeshLambertMaterial.new(color: 0x0000ff)
sphere2 = Mittsu::Mesh.new(geometry, material2)
sphere2.position.x = 3.0
scene.add(sphere2)

box_geometry = Mittsu::SphereGeometry.new(1.0)
room_material = Mittsu::MeshPhongMaterial.new(color: 0xffffff)
room_material.side = Mittsu::BackSide
room = Mittsu::Mesh.new(box_geometry, room_material)
room.scale.set(10.0, 10.0, 10.0)
scene.add(room)

light = Mittsu::HemisphereLight.new(0xCCF2FF, 0x055E00, 0.5) # blue/green, half intensity
scene.add(light)

camera.position.z = 5.0

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

renderer.window.run do
  renderer.render(scene, camera)
end
```

### 04_point_light_example.rb　x
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/9eee113f-4334-468a-8795-10c9d0181960" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '04 Point Light Example'

sphere_geometry = Mittsu::SphereGeometry.new(1.0)
box_geometry = Mittsu::BoxGeometry.new(1.0, 1.0, 1.0)
green_material = Mittsu::MeshPhongMaterial.new(color: 0x00ff00)
blue_material = Mittsu::MeshPhongMaterial.new(color: 0x0000ff)
magenta_material = Mittsu::MeshPhongMaterial.new(color: 0xff00ff)
cube = Mittsu::Mesh.new(box_geometry, green_material)
sphere1 = Mittsu::Mesh.new(sphere_geometry, blue_material)
sphere1.position.set(3.0, 0.0, 0.0)
sphere2 = Mittsu::Mesh.new(sphere_geometry, magenta_material)
sphere2.position.set(-3.0, 0.0, 0.0)

scene.add(cube)
scene.add(sphere1)
scene.add(sphere2)

room_material = Mittsu::MeshPhongMaterial.new(color: 0xffffff)
room_material.side = Mittsu::BackSide
room = Mittsu::Mesh.new(box_geometry, room_material)
room.scale.set(10.0, 10.0, 10.0)
scene.add(room)

light = Mittsu::PointLight.new(0xffffff, 1.0, 10.0, 1.0)
dot = Mittsu::Mesh.new(box_geometry, Mittsu::MeshBasicMaterial.new(color: 0xffffff))
dot.scale.set(0.1, 0.1, 0.1)
light.add(dot)
light.position.set(0.0, 1.5, 0.0)
light_object = Mittsu::Object3D.new
light_object.add(light)
scene.add(light_object)

camera.position.z = 5.0

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

renderer.window.run do
  light_object.rotation.z += 0.1
  cube.rotation.x += 0.1
  cube.rotation.y += 0.1

  renderer.render(scene, camera)
end
```

### 04_spot_light_example.rb x
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/9eee113f-4334-468a-8795-10c9d0181960" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '04 Spot Light Example'

box_geometry = Mittsu::BoxGeometry.new(1.0, 1.0, 1.0)
sphere_geometry = Mittsu::SphereGeometry.new(1.0)
floor_geometry = Mittsu::BoxGeometry.new(20.0, 0.1, 20.0, 20, 1, 20)
green_material = Mittsu::MeshLambertMaterial.new(color: 0x00ff00)
blue_material = Mittsu::MeshLambertMaterial.new(color: 0x0000ff)
sphere = Mittsu::Mesh.new(sphere_geometry, blue_material)
floor = Mittsu::Mesh.new(floor_geometry, green_material)
floor.position.set(0.0, -2.0, 0.0)
scene.add(sphere)
scene.add(floor)

room_material = Mittsu::MeshPhongMaterial.new(color: 0xffffff)
room_material.side = Mittsu::BackSide
room = Mittsu::Mesh.new(box_geometry, room_material)
room.scale.set(10.0, 10.0, 10.0)
scene.add(room)

light = Mittsu::SpotLight.new(0xffffff, 1.0, 10.0)
light.position.set(3.0, 1.0, 0.0)
dot = Mittsu::Mesh.new(box_geometry, Mittsu::MeshBasicMaterial.new(color: 0xffffff))
dot.scale.set(0.1, 0.1, 0.1)
light.add(dot)
light_object = Mittsu::Object3D.new
light_object.add(light)
scene.add(light_object)

camera.position.z = 5.0

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

renderer.window.run do
  light_object.rotation.y += 0.1

  renderer.render(scene, camera)
end
```

### 05_earth_example.rb

<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/847d99cb-8905-4259-8eb6-35a61c8aeefe" width="50%">

### 05_earth_moon_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/c5cfafd3-1edc-451b-a531-460d4c3ffe56" width="50%">


### 05_texture_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/f7042997-f147-4a64-8971-594d1b57ddea" width="50%">


### 06_cube_texture_example.rb x


<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/9eee113f-4334-468a-8795-10c9d0181960" width="50%">

### 06_skybox_example.rb x

<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/9eee113f-4334-468a-8795-10c9d0181960" width="50%">


### 07_earth_normal_example.rb x

<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/9eee113f-4334-468a-8795-10c9d0181960" width="50%">

### 08_shadow_example.rb x
<img src="" width="50%">

### 09_line_example.rb x

<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/9eee113f-4334-468a-8795-10c9d0181960" width="50%">

### 10_obj_loader_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/4ac59f60-264b-499e-85fb-0096cd152a1d" width="50%">

```
document-example % ruby 10_obj_loader_example.rb 
Mittsu OpenGL Renderer 0.4.0
Scene (<Scene #1>) [0.0, 0.0, 0.0]
┗╸Group (<Group #3>) [0.0, 0.0, 0.0]
  ┣╸Object3D (mesh1.002_mesh1-geometry) [0.0, 0.0, 0.0]
  ┃ ┣╸Mesh (mesh1.002_mesh1-geometry male-02-1noCullingID_male-02-1noCulling.JP) [0.0, 0.0, 0.0]
  ┃ ┣╸Mesh (mesh1.002_mesh1-geometry orig_02_-_Defaul1noCu_orig_02_-_Defaul1noCu) [0.0, 0.0, 0.0]
  ┃ ┗╸Mesh (mesh1.002_mesh1-geometry FrontColorNoCullingID_orig_02_-_Defaul1noCu) [0.0, 0.0, 0.0]
  ┣╸Object3D (mesh2.002_mesh2-geometry) [0.0, 0.0, 0.0]
  ┃ ┗╸Mesh (mesh2.002_mesh2-geometry male-02-1noCullingID_male-02-1noCulling.JP) [0.0, 0.0, 0.0]
  ┣╸Object3D (mesh3.002_mesh3-geometry) [0.0, 0.0, 0.0]
  ┃ ┗╸Mesh (mesh3.002_mesh3-geometry male-02-1noCullingID_male-02-1noCulling.JP) [0.0, 0.0, 0.0]
  ┣╸Object3D (mesh4.002_mesh4-geometry) [0.0, 0.0, 0.0]
  ┃ ┗╸Mesh (mesh4.002_mesh4-geometry _01_-_Default1noCulli__01_-_Default1noCulli) [0.0, 0.0, 0.0]
  ┣╸Object3D (mesh5.002_mesh5-geometry) [0.0, 0.0, 0.0]
  ┃ ┗╸Mesh (mesh5.002_mesh5-geometry _01_-_Default1noCulli__01_-_Default1noCulli) [0.0, 0.0, 0.0]
  ┣╸Object3D (mesh6.002_mesh6-geometry) [0.0, 0.0, 0.0]
  ┃ ┗╸Mesh (mesh6.002_mesh6-geometry _01_-_Default1noCulli__01_-_Default1noCulli) [0.0, 0.0, 0.0]
  ┣╸Object3D (mesh7.002_mesh7-geometry) [0.0, 0.0, 0.0]
  ┃ ┗╸Mesh (mesh7.002_mesh7-geometry _01_-_Default1noCulli__01_-_Default1noCulli) [0.0, 0.0, 0.0]
  ┣╸Object3D (mesh8.002_mesh8-geometry) [0.0, 0.0, 0.0]
  ┃ ┗╸Mesh (mesh8.002_mesh8-geometry _01_-_Default1noCulli__01_-_Default1noCulli) [0.0, 0.0, 0.0]
  ┣╸Object3D (mesh9.002_mesh9-geometry) [0.0, 0.0, 0.0]
  ┃ ┣╸Mesh (mesh9.002_mesh9-geometry male-02-1noCullingID_male-02-1noCulling.JP) [0.0, 0.0, 0.0]
  ┃ ┗╸Mesh (mesh9.002_mesh9-geometry FrontColorNoCullingID_male-02-1noCulling.JP) [0.0, 0.0, 0.0]
  ┗╸Object3D (mesh10.002_mesh10-geometry) [0.0, 0.0, 0.0]
    ┣╸Mesh (mesh10.002_mesh10-geometry male-02-1noCullingID_male-02-1noCulling.JP) [0.0, 0.0, 0.0]
    ┗╸Mesh (mesh10.002_mesh10-geometry FrontColorNoCullingID_male-02-1noCulling.JP) [0.0, 0.0, 0.0]
```
### 11_character_input_example.rb
キーボードの文字を認識する

<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/9eee113f-4334-468a-8795-10c9d0181960" width="50%">

```
qwertyuiop@@;lkjhgfdsazxbnm,% 
```

### 11_keyboard_input_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/387b648f-8f65-4148-a579-469f817712fd" width="50%">

### 12_mouse_click_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/e9e5ad66-1ec4-4e13-b7c2-082a6d609cea" width="50%">

### 12_mouse_motion_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/059d5aba-0308-46a8-ad9e-b6f76cb05f05" width="50%">

### 12_mouse_scroll_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/d2e21cda-28f4-4993-b962-e9b0889f5819" width="50%">

### 12_orbit_zoom_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/b74a5848-aea8-432e-b775-51374fb340f1" width="50%">


### 13_joystick_example.rb

```
ERROR: Please plug in a joystick to run this example.
```

### 14_sprite_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/22b2c110-4fe2-41e1-830d-10a891d0d5da" width="50%">

### 15_raycast_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/7ba01089-e571-46f9-8361-10a1e69d7ae0" width="50%">

### 15_raycast_obj_example.rb x

<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/9eee113f-4334-468a-8795-10c9d0181960" width="50%">


### 16_transparent_objects_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/c135976c-25f9-48b2-9933-80e5452cf72d" width="50%">


### 17_point_cloud_example.rb x
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/9eee113f-4334-468a-8795-10c9d0181960" width="50%">

### 18_remove_object_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/030e7712-7ae6-488e-8de9-71d47df1aa77" width="50%">

### 19_mesh_face_material_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/2ac5a94f-0051-4f20-9a6e-eb8481718f2e" width="50%">
