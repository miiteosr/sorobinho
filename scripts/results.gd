extends Node

@onready var resp_txt: Label = $center_container/VBoxContainer/number
@onready var sua_resp: Label = $center_container/VBoxContainer/sua_resp
@onready var conta: Label = $center_container/VBoxContainer/conta

var audio_finished: bool = false
var result_mostrado: bool = false

func _on_audio_drumroll_finished() -> void:
	audio_finished = true

func _ready() -> void:
	resp_txt.text = str(Game.num_sum)
	sua_resp.text = "Your Answer: " + str(Game.resposta)
	get_tree().create_timer(3.90).timeout.connect(show_result)
	
	for i in range(Game.nums.size()):
		conta.text += str(Game.nums[i])
		if i != Game.nums.size() - 1:
			conta.text += " + "	
	
func _input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.pressed:
		if !audio_finished:
			show_result()
			$audio_drumroll.stop()
		else:
			get_tree().change_scene_to_file("res://scenes/main.tscn")
		
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and !audio_finished:
		show_result()
		$audio_drumroll.stop()

func show_result() -> void:
	if result_mostrado:
		return
		
	result_mostrado = true

	$center_container.visible = true
	$restart_btn.visible = true
	await get_tree().create_timer(0.1).timeout

	if Game.resposta == Game.num_sum:
		var tween = create_tween()
		tween.tween_property($background, "modulate", Color("#00cc85"), 0.5)		
		Game.inarow += 1
	else:
		var tween = create_tween()
		tween.tween_property($background, "modulate", Color("#9D00FF"), 0.5)
		Game.inarow = 0

func _on_back_btn_pressed() -> void:
	Transition.transition()
	await Transition.on_transition_finished
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
