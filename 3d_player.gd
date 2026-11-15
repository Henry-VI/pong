extends Area3D


var speed := 40
@onready var bullet := preload("res://bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.current_feature == Global.features.WAVEY_PADDLE:
		$AnimationPlayer.play("wave")

func _physics_process(delta: float) -> void:
	var velocity = Vector3.ZERO
	if Input.is_key_pressed(KEY_K):
		get_tree().change_scene_to_file("res://l.tscn")
	if Input.is_action_pressed("ui_right") && Global.current_feature == Global.features.FREEDOM_OF_MOVEMENT:
		if position.x < get_viewport().size.x/2:
			velocity.x += 2
	if Input.is_action_pressed("ui_left") && Global.current_feature == Global.features.FREEDOM_OF_MOVEMENT:
		if position.x > 50:
			velocity.x -= 2
	if Input.is_action_pressed("up"):
		if position.y < 5:
			velocity.y += 2
	elif Input.is_action_pressed("down"):
		if position.y > -5:
			velocity.y -= 2
	
	velocity = velocity.normalized()*speed*delta
	position += velocity
	
	
	if Input.is_action_just_pressed("ui_accept"):
		if Global.current_feature == Global.features.FIRE_SCORE && Global.score > 0:
			var inst := bullet.instantiate()
			inst.rotation_degrees = 90
			inst.position = position
			inst.position.x += 20
			get_tree().current_scene.add_child(inst)


func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("ball"):
		area.direction.z = -1
		Global.score += 1
