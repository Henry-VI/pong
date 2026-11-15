extends StaticBody2D

@export var direction = Vector2(-1,1)
var speed = 200
var doomed = false

func _ready() -> void:
	if Global.current_feature == Global.features.BALL_CAM:
		$Camera2D.enabled = true
		$Camera2D.zoom = Vector2(1.5, 1.5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	rotation_degrees += direction.x
	position.x += speed*direction.x*delta
	position.y += speed*direction.y*delta
	if position.y > get_viewport_rect().size.y-$ColorRect.size.y/2-100:
		direction.y = -1
		$AudioStreamPlayer.play()
	if position.x > get_viewport_rect().size.x-$ColorRect.size.x/2:
		direction.x = -1
		$AudioStreamPlayer.play()
	if position.x < 0: # death
		get_tree().change_scene_to_file("res://l.tscn")
	if position.x < 50:
		$Camera2D.enabled = true
		speed = 20
		if !doomed:
			$AnimationPlayer.play("zoom")
		doomed = true
	if position.y < 100:
		$AudioStreamPlayer.play()
		direction.y = 1
