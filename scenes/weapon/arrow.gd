extends CharacterBody2D

@export var SPEED = 150

# Declare variables for manipulating arrow direction
var spawnPos : Vector2

const THROW_VELOCITY = Vector2(800, -400)

# Sets arrow rotation and position on spawn
func _ready() -> void:
	global_position = spawnPos

# Launch function that uses a calulate_arc_velocity funtion
# from PhysicsHelper to set the velocity.
func launch(target_position) -> void:
	# Ensure the projectile is always above point_b
	var arc_height = target_position.y - global_position.y - 32
	# Ensure the pojectile is always above ponit_a
	arc_height = min(arc_height, -32)
	# Calculate the velocity
	velocity = PhysicsHelper.calculate_arc_velocity(global_position, target_position, arc_height)
	# Limit the projectiles distance2
	# velocity = velocity.limit_length(5000)
	
# Current function moves arrow in a set direction
func _physics_process(delta: float) -> void:
	# velocity = Vector2(0,-SPEED).rotated(dir)
	velocity.y += Global.gravity * delta
	var collision = move_and_collide(velocity * delta)
