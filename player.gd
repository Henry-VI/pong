extends Area2D


var speed := 400
@onready var bullet := preload("res://bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.current_feature == Global.features.WAVEY_PADDLE:
		$AnimationPlayer.play("wave")

func _physics_process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_key_pressed(KEY_Q):
		get_tree().change_scene_to_file("res://l.tscn")
	if Input.is_action_pressed("right") && Global.current_feature == Global.features.FREEDOM_OF_MOVEMENT:
		if position.x < get_viewport_rect().size.x/2:
			velocity.x += 2
	if Input.is_action_pressed("left") && Global.current_feature == Global.features.FREEDOM_OF_MOVEMENT:
		if position.x > 50:
			velocity.x -= 2
	if Input.is_action_pressed("up"):
		if position.y > 100:
			velocity.y -= 2
	elif Input.is_action_pressed("down"):
		if position.y < get_viewport_rect().size.y-$ColorRect.size.y-100:
			velocity.y += 2
	
	velocity = velocity.normalized()*speed*delta
	position += velocity
	
	
	if Input.is_action_just_pressed("ui_accept"):
		if Global.current_feature == Global.features.FIRE_SCORE && Global.score > 0:
			var inst := bullet.instantiate()
			inst.rotation_degrees = 90
			inst.position = position
			inst.position.x += 20
			get_tree().current_scene.add_child(inst)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		if !body.doomed:
			body.direction.x = 1
			Global.score += 1
			if Global.current_feature == Global.features.INFINITE_VELOCITY:
				body.speed *= randf_range(1,2)
			else:
				body.speed = 200 * randf_range(0.5,2)
