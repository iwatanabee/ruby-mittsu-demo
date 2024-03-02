# ruby-mittsu-demo
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/be47c8e5-463d-4245-a4b9-4fa2eb76325c" width="50%">  



## はじめに
Mittsu ライブラリにあった公式ドキュメントのコード (document-example)の 実行結果 とゲーム開発をするときに使えそうな Tips をまとめてみました。  

Mittsu ライブラリとは、Rubyで3Dゲームを作るためのライブラリです。  

コードと実行結果を貼ってあるので、参考にしてみてください。  

公式ドキュメントはこちら→ https://github.com/danini-the-panini/mittsu  

<hr>

<details style="font-size:large;" open="false">
<summary>目次</summary>
<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
	
- [ドキュメントの最初のコード](#%E3%83%89%E3%82%AD%E3%83%A5%E3%83%A1%E3%83%B3%E3%83%88%E3%81%AE%E6%9C%80%E5%88%9D%E3%81%AE%E3%82%B3%E3%83%BC%E3%83%89)
- [Sceneクラス](#scene%E3%82%AF%E3%83%A9%E3%82%B9)
  - [01_scene_example.rb](#01_scene_examplerb)
- [ジオメトリ(形状)](#%E3%82%B8%E3%82%AA%E3%83%A1%E3%83%88%E3%83%AA%E5%BD%A2%E7%8A%B6)
  - [02_geometries_example.rb](#02_geometries_examplerb)
  - [02_lathe_geometery_example.rb](#02_lathe_geometery_examplerb)
  - [02_parametric_geometry_example.rb](#02_parametric_geometry_examplerb)
  - [02_torus_knot_example.rb](#02_torus_knot_examplerb)
- [Objectクラス](#object%E3%82%AF%E3%83%A9%E3%82%B9)
  - [03_complex_object_example.rb](#03_complex_object_examplerb)
- [ライト](#%E3%83%A9%E3%82%A4%E3%83%88)
  - [04_ambient_light_example.rb](#04_ambient_light_examplerb)
  - [04_dir_light_example.rb x](#04_dir_light_examplerb-x)
  - [04_hemi_light_example.rb](#04_hemi_light_examplerb)
  - [04_point_light_example.rb　x](#04_point_light_examplerb%E3%80%80x)
  - [04_spot_light_example.rb x](#04_spot_light_examplerb-x)
- [マテリアルとテクスチャー](#%E3%83%9E%E3%83%86%E3%83%AA%E3%82%A2%E3%83%AB%E3%81%A8%E3%83%86%E3%82%AF%E3%82%B9%E3%83%81%E3%83%A3%E3%83%BC)
  - [05_earth_example.rb](#05_earth_examplerb)
  - [05_earth_moon_example.rb](#05_earth_moon_examplerb)
  - [05_texture_example.rb](#05_texture_examplerb)
- [テクスチャー](#%E3%83%86%E3%82%AF%E3%82%B9%E3%83%81%E3%83%A3%E3%83%BC)
  - [06_cube_texture_example.rb x](#06_cube_texture_examplerb-x)
  - [06_skybox_example.rb x](#06_skybox_examplerb-x)
  - [07_earth_normal_example.rb x](#07_earth_normal_examplerb-x)
  - [08_shadow_example.rb x](#08_shadow_examplerb-x)
  - [09_line_example.rb x](#09_line_examplerb-x)
  - [10_obj_loader_example.rb](#10_obj_loader_examplerb)
- [イベントハンドラ](#%E3%82%A4%E3%83%99%E3%83%B3%E3%83%88%E3%83%8F%E3%83%B3%E3%83%89%E3%83%A9)
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
- [オブジェクト](#%E3%82%AA%E3%83%96%E3%82%B8%E3%82%A7%E3%82%AF%E3%83%88)
  - [16_transparent_objects_example.rb](#16_transparent_objects_examplerb)
  - [17_point_cloud_example.rb x](#17_point_cloud_examplerb-x)
  - [18_remove_object_example.rb](#18_remove_object_examplerb)
- [色](#%E8%89%B2)
  - [19_mesh_face_material_example.rb](#19_mesh_face_material_examplerb)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->
</details>  

## 実行の仕方
自分のPCで試したいのであれば、公式ドキュメントを見ながら、環境構築しましょう。
環境構築が終わったら、このディレクトリを、クローンして実行してください。  
```
git clone https://github.com/iwatanabee/ruby-mittsu-demo.git
```
例えば、02_geometries_example.rb を実行したいときは、以下のコマンドを打ってください  
```
cd document-example
```
```ruby
ruby 02_geometries_example.rb
```

## ドキュメントの最初のコード
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

## Sceneクラス
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

## ジオメトリ(形状)
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

## Objectクラス
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
## ライト
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

### 04_dir_light_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/7a1456f0-27f6-4e74-a863-7b27a7bd3231" width="50%">

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

### 04_point_light_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/ab2806a9-3b18-4653-8a65-e81227705b09" width="50%">

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

### 04_spot_light_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/eac69f26-3d2f-41e1-a748-287b08c425ac" width="50%">

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
## マテリアルとテクスチャー
### 05_earth_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/847d99cb-8905-4259-8eb6-35a61c8aeefe" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '05 Earth Example'

box_geometry = Mittsu::BoxGeometry.new(1.0, 1.0, 1.0)
light = Mittsu::PointLight.new(0xffffff, 4.0, 10.0, 1.5) # white, 4x intensity
dot = Mittsu::Mesh.new(box_geometry, Mittsu::MeshBasicMaterial.new(color: 0xffffff))
dot.scale.set(0.1, 0.1, 0.1)
light.add(dot)
light.position.set(0.0, 1.5, 1.0)
light_object = Mittsu::Object3D.new
light_object.add(light)
scene.add(light_object)

geometry = Mittsu::SphereGeometry.new(1.0, 32, 16)
texture = Mittsu::ImageUtils.load_texture(File.join File.dirname(__FILE__), 'earth.png')
material = Mittsu::MeshLambertMaterial.new(map: texture)
earth = Mittsu::Mesh.new(geometry, material)
scene.add(earth)

camera.position.z = 5.0

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

renderer.window.run do
  light_object.rotation.z += 0.05
  earth.rotation.x += 0.05
  earth.rotation.y += 0.05

  renderer.render(scene, camera)
end

```

### 05_earth_moon_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/c5cfafd3-1edc-451b-a531-460d4c3ffe56" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '05 Earth Example'

light = Mittsu::HemisphereLight.new(0xffffff, 0x000000, 1)
light.position.x = 1000
scene.add(light)

moon_container = Mittsu::Object3D.new

geometry = Mittsu::SphereGeometry.new(1.0, 32, 16)
texture = Mittsu::ImageUtils.load_texture(File.join File.dirname(__FILE__), 'earth.png')
material = Mittsu::MeshLambertMaterial.new(map: texture)
earth = Mittsu::Mesh.new(geometry, material)
scene.add(earth)

geometry = Mittsu::SphereGeometry.new(0.2725631769, 32, 16)
texture = Mittsu::ImageUtils.load_texture(File.join File.dirname(__FILE__), 'moon.png')
material = Mittsu::MeshLambertMaterial.new(map: texture)
moon = Mittsu::Mesh.new(geometry, material)
moon.position.x = 30.167948517
moon_container.add(moon)

scene.add(moon_container)

camera.position.z = 30.0

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

renderer.window.run do
  moon_container.rotation.y += 0.0003571428571
  earth.rotation.y += 0.01

  renderer.render(scene, camera)
end

```

### 05_texture_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/f7042997-f147-4a64-8971-594d1b57ddea" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '05 Texture Example'

geometry = Mittsu::BoxGeometry.new(1.0, 1.0, 1.0)
texture = Mittsu::ImageUtils.load_texture(File.join File.dirname(__FILE__), 'texture.png')
material = Mittsu::MeshBasicMaterial.new(map: texture)
cube = Mittsu::Mesh.new(geometry, material)
scene.add(cube)

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
  # break
end

```
## テクスチャー
### 06_cube_texture_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/a40f3d7a-c518-488b-9c9b-17ac45103bbb" width="50%">


```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '06 Cube Texture Example'

geometry = Mittsu::SphereGeometry.new(2.0, 32, 16)
texture = Mittsu::ImageUtils.load_texture_cube(
  [ 'rt', 'lf', 'up', 'dn', 'bk', 'ft' ].map { |path|
    File.join File.dirname(__FILE__), 'cubemap', "tron_#{path}.png"
  }
)
material = Mittsu::MeshBasicMaterial.new(env_map: texture)
earth = Mittsu::Mesh.new(geometry, material)
scene.add(earth)

camera.position.z = 5.0
camera_container =  Mittsu::Object3D.new
camera_container.add(camera)
scene.add(camera_container)

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

renderer.window.run do
	camera_container.rotation.y += 0.01;
  renderer.render(scene, camera)
end

```

### 06_skybox_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/6f5da99f-4d25-4257-a8b6-0495308cea6a" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
skybox_scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)
skybox_camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 1.0, 100.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '06 Skybox Example'
renderer.auto_clear = false

geometry = Mittsu::SphereGeometry.new(2.0, 32, 16)
texture = Mittsu::ImageUtils.load_texture_cube(
  [ 'rt', 'lf', 'up', 'dn', 'bk', 'ft' ].map { |path|
    File.join File.dirname(__FILE__), 'cubemap', "tron_#{path}.png"
  }
)
material = Mittsu::MeshBasicMaterial.new(env_map: texture)
earth = Mittsu::Mesh.new(geometry, material)
scene.add(earth)

shader = Mittsu::ShaderLib[:cube]
shader.uniforms['tCube'].value = texture

skybox_material = Mittsu::ShaderMaterial.new({
  fragment_shader: shader.fragment_shader,
  vertex_shader: shader.vertex_shader,
  uniforms: shader.uniforms,
  depth_write: false,
  side: Mittsu::BackSide
})

skybox = Mittsu::Mesh.new(Mittsu::BoxGeometry.new(100, 100, 100), skybox_material)
skybox_scene.add(skybox)

camera.position.z = 5.0

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = skybox_camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
  skybox_camera.update_projection_matrix
end

x = 0
renderer.window.run do
  camera.position.x = 5.0 * Math.sin(x * 0.01)
  camera.position.z = 5.0 * Math.cos(x * 0.01)
  camera.look_at(Mittsu::Vector3.new(0.0, 0.0, 0.0))
  skybox_camera.rotation.copy(camera.rotation)

  renderer.clear
	renderer.render(skybox_scene, skybox_camera);
  renderer.clear_depth
  renderer.render(scene, camera)
  x += 1
end

```

### 07_earth_normal_example.rb x
<img src="#" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '07 Earth Normal Example'

light = Mittsu::SpotLight.new(0xffffff, 2.0)
light.position.x = 1000
light.look_at(scene.position)
scene.add(light)

geometry = Mittsu::SphereGeometry.new(2.0, 64, 64)
texture = Mittsu::ImageUtils.load_texture(File.join File.dirname(__FILE__), './earth.png')
normal = Mittsu::ImageUtils.load_texture(File.join File.dirname(__FILE__), './earth_normal.png')
material = Mittsu::MeshPhongMaterial.new({ map: texture, normal_map: normal })
earth = Mittsu::Mesh.new(geometry, material)
scene.add(earth)

camera.position.z = 5.0

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

renderer.window.run do
  earth.rotation.y += 0.01

  renderer.render(scene, camera)
end

```

### 08_shadow_example.rb x
<img src="#" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '08 Shadow Example'
renderer.shadow_map_enabled = true
renderer.shadow_map_type = Mittsu::PCFSoftShadowMap

floor = Mittsu::Mesh.new(
  Mittsu::BoxGeometry.new(100.0, 1.0, 100.0),
  Mittsu::MeshPhongMaterial.new(color: 0x00ff00)
)
floor.position.y = -1.0
floor.receive_shadow = true
scene.add(floor)

NB = 15
NR = 5
balls = NB.times.map do |index|
  NR.times.map do |r|
    ring = (3 + r)
    i = r * 0.1 + (index.to_f / NB.to_f) * Math::PI * 2
    Mittsu::Mesh.new(
      Mittsu::SphereGeometry.new(0.5, 16, 16),
      Mittsu::MeshLambertMaterial.new(color: r.even? ? 0x00ffff : 0xff00ff)
    ).tap do |b|
      b.cast_shadow = true
      b.receive_shadow = true
      b.position.z = Math.cos(i) * ring
      b.position.x = Math.sin(i) * ring
      scene.add(b)
    end
  end
end.flatten

ball = Mittsu::Mesh.new(
  Mittsu::SphereGeometry.new(1.0, 32, 32),
  Mittsu::MeshLambertMaterial.new(color: 0xffffff)
)
ball.cast_shadow = true
ball.receive_shadow = true
scene.add(ball)

light = Mittsu::SpotLight.new(0xffffff, 1.0)
light.position.set(20.0, 30.0, 0.0)

light.cast_shadow = true
light.shadow_darkness = 0.5

light.shadow_map_width = 1024
light.shadow_map_height = 1024

light.shadow_camera_near = 1.0
light.shadow_camera_far = 100.0
light.shadow_camera_fov = 60.0

light.shadow_camera_visible = true
scene.add(light)

camera.position.z = 10.0
camera.position.y = 10.0
camera.look_at(floor.position)

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

x = 0
renderer.window.run do
  # break if x > 0
  x += 1
  light.position.x = Math::sin(x * 0.01) * 20.0
  light.position.z = Math::cos(x * 0.01) * 20.0

  balls.each_with_index do |b, i|
    b.position.y = (1.0 + Math::sin(x * 0.05 + i)) * 2.0
  end

  renderer.render(scene, camera)
end
```

### 09_line_example.rb x
<img src="#" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '09 Line Example'

ball = Mittsu::Mesh.new(
  Mittsu::SphereGeometry.new(0.1),
  Mittsu::MeshBasicMaterial.new(color: 0xff00ff)
)
scene.add(ball)

material = Mittsu::LineBasicMaterial.new(color: 0xff00ff)

geometry = Mittsu::Geometry.new()
NP = 10000
MD = 10.0
NR = 200
NP.times do |i|
	d = (i.to_f / NP) * MD
	r = (i.to_f / NP) * Math::PI * NR
	x = Math.sin(r) * d
	y = Math.cos(r) * d
	geometry.vertices.push(Mittsu::Vector3.new(x, y, 0.0))
end

line = Mittsu::Line.new(geometry, material)
scene.add(line)

camera.position.z = 5.0
camera.position.y = 0.0
camera.look_at(line.position)

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

x = 0
renderer.window.run do
  # break if x > 0
  x += 1
	line.rotation.z = x * 0.1

  renderer.render(scene, camera)
end

```

### 10_obj_loader_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/4ac59f60-264b-499e-85fb-0096cd152a1d" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '10 OBJ Loader Example'
renderer.shadow_map_enabled = true
renderer.shadow_map_type = Mittsu::PCFSoftShadowMap

loader = Mittsu::OBJMTLLoader.new

object = loader.load(File.expand_path('../male02.obj', __FILE__), 'male02.mtl')

object.receive_shadow = true
object.cast_shadow = true

object.traverse do |child|
  child.receive_shadow = true
  child.cast_shadow = true
end

scene.add(object)

scene.print_tree

floor = Mittsu::Mesh.new(
  Mittsu::BoxGeometry.new(1000.0, 1.0, 1000.0),
  Mittsu::MeshPhongMaterial.new(color: 0xffffff)
)
floor.position.y = -1.0
floor.receive_shadow = true
scene.add(floor)

scene.add Mittsu::AmbientLight.new(0xffffff)

light = Mittsu::SpotLight.new(0xffffff, 1.0)
light.position.set(300.0, 200.0, 0.0)

light.cast_shadow = true
light.shadow_darkness = 0.5

light.shadow_map_width = 1024
light.shadow_map_height = 1024

light.shadow_camera_near = 1.0
light.shadow_camera_far = 2000.0
light.shadow_camera_fov = 60.0

light.shadow_camera_visible = false
scene.add(light)

camera.position.z = 200.0
camera.position.y = 100.0

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

renderer.window.run do
  object.rotation.y += 0.1
  renderer.render(scene, camera)
end

```

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
## イベントハンドラ
### 11_character_input_example.rb
キーボードで入力した文字を認識する  
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/9eee113f-4334-468a-8795-10c9d0181960" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '11 Character Input Example'

renderer.window.on_character_input do |char|
  print char
end

renderer.window.run do
  renderer.render(scene, camera)
end
```

### 11_keyboard_input_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/387b648f-8f65-4148-a579-469f817712fd" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '11 Continous Keyboard Example'

geometry = Mittsu::BoxGeometry.new(1.0, 1.0, 1.0)
material = Mittsu::MeshBasicMaterial.new(color: 0x00ff00)
cube = Mittsu::Mesh.new(geometry, material)
scene.add(cube)

camera.position.z = 5.0

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

renderer.window.run do
  cube.rotation.x += 0.1
  cube.rotation.y += 0.1

  cube.position.y += 0.1 if renderer.window.key_down?(GLFW_KEY_UP)
  cube.position.y -= 0.1 if renderer.window.key_down?(GLFW_KEY_DOWN)
  cube.position.x -= 0.1 if renderer.window.key_down?(GLFW_KEY_LEFT)
  cube.position.x += 0.1 if renderer.window.key_down?(GLFW_KEY_RIGHT)

  renderer.render(scene, camera)
end

```

### 12_mouse_click_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/e9e5ad66-1ec4-4e13-b7c2-082a6d609cea" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '12 Mouse Click Example'

camera.position.z = 5.0

cubes = []
renderer.window.on_mouse_button_pressed do |button, position|
  geometry = Mittsu::BoxGeometry.new(1.0, 1.0, 1.0)
  material = Mittsu::MeshBasicMaterial.new(color: 0x00ff00)
  cube = Mittsu::Mesh.new(geometry, material)
  cube.position.x = ((position.x/SCREEN_WIDTH)*2.0-1.0) * 5.0
  cube.position.y = ((position.y/SCREEN_HEIGHT)*-2.0+1.0) * 5.0
  scene.add(cube)
  cubes << cube
end

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

renderer.window.run do
  cubes.each do |cube|
    cube.rotation.x += 0.1
    cube.rotation.y += 0.1
  end

  renderer.render(scene, camera)
end
```

### 12_mouse_motion_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/059d5aba-0308-46a8-ad9e-b6f76cb05f05" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '12 Mouse Motion Example'

geometry = Mittsu::BoxGeometry.new(1.0, 1.0, 1.0)
material = Mittsu::MeshBasicMaterial.new(color: 0x00ff00)
cube = Mittsu::Mesh.new(geometry, material)
scene.add(cube)

camera.position.z = 5.0

renderer.window.on_mouse_move do |position|
  cube.position.x = ((position.x/SCREEN_WIDTH)*2.0-1.0) * 5.0
  cube.position.y = ((position.y/SCREEN_HEIGHT)*-2.0+1.0) * 5.0
end

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

### 12_mouse_scroll_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/d2e21cda-28f4-4993-b962-e9b0889f5819" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '12 Mouse Scroll Example'

geometry = Mittsu::BoxGeometry.new(1.0, 1.0, 1.0)
material = Mittsu::MeshBasicMaterial.new(color: 0x00ff00)
cube = Mittsu::Mesh.new(geometry, material)
scene.add(cube)

camera.position.z = 5.0

renderer.window.on_scroll do |offset|
  scroll_factor = (1.5 ** (offset.y * 0.1))
  camera.zoom *= scroll_factor
  camera.update_projection_matrix
end

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

### 12_orbit_zoom_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/b74a5848-aea8-432e-b775-51374fb340f1" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '12 Orbit/Zoom Example'

axis_object = Mittsu::Object3D.new
axis_object.add(Mittsu::Mesh.new(
  Mittsu::BoxGeometry.new(1.0, 1.0, 1.0),
  Mittsu::MeshBasicMaterial.new(color: 0xffffff)))
axis_object.add(Mittsu::Mesh.new(
  Mittsu::BoxGeometry.new(10.0, 0.1, 0.1),
  Mittsu::MeshBasicMaterial.new(color: 0xff0000)))
axis_object.add(Mittsu::Mesh.new(
  Mittsu::BoxGeometry.new(0.1, 10.0, 0.1),
  Mittsu::MeshBasicMaterial.new(color: 0x00ff00)))
axis_object.add(Mittsu::Mesh.new(
  Mittsu::BoxGeometry.new(0.1, 0.1, 10.0),
  Mittsu::MeshBasicMaterial.new(color: 0x0000ff)))
scene.add(axis_object)

camera_container = Mittsu::Object3D.new
camera_container.add(camera)
camera.position.z = 5.0
scene.add(camera_container)

renderer.window.on_scroll do |offset|
  scroll_factor = (1.5 ** (offset.y * 0.1))
  camera.zoom *= scroll_factor
  camera.update_projection_matrix
end

X_AXIS = Mittsu::Vector3.new(1.0, 0.0, 0.0)
Y_AXIS = Mittsu::Vector3.new(0.0, 1.0, 0.0)

mouse_delta = Mittsu::Vector2.new
last_mouse_position = Mittsu::Vector2.new

renderer.window.on_mouse_button_pressed do |button, position|
  if button == GLFW_MOUSE_BUTTON_LEFT
    last_mouse_position.copy(position)
  end
end

renderer.window.on_mouse_move do |position|
  if renderer.window.mouse_button_down?(GLFW_MOUSE_BUTTON_LEFT)
    mouse_delta.copy(last_mouse_position).sub(position)
    last_mouse_position.copy(position)

    camera_container.rotate_on_axis(Y_AXIS, mouse_delta.x * 0.01)
    camera_container.rotate_on_axis(X_AXIS, mouse_delta.y * 0.01)
  end
end

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

renderer.window.run do
  renderer.render(scene, camera)
end

```


### 13_joystick_example.rb

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '13 Joystick Example'

if !renderer.window.joystick_present?
  puts "ERROR: Please plug in a joystick to run this example."
  exit 1
end

axis_object = Mittsu::Object3D.new
center_cube = Mittsu::Mesh.new(
  Mittsu::BoxGeometry.new(1.0, 1.0, 1.0),
  Mittsu::MeshBasicMaterial.new(color: 0xffffff))
axis_object.add(center_cube)
axis_object.add(Mittsu::Mesh.new(
  Mittsu::BoxGeometry.new(10.0, 0.1, 0.1),
  Mittsu::MeshBasicMaterial.new(color: 0xff0000)))
axis_object.add(Mittsu::Mesh.new(
  Mittsu::BoxGeometry.new(0.1, 10.0, 0.1),
  Mittsu::MeshBasicMaterial.new(color: 0x00ff00)))
axis_object.add(Mittsu::Mesh.new(
  Mittsu::BoxGeometry.new(0.1, 0.1, 10.0),
  Mittsu::MeshBasicMaterial.new(color: 0x0000ff)))
scene.add(axis_object)

camera_container = Mittsu::Object3D.new
camera_container.add(camera)
camera.position.z = 5.0
scene.add(camera_container)

X_AXIS = Mittsu::Vector3.new(1.0, 0.0, 0.0)
Y_AXIS = Mittsu::Vector3.new(0.0, 1.0, 0.0)

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

left_stick = Mittsu::Vector2.new
right_stick = Mittsu::Vector2.new

JOYSTICK_DEADZONE = 0.15
JOYSTICK_SENSITIVITY = 0.1

puts "Joystick Connected: #{renderer.window.joystick_name}"
puts "Number of Axes: #{renderer.window.joystick_axes.count}"
puts "Number of Buttons: #{renderer.window.joystick_buttons.count}"

renderer.window.on_joystick_button_pressed do |joystick, button|
  center_cube.material.color = Mittsu::Color.new(1.0, 0.0, 1.0) if button == 0
end

renderer.window.on_joystick_button_released do |joystick, button|
  center_cube.material.color = Mittsu::Color.new(1.0, 1.0, 1.0) if button == 0
end

renderer.window.run do
  axes = renderer.window.joystick_axes.map do |axis|
    axis.abs < JOYSTICK_DEADZONE ? 0.0 : axis
  end
  left_stick.set(axes[0], axes[1])
  right_stick.set(axes[2], axes[3])

  camera_container.rotate_on_axis(Y_AXIS, left_stick.x * JOYSTICK_SENSITIVITY)
  camera_container.rotate_on_axis(X_AXIS, left_stick.y * JOYSTICK_SENSITIVITY)

  scroll_factor = (1.5 ** (right_stick.y * 0.1))
  camera.zoom *= scroll_factor
  camera.update_projection_matrix

  renderer.render(scene, camera)
end

```

```
ERROR: Please plug in a joystick to run this example.
```

### 14_sprite_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/22b2c110-4fe2-41e1-830d-10a891d0d5da" width="50>

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

camera = Mittsu::PerspectiveCamera.new(60.0, ASPECT, 1.0, 2100.0)
camera.position.z = 1500.0

camera_ortho = Mittsu::OrthographicCamera.new(-SCREEN_WIDTH / 2.0, SCREEN_WIDTH / 2.0, SCREEN_HEIGHT / 2.0, -SCREEN_HEIGHT / 2.0, 1.0, 10.0)
camera_ortho.position.z = 10.0

scene = Mittsu::Scene.new
scene_ortho = Mittsu::Scene.new

amount = 20
radius = 500

map_a = Mittsu::ImageUtils.load_texture(File.join File.dirname(__FILE__), 'sprite0.png')

material_a = Mittsu::SpriteMaterial.new(map: map_a)

hud_image_width = material_a.map.image.width
hud_image_height = material_a.map.image.height

sprite_top_left, sprite_top_right, sprite_bottom_left, sprite_bottom_right, sprite_center = 5.times.map do
  Mittsu::Sprite.new(material_a).tap do |sprite|
    sprite.scale.set(hud_image_width, hud_image_height, 1.0)
    scene_ortho.add(sprite)
  end
end

update_hud_sprites = -> (window_width, window_height) {
  half_window_width = window_width / 2.0
  half_window_height = window_height / 2.0

  half_image_width = hud_image_width / 2.0
  half_image_height = hud_image_height / 2.0

  sprite_top_left.position.set(half_image_width, window_height - half_image_height, 1.0)
  sprite_top_right.position.set(window_width - half_image_width, window_height - half_image_height, 1.0)
  sprite_bottom_left.position.set(half_image_width, half_image_height, 1.0)
  sprite_bottom_right.position.set(window_width - half_image_width, half_image_height, 1.0)
  sprite_center.position.set(half_window_width, half_window_height, 1.0)
}

update_hud_sprites.(SCREEN_WIDTH, SCREEN_HEIGHT)

map_b = Mittsu::ImageUtils.load_texture(File.join File.dirname(__FILE__), 'sprite1.png')
map_c = Mittsu::ImageUtils.load_texture(File.join File.dirname(__FILE__), 'sprite2.png')

group = Mittsu::Group.new

material_c = Mittsu::SpriteMaterial.new(map: map_c, color: 0xffffff)
material_b = Mittsu::SpriteMaterial.new(map: map_b, color: 0xffffff)

amount.times do
  x = rand - 0.5
  y = rand - 0.5
  z = rand - 0.5

  if z < 0
    material = material_b.clone
  else
    material = material_c.clone
    material.color.set_hsl(0.5 * rand, 0.75, 0.5)
    material.map.offset.set(-0.5, -0.5)
    material.map.repeat.set(2.0, 2.0)
  end

  sprite = Mittsu::Sprite.new(material)

  sprite.position.set(x, y, z)
  sprite.position.normalize
  sprite.position.multiply_scalar(radius)

  group.add(sprite)
end

scene.add(group)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '14 Sprite Example'
renderer.auto_clear = false

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix

  camera_ortho.left = -width / 2.0
  camera_ortho.right = width / 2.0
  camera_ortho.top = height / 2.0
  camera_ortho.bottom = -height / 2.0
  camera_ortho.update_projection_matrix

  update_hud_sprites.(width, height)
end

renderer.window.run do
  time = Time.now.to_f

  group.children.each_with_index do |sprite, i|
    material = sprite.material
    scale = Math.sin(time + sprite.position.x * 0.01) * 0.3 + 1.0

    image_width = material.map.image.width
    image_height = material.map.image.height

    sprite.material.rotation += 0.1 * (i / 1.0)
    sprite.scale.set(scale * image_width, scale * image_height, 1.0)

    if material.map != material_c
      material.opacity = Math.sin(time + sprite.position.x * 0.01) * 0.4 + 0.6
    end

    group.rotation.x = time * 0.5
    group.rotation.y = time * 0.75
    group.rotation.z = time * 1.0

    renderer.clear
    renderer.render(scene, camera)
    renderer.clear_depth
    renderer.render(scene_ortho, camera_ortho)
  end
end

```

### 15_raycast_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/7ba01089-e571-46f9-8361-10a1e69d7ae0" width="50%">

```ruby
require_relative './example_helper'

screen_width = 800
screen_height = 600
ASPECT = screen_width.to_f / screen_height.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: screen_width, height: screen_height, title: '15 Raycast Example'

cursor = Mittsu::Mesh.new(Mittsu::SphereGeometry.new(0.1), Mittsu::MeshBasicMaterial.new(color: 0x00ffff, wireframe: true))
scene.add(cursor)

cubes = Mittsu::Group.new
5.times { |i| 5.times { |j|
  geometry = Mittsu::BoxGeometry.new(0.5, 0.5, 0.5)
  material = Mittsu::MeshBasicMaterial.new(color: 0x00ff00)
  cube = Mittsu::Mesh.new(geometry, material)
  cube.position.set(-3.0 + i*1.5, -3.0 + j*1.5, rand)
  cube.rotation.set(rand, rand, rand)
  cubes.add(cube)
} }
scene.add(cubes)

camera.position.z = 5.0

mouse_position = Mittsu::Vector2.new

def screen_to_world(vector, camera)
  vector.unproject(camera).sub(camera.position).normalize()
  distance = -camera.position.z / vector.z
  vector.multiply_scalar(distance).add(camera.position)
end

renderer.window.on_mouse_move do |position|
  mouse_position.x = ((position.x/screen_width)*2.0-1.0)
  mouse_position.y = ((position.y/screen_height)*-2.0+1.0)
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

  renderer.render(scene, camera)
end

```

### 15_raycast_obj_example.rb x
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/9eee113f-4334-468a-8795-10c9d0181960" width="50%">

```ruby
require_relative './example_helper'

screen_width = 800
screen_height = 600
ASPECT = screen_width.to_f / screen_height.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: screen_width, height: screen_height, title: '15 Raycast OBJ Example'
renderer.shadow_map_enabled = true
renderer.shadow_map_type = Mittsu::PCFSoftShadowMap

cursor = Mittsu::Mesh.new(Mittsu::SphereGeometry.new(5.0), Mittsu::MeshPhongMaterial.new(color: 0xff00ff))
cursor.receive_shadow = true
cursor.cast_shadow = true
scene.add(cursor)

loader = Mittsu::OBJMTLLoader.new

object = loader.load(File.expand_path('../male02.obj', __FILE__), 'male02.mtl')

object.receive_shadow = true
object.cast_shadow = true

object.traverse do |child|
  child.receive_shadow = true
  child.cast_shadow = true
end

scene.add(object)

floor = Mittsu::Mesh.new(
  Mittsu::BoxGeometry.new(1000.0, 1.0, 1000.0),
  Mittsu::MeshPhongMaterial.new(color: 0xffffff)
)
floor.position.y = -1.0
floor.receive_shadow = true
scene.add(floor)

scene.add Mittsu::AmbientLight.new(0x999999)

light = Mittsu::SpotLight.new(0xffffff, 1.0)
light.position.set(300.0, 200.0, 0.0)

light.cast_shadow = true
light.shadow_darkness = 0.5

light.shadow_map_width = 1024
light.shadow_map_height = 1024

light.shadow_camera_near = 1.0
light.shadow_camera_far = 2000.0
light.shadow_camera_fov = 60.0

light.shadow_camera_visible = false
scene.add(light)

camera.position.z = 200.0
camera.position.y = 100.0

mouse_position = Mittsu::Vector2.new

def screen_to_world(vector, camera)
  vector.unproject(camera).sub(camera.position).normalize()
  distance = -camera.position.z / vector.z
  vector.multiply_scalar(distance).add(camera.position)
end

renderer.window.on_mouse_move do |position|
  mouse_position.x = ((position.x/screen_width)*2.0-1.0)
  mouse_position.y = ((position.y/screen_height)*-2.0+1.0)
  screen_to_world(cursor.position.set(mouse_position.x, mouse_position.y, 0.5), camera)
end

renderer.window.on_resize do |width, height|
  screen_width, screen_height = width, height
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

raycaster = Mittsu::Raycaster.new

renderer.window.run do
  raycaster.set_from_camera(mouse_position, camera)
  intersects = raycaster.intersect_object(object, true)

  if intersects.empty?
    cursor.visible = false
  else
    cursor.visible = true
    cursor.position.copy(intersects.first[:point])
  end

  object.rotation.y += 0.1
  renderer.render(scene, camera)
end

```
## オブジェクト
### 16_transparent_objects_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/c135976c-25f9-48b2-9933-80e5452cf72d" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '16 Transparent Objects Example'

geometry = Mittsu::BoxGeometry.new(1.0, 1.0, 1.0)
material = Mittsu::MeshBasicMaterial.new(color: 0x00ffff, opacity: 0.3, transparent: true)
cube = Mittsu::Mesh.new(geometry, material)
scene.add(cube)

geometry = Mittsu::SphereGeometry.new(1.0)
material = Mittsu::MeshBasicMaterial.new(color: 0xff00ff, opacity: 0.3, transparent: true)
sphere = Mittsu::Mesh.new(geometry, material)
scene.add(sphere)

camera.position.z = 5.0

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

t = 0
renderer.window.run do
  cube.rotation.x += 0.1
  cube.rotation.y += 0.1

  sphere.position.set(Math.cos(t)*3.0, 0.0, Math.sin(t)*3.0)

  renderer.render(scene, camera)
  t += 0.1
end

```

### 17_point_cloud_example.rb x
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/9eee113f-4334-468a-8795-10c9d0181960" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

PARTICLE_COUNT = 20000

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '17 Point Cloud Example'

geometry = Mittsu::Geometry.new
PARTICLE_COUNT.times do |i|
  vertex = Mittsu::Vector3.new();
  vertex.x = rand * 2000.0 - 1000.0
  vertex.y = rand * 2000.0 - 1000.0
  vertex.z = rand * 2000.0 - 1000.0
  geometry.vertices << vertex
end

parameters = [
  [
      [1, 1, 0.5], 5
  ],
  [
      [0.95, 1, 0.5], 4
  ],
  [
      [0.90, 1, 0.5], 3
  ],
  [
      [0.85, 1, 0.5], 2
  ],
  [
      [0.80, 1, 0.5], 1
  ]
]

materials = []
parameters.each_with_index do |(_, size), i|
  materials[i] = Mittsu::PointCloudMaterial.new(size: size )

  particles = Mittsu::PointCloud.new(geometry, materials[i])

  particles.rotation.x = rand * 6.0;
  particles.rotation.y = rand * 6.0;
  particles.rotation.z = rand * 6.0;

  scene.add(particles)
end

camera.position.z = 5.0

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

time = 0
renderer.window.run do
  scene.children.each_with_index do |object, i|
    next unless object.is_a? Mittsu::PointCloud
    object.rotation.y = time * (i < 4 ? i + 1.0 : -(i + 1.0))
  end

  materials.each_with_index do |material, i|
    color = parameters[i][0]
    h = (360.0 * (color[0] + time) % 360) / 360.0
    material.color.set_hsl(h, color[1], color[2])
  end

  renderer.render(scene, camera)
  time += 0.001
end

```

### 18_remove_object_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/030e7712-7ae6-488e-8de9-71d47df1aa77" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '18 Remove Object Example'

cubes = Mittsu::Group.new
GEOMETRY = Mittsu::BoxGeometry.new(1.0, 1.0, 1.0)
MATERIAL = Mittsu::MeshBasicMaterial.new(color: 0x00ff00)

def create_cube
  cube = Mittsu::Mesh.new(GEOMETRY, MATERIAL)
  cube.position.x = (rand*2.0-1.0) * 3.0
  cube.position.y = (rand*-2.0+1.0) * 3.0
  cube
end

20.times do
  cubes.add(create_cube)
end

scene.add(cubes)

camera.position.z = 5.0

renderer.window.on_resize do |width, height|
  renderer.set_viewport(0, 0, width, height)
  camera.aspect = width.to_f / height.to_f
  camera.update_projection_matrix
end

renderer.window.run do
  cubes.children.each do |cube|
    cube.rotation.x += 0.1
    cube.rotation.y += 0.1
  end

  cubes.remove cubes.children.first
  cubes.add create_cube

  renderer.render(scene, camera)
end

```
## 色
### 19_mesh_face_material_example.rb
<img src="https://github.com/iwatanabee/ruby-mittsu-demo/assets/83575309/2ac5a94f-0051-4f20-9a6e-eb8481718f2e" width="50%">

```ruby
require_relative './example_helper'

SCREEN_WIDTH = 800
SCREEN_HEIGHT = 600
ASPECT = SCREEN_WIDTH.to_f / SCREEN_HEIGHT.to_f

scene = Mittsu::Scene.new
camera = Mittsu::PerspectiveCamera.new(75.0, ASPECT, 0.1, 1000.0)

renderer = Mittsu::OpenGLRenderer.new width: SCREEN_WIDTH, height: SCREEN_HEIGHT, title: '19 Mesh Face Material Example'

geometry = Mittsu::BoxGeometry.new(1.0, 1.0, 1.0)
material = Mittsu::MeshFaceMaterial.new([
  Mittsu::MeshBasicMaterial.new(color: 0x0046AD), # blue
  Mittsu::MeshBasicMaterial.new(color: 0x009B48), # green
  Mittsu::MeshBasicMaterial.new(color: 0xFFFFFF), # white
  Mittsu::MeshBasicMaterial.new(color: 0xFFD500), # yellow
  Mittsu::MeshBasicMaterial.new(color: 0xF55500), # orange
  Mittsu::MeshBasicMaterial.new(color: 0xB71234), # red
])
cube = Mittsu::Mesh.new(geometry, material)
scene.add(cube)

camera.position.z = 5.0

renderer.window.run do
  cube.rotation.x += 0.1
  cube.rotation.y += 0.1
  renderer.render(scene, camera)
end

```
