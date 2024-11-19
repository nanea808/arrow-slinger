extends Node
class_name PhysicsHelper

static func calculate_arc_velocity(point_a, point_b, arc_height, \
		up_gravity = Global.gravity, down_gravity = null):
	
	# Variable up vs down gravity
	if down_gravity == null:
		down_gravity = up_gravity
	
	# Store the result for velocity
	var velocity = Vector2()
	
	# Displacement
	var displacement = point_b - point_a
	
	
	if displacement.y > arc_height:
		# Time up and down (gaze into the depths of time)
		var time_up = sqrt(-2 * arc_height * up_gravity)
		var time_down = sqrt(2 * (displacement.y - arc_height) / float(down_gravity))
		
		# Verticle and horizontal velocity
		velocity.y = -sqrt(-2 * up_gravity * arc_height)
		velocity.x = displacement.x / float(time_up + time_down)
	
	return velocity
