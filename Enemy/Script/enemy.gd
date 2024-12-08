class_name enemy extends CharacterBody2D

signal direction_changed( new_direction : Vector2)
signal enemy_damaged()
const DIR_4 = [Vector2.RIGHT,Vector2.DOWN,Vector2.LEFT,Vector2.UP]
var cardinal_direction : Vector2 = Vector2.DOWN
var direction :Vector2 = Vector2.ZERO
var Player:player
var invulnerable :bool = false
@export var hp:int = 3 
@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var sprite :Sprite2D = $Sprite2D
@onready var state_machine:EnemyStateMachine =$enemystatemachine
@onready var hit_box :HitBox = $Hitbox

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	state_machine.initialize(self)
	Player =GlobalPlayerManager.Player
	hit_box.damaged.connect(_take_damage)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
 
func  _physics_process(_delta: float) -> void:
	move_and_slide()


func SetDirection(_new_direction : Vector2) -> bool :
	direction =_new_direction
	if direction == Vector2.ZERO:
		return false
	var direction_id :int = int(round((direction + cardinal_direction * 0.9).angle()/ TAU * DIR_4.size()))
	var new_dir = DIR_4[direction_id]
	
	if new_dir == cardinal_direction:
		return false
	cardinal_direction = new_dir
	direction_changed.emit(new_dir)
	sprite.scale.x = -1.5 if cardinal_direction == Vector2.LEFT else 1.5
	return true

	
func Update_Animation(state : String) -> void :
	animation_player.play(state + "_" + anim_Direction())
	pass
	
func anim_Direction() -> String :
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif  cardinal_direction == Vector2.UP:
		return "up"
	else :
		return "side"



func _take_damage ( damage : int) -> void :
	 
	hp -= damage
	enemy_damaged.emit()
