extends CanvasLayer
signal on_transition_finished

@onready var background: ColorRect = $background
@onready var animation: AnimationPlayer = $animation

func _ready() -> void:
	background.visible = false
	
func transition(color: Color = Color.BLACK) -> void:
	background.color = color
	background.visible = true

	animation.play("fade_in")	
	

func _on_animation_animation_finished(anim_name: StringName) -> void:
	if anim_name == "fade_in":
		on_transition_finished.emit()
		animation.play("fade_out")
	elif anim_name == "fade_out":
		background.visible = false
