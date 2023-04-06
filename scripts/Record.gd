extends Control

var effect
var recording

var muteBackingTrack = false

# Called when the node enters the scene tree for the first time.
func _ready():
	
	# Add input devices to "optionbuttoninputdevices"
	for i in AudioServer.get_input_device_list().size():
		$VBoxContainer/OptionButtonInputDevices.add_item(AudioServer.get_input_device_list()[i])
	
	# Add audio files from "recordings" folder to "optionbuttonbackingtracks"
	var dir = DirAccess.open("res://recordings/")
	dir.list_dir_begin()
	for i in dir.get_files().size():
		$VBoxContainer/OptionButtonBackingTrack.add_item(dir.get_files()[i])
	dir.list_dir_end()
	
	# Set up functionality to record audio
	var idx = AudioServer.get_bus_index("Record")
	effect = AudioServer.get_bus_effect(idx, 0)
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass



func _on_button_back_to_main_menu_pressed():
	get_tree().change_scene_to_file("res://scenes/Home.tscn")
	pass # Replace with function body.


func _on_button_start_and_stop_recording_pressed():
	if effect.is_recording_active():
		recording = effect.get_recording()
		effect.set_recording_active(false)
		$VBoxContainer/ButtonStartAndStopRecording.text = "Record"
	else:
		effect.set_recording_active(true)
		if !muteBackingTrack:
			$AudioStreamPlayerBackingTrack.stream = load("recordings/" + $VBoxContainer/OptionButtonBackingTrack.text)
			$AudioStreamPlayerBackingTrack.play()
		$VBoxContainer/ButtonStartAndStopRecording.text = "Stop"
	
	pass # Replace with function body.


func _on_button_save_audio_file_pressed():
	recording.save_to_wav("res://recordings/" + $VBoxContainer/LineEditFileName.text)
	pass # Replace with function body.



func _on_button_mute_backing_track_pressed():
	if !muteBackingTrack:
		$VBoxContainer/ButtonMuteBackingTrack.text = "Backing track is muted"
		muteBackingTrack = true
	else:
		$VBoxContainer/ButtonMuteBackingTrack.text = "Backing track is not muted"
		muteBackingTrack = false
	
	pass # Replace with function body.
