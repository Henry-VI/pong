extends Node


var ball_position: Vector2 = Vector2.ZERO
var score: int = 0
enum features {TWO_BALLS, WAVEY_PADDLE, INFINITE_VELOCITY, FREEDOM_OF_MOVEMENT, FIRE_SCORE, BALL_CAM, SLOP, ELYSIUM}
var current_feature: int = -1
