extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
	

func _on_button_reload_scene_pressed():
	
	# in case the audio glitches and stutters
	get_tree().reload_current_scene()
	
	pass


func _on_button_return_main_menu_pressed():
	
	get_tree().change_scene_to_file("res://scenes/Home.tscn")
	
	pass # Replace with function body.
