extends Node2D

@onready var speed: LineEdit = $speed
@onready var digits: LineEdit = $digits
@onready var numbers: LineEdit = $numbers

func _ready() -> void:
	speed.placeholder_text = str(Game.time)
	digits.placeholder_text = str(Game.digits_per_number)
	numbers.placeholder_text = str(Game.num_to_display)
		
	$xinarow.text = str(Game.inarow) + " in a row"

func _process(delta: float) -> void:
	$background.modulate = $ColorPickerButton.color

func _on_enter_btn_pressed() -> void:
	if speed.text.length() > 0:
		if int(speed.text) <= 10:
			Game.time = float(speed.text)
		else:
			$error_txt.visible = true
			return
		

	if digits.text.length() > 0:
		if int(digits.text) > 0 and int(digits.text) <= 10: 
			Game.digits_per_number = int(digits.text)
		else:
			$error_txt.visible = true
			return

	if numbers.text.length() > 0:
		if int(numbers.text) >= 3 and int(numbers.text) <= 100:
			Game.num_to_display = int(numbers.text)
		else:
			$error_txt.visible = true
			return
		
	get_tree().change_scene_to_file("res://scenes/main.tscn")
