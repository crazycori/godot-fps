extends Node3D

@onready var GUN = self.get_children()[0]
@onready var AUDIO_GUNSHOT = GUN.get_node("AudioGunshot")
@onready var AUDIO_RELOAD = GUN.get_node("AudioReload")
@onready var AUDIO_EMPTY = GUN.get_node("AudioEmpty")

@onready var is_firing = false
@onready var is_reloading = false

func _physics_process(delta):
	rotation.x = lerp(rotation.x, 0.0, 0.25)


func fire() -> bool:
	"""
	Attempt to consume ammo, return whether successful
	"""
	if is_firing or is_reloading:
		return false
	if GUN.clip > 0:
		GUN.clip -= 1
		AUDIO_GUNSHOT.play()
		$TimerFireRate.start(GUN.fire_rate)
		# make the gun kick
		position.z += 0.2
		position.y += 0.2
		rotation.x = 20.0
		is_firing = true
		return true
	AUDIO_EMPTY.play()
	return false

func reload():
	if is_firing or is_reloading:
		return
	if GUN.ammo > 0 and GUN.clip < GUN.clip_capacity:
		AUDIO_RELOAD.play()
		$TimerReload.start(GUN.reload_duration)
		is_reloading = true
		GUN.visible = false
		
	while GUN.ammo > 0 and GUN.clip < GUN.clip_capacity:
		GUN.ammo -= 1
		GUN.clip += 1


func _on_timer_fire_rate_timeout():
	is_firing = false

func _on_timer_reload_timeout():
	is_reloading = false
	GUN.visible = true
