extends Node

var body: CharacterBody2D
var canPrimary: bool = true
var canSeconday: bool = true
var desiredPrimaryAction: bool = false
var desiredSecondaryAction: bool = false
@export_range(0,2,0.1) var cooldownPrimary: float = 0.5
@export_range(0,4,0.5) var cooldownSecondary: float = 2


func _ready() -> void:
	body = get_parent()  # CharacterBody2D of the "Player"

func _process(_delta: float) -> void:
	if (Input.is_action_just_pressed("primary_fire") and canPrimary):
		desiredPrimaryAction = true
	
	if (Input.is_action_just_pressed("secondary_fire") and canSeconday):
		desiredSecondaryAction = true


func _physics_process(_delta: float) -> void:
	if (desiredPrimaryAction):
		print("Shoot_P")
		primaryFire()
		desiredPrimaryAction = false
		canPrimary = false
		$PrimaryTimer.start(cooldownPrimary)
	
	if (desiredSecondaryAction):
		print("Shoot_S")
		secondaryFire()
		desiredSecondaryAction = false
		canSeconday = false
		$SecondaryTimer.start(cooldownSecondary)


func primaryFire() -> void:
	pass


func secondaryFire() -> void:
	pass


func _on_primary_timer_timeout() -> void:
	canPrimary = true


func _on_secondary_timer_timeout() -> void:
	canSeconday = true
