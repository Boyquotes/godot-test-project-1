extends Camera2D


var target_position = Vector2.ZERO
var min_dist = 4
var smooth_speed = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	make_current()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	_acquire_target()
	# Actualizo si la distancia es mayor a min_dist
	if (global_position - target_position).length() >= min_dist:
		global_position = global_position.lerp(target_position, 1 - exp(-delta * smooth_speed))


func _acquire_target():
	var nodes = get_tree().get_nodes_in_group("player")
	if nodes.size() > 0:
		var player = nodes[0] as Node2D
		target_position = player.global_position
	
