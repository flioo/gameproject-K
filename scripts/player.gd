class_name player extends CharacterBody2D

const DIR_4 = [Vector2.RIGHT,Vector2.DOWN,Vector2.LEFT,Vector2.UP]
var cardinal_direction : Vector2 = Vector2.DOWN
var direction :Vector2 = Vector2.ZERO



@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var sprite :Sprite2D = $Sprite2D
@onready var state_machine:PlayerStateMachine =$StateMachine
signal DirectionChanged(new_direction: Vector2)

# Called when the node enters the scene tree for the first time.
func _ready() :
	state_machine.initialize(self)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) :
	
	
	#direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	#direction.y=Input.get_action_strength("down") - Input.get_action_strength("up")
	direction = Vector2(
		Input.get_axis("left","right"),
		Input.get_axis("up","down")
	).normalized()
	
	pass
func _physics_process(delta) :
	move_and_slide()

func SetDirection() -> bool :

	if direction == Vector2.ZERO:
		return false
	var direction_id :int = int(round((direction + cardinal_direction * 0.9).angle()/ TAU * DIR_4.size()))
	var new_dir = DIR_4[direction_id]
	
	if new_dir == cardinal_direction:
		return false
	cardinal_direction = new_dir
	DirectionChanged.emit(new_dir)
	sprite.scale.x = -1.5 if cardinal_direction == Vector2.LEFT else 1.5
	return true




	
func UpdateAnimation(state : String) -> void :
	animation_player.play(state + "_" + animDirection())
	pass
func animDirection() -> String :
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif  cardinal_direction == Vector2.UP:
		return "up"
	else :
		return "side"
