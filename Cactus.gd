extends Sprite

var speed

var randomNumberGenerator = RandomNumberGenerator.new()

func _ready():
	randomNumberGenerator.randomize()
	
	set_frame(randomNumberGenerator.randi_range(0, 5))

func _process(delta):
	global_position.x -= floor(speed * delta)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
func set_speed(distance):
	speed = distance
