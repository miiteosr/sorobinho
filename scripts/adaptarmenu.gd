extends Control

@onready var numbers: LineEdit = $text_inputs/numbers
@onready var digits: LineEdit = $text_inputs/digits
@onready var speed: LineEdit = $text_inputs/speed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if OS.has_feature("mobile"):
		if speed.has_focus():
			position.y = move_toward(position.y, -32, 6) 				
		elif digits.has_focus():
			position.y = move_toward(position.y, -96, 6) 				
		elif numbers.has_focus():
			position.y = move_toward(position.y, -192, 6) 	
		else:
			position.y = move_toward(position.y, 0, 6 ) 	
