extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_button_go_to_record_scene_pressed():
	get_tree().change_scene_to_file("res://scenes/Record.tscn")
	pass # Replace with function body.


func _on_button_go_to_playback_scene_pressed():
	get_tree().change_scene_to_file("res://scenes/Playback.tscn")
	pass # Replace with function body.
