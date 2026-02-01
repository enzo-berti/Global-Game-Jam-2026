extends Node2D

enum states { START, MASK, CUCUMBER, FINISH }
var state_machine : states

var clients_resources : Array[Resource]

var is_there_client : bool = false
@onready var spawn_pos : Vector2 = $SpawnPoint.position
var rng = RandomNumberGenerator.new()

###### BUILT-IN FUNCTIONS ######

func _ready() -> void:
	clients_resources = [preload("res://characters/cupcake/cupcake_client.tscn"), 
preload("res://characters/duck/duck_client.tscn"), preload("res://characters/flower/flower_client.tscn"), 
preload("res://characters/troll/troll_client.tscn"), preload("res://characters/wrestler/wrestler_client.tscn")]
	
	
	spawn_client()
	
	state_machine = states.START
	pass

func _process(delta: float) -> void:
	if !is_there_client:
		spawn_client()
	pass


###### CUSTOM FUNCTIONS ######

#Spawn new client
func spawn_client() -> void:
	var client = clients_resources[rng.randi_range(0, clients_resources.size() - 1)]
	var instance = client.instantiate()
	add_child(instance)
	instance.position = spawn_pos
	is_there_client = true
	
	instance.start_mask()
	pass
