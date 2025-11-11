extends Node2D


var laser_scene: PackedScene = preload("res://scenes/projectiles/laser.tscn")
var grenade_scene: PackedScene = preload("res://scenes/projectiles/grenade.tscn")

func _on_gate_player_entered_gate() -> void:
	print("Player has entered gate")


func _on_gate_player_exited_gate() -> void:
	print("Player has exited gate")


func _on_player_action_primary_triggered(firepoint: Marker2D) -> void:
	var laser: Area2D = laser_scene.instantiate()
	laser.global_transform = firepoint.global_transform
	$Projectiles.add_child(laser)


func _on_player_action_secondary_triggered(firepoint: Node2D) -> void:
	var grenade: RigidBody2D = grenade_scene.instantiate()
	grenade.global_transform = firepoint.global_transform
	grenade.linear_velocity = Vector2.UP.rotated(grenade.global_rotation) * grenade.SPEED
	$Projectiles.add_child(grenade)
