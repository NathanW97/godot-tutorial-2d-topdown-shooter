extends Area2D

@export_range(800,3000,100) var speed: float = 1000

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += Vector2.UP.rotated(global_rotation) * speed * delta
