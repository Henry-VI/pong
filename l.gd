extends Control

func _ready() -> void:
	Global.current_feature += 1

func _on_button_pressed() -> void:
	if Global.current_feature == Global.features.SLOP:
		get_tree().change_scene_to_file("res://3d_slop.tscn")
		return
	if Global.current_feature == Global.features.ELYSIUM:
		get_tree().change_scene_to_file("res://vis_novel.tscn")
		return
	get_tree().change_scene_to_file("res://game.tscn")
