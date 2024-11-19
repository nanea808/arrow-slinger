extends Node2D

# Create signal to have parent spawn arrow
signal arrow_loosed(bow_rotation: float, bow_position: Vector2)

# Debug
func _ready() -> void:
	print(rotation)

# On key press "Enter" emit signal with parameters passed.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_accept"):
		arrow_loosed.emit(global_position)
