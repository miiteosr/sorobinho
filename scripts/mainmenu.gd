extends Node2D

@onready var speed: LineEdit = $menu/text_inputs/speed
@onready var digits: LineEdit = $menu/text_inputs/digits
@onready var numbers: LineEdit = $menu/text_inputs/numbers

func _ready() -> void:
	speed.placeholder_text = str(Game.time)
	digits.placeholder_text = str(Game.digits_per_number)
	numbers.placeholder_text = str(Game.num_to_display)
		
	$menu/labels/xinarow.text = str(Game.inarow) + " in a row"

func _on_enter_btn_pressed() -> void:
	if speed.text.length() > 0:
		if int(speed.text) <= 102 and int(speed.text) >= 0.1:
			Game.time = float(speed.text)
		else:
			$menu/labels/error_txt.visible = true
			return
		

	if digits.text.length() > 0:
		if int(digits.text) > 0 and int(digits.text) <= 10: 
			Game.digits_per_number = int(digits.text)
		else:
			$menu/labels/error_txt.visible = true
			return

	if numbers.text.length() > 0:
		if int(numbers.text) >= 3 and int(numbers.text) <= 100:
			Game.num_to_display = int(numbers.text)
		else:
			$menu/labels/error_txt.visible = true
			return
		
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_settings_btn_pressed() -> void:
	pass


func _on_website_btn_pressed() -> void:
	OS.shell_open("https://miiteos.neocities.org/")


func _on_restart_btn_pressed() -> void:
	OS.shell_open("https://github.com/miiteosr/sorobinho")
