class_name Character extends CharacterBody3D
# Character expects a node tree like this:
#  CharacterBody3D
#  |_ Armature
#     |_ GunController
#     |  |_ Gun (this must always be the first child of GunController and have a .fire() method)
#     |_ RayCast3D

@onready var RAY = $Armature/RayCast3D
@onready var GUN = $Armature/GunController

func fire():
	if GUN.fire():
		var target = RAY.get_collider()
		print(target)
		# target.HEALTH -= GUN.damage
	else:
		print("out of ammo or fire rate exceeded")

func reload():
	print("reloading gun!")
	GUN.reload()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
