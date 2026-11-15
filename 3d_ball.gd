extends Area3D

@export var direction = Vector3(0,1,1)
var speed = 10
var doomed = false

func _ready() -> void:
	if Global.current_feature == Global.features.BALL_CAM:
		$Camera2D.enabled = true
		$Camera2D.zoom = Vector2(1.5, 1.5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.z += speed*direction.z*delta
	position.y += speed*direction.y*delta
	if position.y > 7.5:
		direction.y = -1
		$AudioStreamPlayer.play()
	if position.z < -24:
		direction.z = 1
		$AudioStreamPlayer.play()
	if position.z > 0: # death
		get_tree().change_scene_to_file("res://l.tscn")
	if position.y < -7.5:
		$AudioStreamPlayer.play()
		direction.y = 1
