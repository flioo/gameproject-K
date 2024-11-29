class_name PlayerStateMachine extends Node

var state : Array[State]
var prev_state:State
var curre_state:State
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func Changestate(new_state : State)->void:
	if new_state == null || new_state == curre_state:
		return
		
	if curre_state:
		curre_state.Exit()

	prev_state=curre_state
	curre_state = new_state
	curre_state.Enter()
