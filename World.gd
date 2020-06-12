extends Node

var speed = 0
var maxSpeed = 1200
var speedMultiplicator = 1.2

var gameStarted = false

var randomNumberGenerator = RandomNumberGenerator.new()

onready var Cactus = preload("res://Cactus.tscn")

func _ready():
	randomNumberGenerator.randomize()
	reset_game()
	start_game()

func start_game():
	gameStarted = true
	speed = 260
	
	$Dino.get_node("AnimationPlayer").play("Run")
	
	$CactusTimer.set_wait_time(1)
	$CactusTimer.start()
	
	$SpeedTimer.start()
	
func reset_game():
	gameStarted = false
	speed = 0
	
	$Floor1.global_position.x = 0
	$Floor2.global_position.x = $Floor1.texture.get_size().x
	
	var cacti = get_tree().get_nodes_in_group("Cacti")
	
	for cactus in cacti:
		cactus.set_speed(0)
	
	$Dino.get_node("AnimationPlayer").play("Idle")
	$SpeedTimer.stop()
	$CactusTimer.stop()

func _process(delta):
	if gameStarted:
		$Floor1.move_horizontally(speed * delta)
		$Floor2.move_horizontally(speed * delta)
		
func _on_Speed_Timer_timeout():
	speed = min(maxSpeed, speed * speedMultiplicator)


func _on_CactusTimer_timeout():
	var cactus = Cactus.instance()
	cactus.set_speed(speed)
	cactus.global_position = Vector2(700, (210 + randomNumberGenerator.randi_range(-5, 30)))
	add_child(cactus)
	$CactusTimer.set_wait_time(randomNumberGenerator.randi_range(1, 4))


func _on_Dino_death():
	reset_game()
