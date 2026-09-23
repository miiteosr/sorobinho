extends Node2D

@onready var speed: LineEdit = $menu/text_inputs/speed
@onready var digits: LineEdit = $menu/text_inputs/digits
@onready var numbers: LineEdit = $menu/text_inputs/numbers

var num_limit: int 

func _ready() -> void:
	speed.placeholder_text = str(Game.time)
	digits.placeholder_text = str(Game.digits_per_number)
	numbers.placeholder_text = str(Game.num_to_display)
		
	$misc/xinarow.text = str(Game.inarow) + " in a row"

func _on_enter_btn_pressed() -> void:
	if speed.text.length() > 0:
		if int(speed.text) <= 10 and float(speed.text) >= 0.1:
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

	if int(digits.text) == 1: num_limit = 100
	if int(digits.text) == 2: num_limit = 50
	if int(digits.text) >= 3: num_limit = 25

	if numbers.text.length() > 0:
		if int(numbers.text) >= 2 and int(numbers.text) <= num_limit:
			Game.num_to_display = int(numbers.text)
		else:
			$menu/labels/error_txt.visible = true
			return
		
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_settings_btn_pressed() -> void:
	if $settings.mostrado:
		$settings.esconder()
	else:
		$settings.mostrar()

func _on_website_btn_pressed() -> void:
	OS.shell_open("https://miiteos.neocities.org/")


func _on_restart_btn_pressed() -> void:
	OS.shell_open("https://github.com/miiteosr/sorobinho")
