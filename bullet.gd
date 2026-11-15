extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.text = str(Global.score)
	Global.score -= 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += 600*delta
	
	if position.x > get_viewport_rect().size.x:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("ball"):
		body.doomed = true
		body.direction.x = 1
		body.direction.y = body.direction.y * -1
