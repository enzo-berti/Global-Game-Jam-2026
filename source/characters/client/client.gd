extends CharacterBody2D

@onready var first_pos : Vector2 = get_node("../FirstPos").position
@onready var leaving_pos : Vector2 = get_node("../LeavingPos").position
var destination : Vector2

@export var speed : float = 10


###### BUILT-IN FUNCTIONS ######

func _ready() -> void:
	destination = first_pos

func _physics_process(delta: float) -> void:
	#_slide(destination, delta)
	#print(destination)
	pass


###### CUSTOM FUNCTIONS ######

func _slide(pos: Vector2, delta: float) -> void:
	#position += position.direction_to(pos) * speed * delta
	pass
