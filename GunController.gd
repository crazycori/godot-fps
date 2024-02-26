extends Node3D


@onready var capacity := 99
@onready var clip := 12
@onready var clip_capacity := 12
@onready var ammo := 30
@onready var RAY := $RayCast3D

func fire():
	if clip > 0:
		clip -= 1
		var target = RAY.get_collider()
		print(target)
	else:
		print("out of ammo, attempting to reload!")
		reload()

func reload():
	while ammo > 0 and clip < clip_capacity:
		ammo -= 1
		clip += 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
