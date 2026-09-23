extends Node

@onready var answerbox: LineEdit = $center_container/VBoxContainer/answerbox
@onready var ok_btn: Button = $center_container/VBoxContainer/ok_btn
@onready var back_btn: Button = $back_btn

func _ready() -> void:
	await get_tree().create_timer(0.5).timeout
	answerbox.grab_focus()
	$OnscreenKeyboard.show()

func _on_ok_btn_pressed() -> void:
	validate()

func validate() -> void:
	if answerbox.text.length() > 0:
		Game.resposta = int(answerbox.text)
		print(Game.resposta)
		get_tree().change_scene_to_file("res://scenes/result.tscn")
	
func _on_back_btn_pressed() -> void:
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
	Game.inarow = 0


func _on_restart_btn_pressed() -> void:
	Game.inarow = 0
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file("res://scenes/main.tscn")
