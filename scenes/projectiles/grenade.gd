extends RigidBody2D

@export_range(800,3000,100) var Impulse: float = 1000


func _ready() -> void:
	apply_impulse(Vector2.UP * Impulse)
