extends Control

@onready var game_scene = preload("res://scenes/game/game.tscn")
@onready var main_menu_scene = preload("res://scenes/title_screen/title_screen.tscn")

@onready var button_mainmenu: Button = $VBoxContainer/button_mainmenu
@onready var button_retry: Button = $VBoxContainer/button_retry
@onready var sfx_button: AudioStreamPlayer2D = $sfx_button
@onready var sprite_gameover: AnimatedSprite2D = $sprite_gameover

@export var tween_intensity: float
@export var tween_duration: float

func _ready() -> void:
	GameManager.score = 0
	GameManager.health = 3

func _process(_delta: float) -> void:
	btn_hovered(button_mainmenu)
	btn_hovered(button_retry)

func start_tween(object: Object, property: String, final_val: Variant, duration: float):
	var tween = create_tween()
	tween.tween_property(object, property, final_val, duration)

func btn_hovered(button: Button):
	button.pivot_offset = button.size/2
	if button.is_hovered():
		start_tween(button, "scale", Vector2.ONE*tween_intensity, tween_duration)
	else:
		start_tween(button, "scale", Vector2.ONE, tween_duration)


func _on_button_retry_pressed() -> void:
	sfx_button.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_packed(game_scene)


func _on_button_mainmenu_pressed() -> void:
	sfx_button.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_packed(main_menu_scene)
