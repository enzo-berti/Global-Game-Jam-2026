extends Node2D

#Exported nodes
@export var path_follow : PathFollow2D
@export var sprite : Sprite2D

@export var debug_score_distance_limit : CollisionShape2D
@export var debug_score_distance_deadzone : CollisionShape2D

#Cucumber movement
var x : float = 0
var direction_reversed : bool = false
var is_stopped : bool = false

#Score variables
@onready var parent_eye : Node2D = get_parent()
@onready var score_distance_limit : float = debug_score_distance_limit.shape.radius
@onready var score_distance_dead_zone : float = debug_score_distance_deadzone.shape.radius
@export var score_max : int = 25
var score : int


###### BUILT-IN FUNCTIONS ######


func _process(delta: float) -> void:
	
	#Cucumber movement
	match is_stopped:
		false:
			_slide(delta)
		true:
			score = int(score_max * (1 - clamp(sprite.global_position.distance_to(parent_eye.global_position) - score_distance_dead_zone, 0.0, score_distance_limit) / score_distance_limit))
			print(score)
			pass

	#Stop
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) && not is_stopped:
		is_stopped = true


###### CUSTOM FUNCTIONS ######

func _slide(delta: float) -> void:
	if not direction_reversed:
		x += delta
	elif direction_reversed:
		x -= delta
	
	if x > 1:
		x = 1
		direction_reversed = true
	if x < 0:
		x = 0
		direction_reversed = false
	
	path_follow.progress_ratio = ease.InOutSine(x)
