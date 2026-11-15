extends Node2D


func _on_button_pressed() -> void:
	$Label.text = "I love pong so much :D"


func _on_button_2_pressed() -> void:
	$Label.text = "I would often go there.\nTo the tiny church there."


func _on_button_3_pressed() -> void:
	Global.current_feature = 0
	Global.score = 0
	get_tree().change_scene_to_file("res://main_menu.tscn")
