extends Node

var body: CharacterBody2D
var desiredPrimaryAction: bool = false
var desiredSecondaryAction: bool = false

func _ready() -> void:
	body = get_parent()  # CharacterBody2D of the "Player"

func _process(_delta: float) -> void:
	if (Input.is_action_just_pressed("primary_fire")):
		desiredPrimaryAction = true
	
	if (Input.is_action_just_pressed("secondary_fire")):
		desiredSecondaryAction = true


func _physics_process(_delta: float) -> void:
	if (desiredPrimaryAction):
		print("Shoot_P")
		primaryFire()
		desiredPrimaryAction = false
	
	if (desiredSecondaryAction):
		print("Shoot_S")
		secondaryFire()
		desiredSecondaryAction = false


func primaryFire() -> void:
	pass


func secondaryFire() -> void:
	pass
