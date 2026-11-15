extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.current_feature == Global.features.FIRE_SCORE:
		$tooltip.show()
		$AnimationPlayer.play("tooltip")
		var second_ball := preload("res://ball.tscn")
		var instance = second_ball.instantiate()
		instance.position = Vector2(300, 200)
		instance.direction = Vector2(-1, -1)
		add_child(instance)
	if Global.current_feature == Global.features.TWO_BALLS || Global.current_feature == Global.features.FIRE_SCORE:
		var second_ball := preload("res://ball.tscn")
		var instance = second_ball.instantiate()
		instance.position = Vector2(600, 400)
		instance.direction = Vector2(1, 1)
		add_child(instance)
	
	if Global.current_feature == Global.features.FREEDOM_OF_MOVEMENT:
		$other_tooltip.show()
		$AnimationPlayer.play("absolutely fucking insane fucking animation holy shit and fuck")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_key_pressed(KEY_X):
		get_tree().change_scene_to_file("res://vis_novel.tscn")
	$"player score".text = str(Global.score)
