class_name State_Stun extends State

@export var knockback_speed : float = 300.0
@export var decelerate_speed : float = 10.0
@export var invulnerable_duration : float = 1.0

var hurt_box : HurtBox
var direction : Vector2

var next_state : State = null

@onready var idle : State = $"../idle"

func init() -> void:
	Player.player_damaged.connect(_player_damaged)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func Enter() -> void :
	Player.UpdateAnimation("Stun")
	Player.animation_player.animation_finished.connect(_animation_finished)
	direction = Player.global_position.direction_to(hurt_box.global_position)
	Player.velocity = direction * -knockback_speed
	Player.SetDirection()
	Player.UpdateAnimation("Stun")
	Player.make_invulnerable(invulnerable_duration)
	Player.effect_animation.play("damaged")
	pass
func Exit() -> void :
	next_state = null
	Player.animation_player.animation_finished.disconnect(_animation_finished)
	pass
func process(_delta: float) -> State:
	Player.velocity += Player.velocity * decelerate_speed *_delta
	return next_state

func Physics(_delta: float) -> State:
	return null
func HandleInput(_event: InputEvent) -> State:
	
	return null

func _player_damaged(_Hurt_box:HurtBox) -> void :	
	hurt_box=_Hurt_box
	state_machine.Changestate(self)
	pass

func _animation_finished(_a : String) -> void :
	next_state = idle
