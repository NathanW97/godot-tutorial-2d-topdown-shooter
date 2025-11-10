extends Node

var body: CharacterBody2D
var firePoint: Node2D
var firePointList: Array
var canPrimary: bool = true
var canSeconday: bool = true
var desiredPrimaryAction: bool = false
var desiredSecondaryAction: bool = false
@export_range(0,2,0.1) var cooldownPrimary: float = 0.5
@export_range(0,4,0.5) var cooldownSecondary: float = 2

signal primary_triggered(firePoint:Marker2D)
signal secondary_triggered(firePoint:Node2D)


func _ready() -> void:
	body = get_parent()  # CharacterBody2D of the "Player"
	firePoint = %FirePoint
	firePointList = %FirePoint.get_children()

func _process(_delta: float) -> void:
	if (Input.is_action_just_pressed("primary_fire") and canPrimary):
		desiredPrimaryAction = true
	
	if (Input.is_action_just_pressed("secondary_fire") and canSeconday):
		desiredSecondaryAction = true


func _physics_process(_delta: float) -> void:
	if (desiredPrimaryAction):
		# Send a random fire start point up the chain to the level script
		primary_triggered.emit(firePointList[randi_range(0,len(firePointList)-1)])
		primaryFire()
		desiredPrimaryAction = false
		canPrimary = false
		$PrimaryTimer.start(cooldownPrimary)
	
	if (desiredSecondaryAction):
		secondary_triggered.emit(firePoint)
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
