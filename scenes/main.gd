extends Node2D

# Load arrow node
@onready var arrow = preload("res://scenes/weapon/arrow.tscn")

# Debug to get the rotation properties type
func _ready() -> void:
	print(type_string(typeof(rotation)))

# On signal from child node Bow,
# spawn arrow using passed parameters.
func _on_bow_arrow_loosed(bow_position: Vector2) -> void:
	var instance = arrow.instantiate()
	instance.spawnPos = bow_position
	add_child(instance)
	
	var mouse_position = get_viewport().get_mouse_position()
	instance.launch(mouse_position)
