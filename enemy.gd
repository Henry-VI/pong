extends Area2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if position.y <= get_viewport_rect().size.y-$ColorRect.size.y && position.y > 100:
		position.y = Global.ball_position.y-$ColorRect.size.y/2
	else:
		position.y = get_viewport_rect().size.y-$ColorRect.size.y

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		body.direction.x = -1
		body.speed = 200 * randf_range(0.5,2)
