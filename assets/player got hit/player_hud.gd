extends CanvasLayer

var hearts: Array[heartgui] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in $Control/HFlowContainer.get_children():
		if child is heartgui:
			hearts.append(child)
			child.visible = false

func update_hp(_hp: int, _max_hp: int) -> void:
	update_max_hp(_max_hp)
	for i in range(_max_hp):
		update_heart(i, _hp)

func update_heart(_index: int, _hp: int) -> void:
	if _index < hearts.size():  # Validasi indeks sebelum akses
		var _value: int = clampi(_hp - _index * 2, 0, 2)
		hearts[_index].value = _value
	else:
		print("Index out of bounds:", _index)

func update_max_hp(_max_hp: int) -> void:
	var _heart_count: int = roundi(_max_hp * 0.5)
	for i in range(hearts.size()):
		if i < _heart_count:
			hearts[i].visible = true
		else:
			hearts[i].visible = false
