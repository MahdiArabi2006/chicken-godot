extends Node3D

var bullet_scene: PackedScene = preload("res://Bullet.tscn")  # مسیر مستقیم
@onready var muzzle: Marker3D = $Muzzle

func _process(_delta):
	if Input.is_action_just_pressed("fire"):
		_fire()

func _fire():
	if bullet_scene == null:
		print("bullet_scene is null!")
		return

	# ساخت گلوله
	var bullet = bullet_scene.instantiate()
	get_tree().current_scene.add_child(bullet)

	# موقعیت گلوله روی Muzzle
	bullet.global_transform.origin = muzzle.global_transform.origin

	# جهت شلیک: مستقیم جلو Muzzle
	var direction = -muzzle.global_transform.basis.z.normalized()
	bullet.start(direction)
