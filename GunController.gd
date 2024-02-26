extends Node3D

@onready var GUN = self.get_children()[0]

func fire() -> bool:
	"""
	Attempt to consume ammo, return whether successful
	"""
	if GUN.clip > 0:
		GUN.clip -= 1
		return true
	return false

func reload():
	while GUN.ammo > 0 and GUN.clip < GUN.clip_capacity:
		GUN.ammo -= 1
		GUN.clip += 1
