extends CharacterBody2D


signal action_primary_triggered(firePoint:Marker2D)
signal action_secondary_triggered(firePoint:Node2D)

func _ready() -> void:
	$PlayerAction.connect("primary_triggered",Callable(self,"_on_action_primary_triggered"))
	$PlayerAction.connect("secondary_triggered", Callable(self,"_on_action_secondary_triggered"))


func _on_action_primary_triggered(firePoint:Marker2D) -> void:
	emit_signal("action_primary_triggered", firePoint)


func _on_action_secondary_triggered(firePoint:Node2D) -> void:
	emit_signal("action_secondary_triggered", firePoint)
