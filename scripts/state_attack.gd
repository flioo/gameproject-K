class_name State_attack extends State
var attacking:bool =false
@export var Attack_sound:AudioStream
@export_range(1,20,0.5) var decelarate_speed :float = 5.0
@onready var walk :State=$"../walk"
@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var  idle : State=$"../idle"
@onready var sword_effect : AnimationPlayer =$"../../Sprite2D/attackeffect/AnimationPlayer"
@onready var audio : AudioStreamPlayer2D =$"../../audio/AudioStreamPlayer2D"
@onready var hurtbox : HurtBox = $"../../Sprite2D/AttackHurtBox"



# Called every frame. 'delta' is the elapsed time since the previous frame.
func Enter() -> void :
	Player.UpdateAnimation("attack")
	sword_effect.play("Attack_"+Player.animDirection())
	animation_player.animation_finished.connect(EndAttack)
	audio.stream = Attack_sound
	audio.pitch_scale = randf_range(2.0,3.0)
	audio.play()
	attacking = true
	hurtbox.monitoring = true
	
	
	await get_tree().create_timer(0.075).timeout
	
	pass
func Exit() -> void :
	animation_player.animation_finished.disconnect(EndAttack)
	attacking = false
	hurtbox.monitoring = false
	
	pass
func process(_delta: float) -> State:
	
	Player.velocity-= Player.velocity * decelarate_speed * _delta
	if attacking == false :
		if Player.direction ==Vector2.ZERO:
			return idle
		else:
			return walk
	return null

func Physics(_delta: float) -> State:
	return null
func HandleInput(_event: InputEvent) -> State:
	return null
func EndAttack(_newAnimName : String) -> void:
	attacking = false
