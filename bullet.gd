extends Node3D

@export var speed: float = 50.0       # سرعت گلوله
@export var lifetime: float = 2.0     # مدت زمان نمایش گلوله
var velocity: Vector3 = Vector3.ZERO

func start(direction: Vector3):
	velocity = direction.normalized() * speed
	# پس از lifetime ثانیه، خودکار حذف شود
	await get_tree().create_timer(lifetime).timeout
	queue_free()

func _process(delta):
	if velocity != Vector3.ZERO:
		translate(velocity * delta)
