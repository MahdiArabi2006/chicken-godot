extends RigidBody3D

@onready var player: CharacterBody3D = $"../CharacterBody3D" 
@export var SPEED = 0.01
# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.

@export var turn_speed := 0.1
@export var thrust := 10.0
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	pass
	
	
func _integrate_forces(state):
	var target_dir = (player.global_position - global_position).normalized()
	target_dir.y = 0
	var current_basis = state.transform.basis
	var desired_basis = Basis.looking_at(target_dir, Vector3.UP)
	
	# Smoothly interpolate rotation for stability
	state.transform.basis = current_basis.slerp(desired_basis, 0.1)
	state.linear_velocity = target_dir * SPEED
