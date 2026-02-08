extends Control

@export var mask_needed_node : TextureRect

func _get_paint_node() -> Node:
	return get_node("../Client/Mask/PaintArea")

func _on_blue_pressed() -> void:
	_get_paint_node().change_mask_color(MaskColorAssets.blue)

func _on_green_pressed() -> void:
	_get_paint_node().change_mask_color(MaskColorAssets.green)

func _on_yellow_pressed() -> void:
	_get_paint_node().change_mask_color(MaskColorAssets.yellow)

func _on_red_pressed() -> void:
	_get_paint_node().change_mask_color(MaskColorAssets.red)

func _on_violet_pressed() -> void:
	_get_paint_node().change_mask_color(MaskColorAssets.violet)

func _on_pink_pressed() -> void:
	_get_paint_node().change_mask_color(MaskColorAssets.pink)

func reset_buttons() -> void:
	
	pass

func set_mask_needed(color: MaskColorAssets.mask_color) -> void:
	mask_needed_node.texture = MaskColorAssets.get_mask_texture(color)
	get_node("../Client/Mask/PaintArea").set_mask_needed(MaskColorAssets.get_mask_color(color))
