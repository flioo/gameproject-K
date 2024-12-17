class_name player extends CharacterBody2D


var cardinal_direction : Vector2 = Vector2.DOWN
var direction :Vector2 = Vector2.ZERO
var move_speed :float = 200.0
var state :String = "idle"


@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var sprite :Sprite2D = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() :
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) :
	
	
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y=Input.get_action_strength("down") - Input.get_action_strength("up")
	velocity=direction * move_speed
	
	if SetState() == true || SetDirection() == true:
		UpdateAnimation()
	
	pass
func _physics_process(delta) :
	move_and_slide()


func SetDirection() -> bool :
	var new_dir : Vector2 =cardinal_direction
	if direction == Vector2.ZERO:
		return false
	if direction.y == 0:
		new_dir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif direction.x == 0:
		new_dir = Vector2.UP if direction.y < 0 else Vector2.DOWN
	
	if new_dir == cardinal_direction:
		return false
	cardinal_direction = new_dir
	sprite.scale.x = -1.5 if cardinal_direction == Vector2.LEFT else 1.5
	return true




func SetState() -> bool:
	var new_state : String ="idle" if direction == Vector2.ZERO else "walk"
	if new_state == state:
		return false
	state = new_state
	return true
			
func UpdateAnimation() -> void :
	animation_player.play(state + "_" + animDirection())
	pass
func animDirection() -> String :
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif  cardinal_direction == Vector2.UP:
		return "up"
	else :
		return "side"
