extends Node2D


var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")


func _on_gate_player_entered_gate() -> void:
	print("Player has entered gate")


func _on_gate_player_exited_gate() -> void:
	print("Player has exited gate")


func _on_player_action_primary_triggered(firepoint: Node2D) -> void:
	var laser = laser_scene.instantiate()
	laser.global_transform = firepoint.global_transform
	add_child(laser)


func _on_player_action_secondary_triggered(firepoint: Node2D) -> void:
	print("Secondary Fired")
