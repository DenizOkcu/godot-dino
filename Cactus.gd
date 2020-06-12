extends Area2D

var speed

var randomNumberGenerator = RandomNumberGenerator.new()

func _init():
	add_to_group("Cacti")

func _ready():
	randomNumberGenerator.randomize()
	
	$Sprite.set_frame(randomNumberGenerator.randi_range(0, 5))

func _process(delta):
	global_position.x -= floor(speed * delta)
	
func set_speed(distance):
	speed = distance
