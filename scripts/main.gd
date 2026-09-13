extends Node

@onready var number: Label = $center_container/number
@onready var timer_node = $timer

func _ready() -> void:
	display_nums()	

func _process(delta: float) -> void:
	$total_timer.wait_time = Game.time * Game.num_to_display
	$timebar.value = $total_timer.time_left
	$timebar.max_value = Game.time * Game.num_to_display
	
func display_nums() -> void:
	timer_node.wait_time = Game.time
	
	Game.nums.clear()
	Game.num_sum = 0
	
	await get_tree().create_timer(1).timeout
	
	$cowbellsfx.play()
	$countdown_container/VBoxContainer/set.visible = true
	
	await get_tree().create_timer(1).timeout
	
	$cowbellsfx.play()
	$countdown_container/VBoxContainer/go.visible = true
	
	
	await get_tree().create_timer(0.5).timeout
	$countdown_container.visible = false
	
	await get_tree().create_timer(1).timeout
	
	$total_timer.start()
	for i in range(Game.num_to_display):
		number.text = ""
		await get_tree().create_timer(Game.time * 0.06).timeout
	
		var rand_number = randi_range(1 + int("0".repeat(Game.digits_per_number - 1)) , int("9".repeat(Game.digits_per_number)))
		Game.nums.append(rand_number)
		$bellsfx.play()
		
		number.text = str(rand_number).pad_zeros(Game.digits_per_number)
		timer_node.wait_time = Game.time
		timer_node.start(Game.time)
		await timer_node.timeout
	
	number.text = ""
	for i in Game.nums:
		Game.num_sum += i 
	print(Game.num_sum)
	
	get_tree().change_scene_to_file("res://scenes/finalmenu.tscn")

func _on_back_btn_pressed() -> void:
	Game.inarow = 0
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
