extends Control

var mostrado: bool
var idioma_index: Array = ["pt", "en", "fr", "ja"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$options/lang_list.select(idioma_index.find(Game.tts_lang))
	
	$options/mute_btn.button_pressed = Game.mute
	$options/double_click_reset.button_pressed = Game.quick_reset
	$options/disp_num_btn.button_pressed = Game.disp_number
	$options/mark_tts.button_pressed = Game.tts
	
func mostrar() -> void:
	mostrado = true
	var tween = create_tween()
	tween.tween_property(self, "position:y", 0, 0.2)
		
func esconder() -> void:	
	mostrado = false	
	var tween = create_tween()
	tween.tween_property(self, "position:y", 672, 0.2)

func _on_mark_tts_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$options/mark_tts.icon = load("res://images/correct.png")
		Game.tts = true
		$options/lang_list.process_mode = Node.PROCESS_MODE_INHERIT
		$options/lang_list.modulate = Color("ffffff")
		$labels/lang_title.modulate = Color("ffffff")
		$options/disp_num_btn.modulate = Color("ffffff")
		$options/disp_num_btn.process_mode = Node.PROCESS_MODE_INHERIT
	else:
		$options/mark_tts.icon = null
		$options/lang_list.process_mode = Node.PROCESS_MODE_DISABLED
		$options/lang_list.modulate = Color("5a5a5a")
		$labels/lang_title.modulate = Color("5a5a5a")
		$options/disp_num_btn.modulate = Color("5a5a5a")
		$options/disp_num_btn.process_mode = Node.PROCESS_MODE_DISABLED
		$options/disp_num_btn.button_pressed = true
		
		Game.tts = false
		


func _on_disp_num_btn_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$options/disp_num_btn.icon = load("res://images/correct.png")
		Game.disp_number = true
	else:
		$options/disp_num_btn.icon = null
		Game.disp_number = false


func _on_double_click_reset_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$options/double_click_reset.icon = load("res://images/correct.png")
		Game.quick_reset = true
	else:
		$options/double_click_reset.icon = null
		Game.quick_reset = false


func _on_mute_btn_toggled(toggled_on: bool) -> void:
	if toggled_on:
		$options/mute_btn.icon = load("res://images/correct.png")
		Game.mute = true
	else:
		$options/mute_btn.icon = null
		Game.mute = false


func _on_lang_list_item_selected(index: int) -> void:
	match index:
		0:
			Game.tts_lang = "pt"
		1:
			Game.tts_lang = "en"
		2:
			Game.tts_lang = "fr"
		3:
			Game.tts_lang = "ja"
