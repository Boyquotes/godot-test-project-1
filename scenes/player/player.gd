extends CharacterBody2D

const MAX_SPEED = 10000

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = get_vector_movement() * MAX_SPEED * delta
	move_and_slide()


func get_vector_movement():
	var movement_vector = Vector2.ZERO
	
	var delta_x = Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var delta_y = Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	movement_vector = Vector2(delta_x, delta_y).normalized()
	
	return movement_vector
