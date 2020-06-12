extends Node

var speed = 0
var maxSpeed = 1200
var speedMultiplicator = 1.1

export(bool) var gameStarted = false

func _ready():
	reset_game()
	start_game()

func start_game():
	gameStarted = true
	speed = 200
	
	$Dino.get_node("AnimationPlayer").play("Run")
	$SpeedTimer.start()
	
func reset_game():
	gameStarted = false
	speed = 0
	
	$Floor1.global_position.x = 0
	$Floor2.global_position.x = $Floor1.texture.get_size().x
	
	$Dino.get_node("AnimationPlayer").play("Idle")
	$SpeedTimer.stop()

func _process(delta):
	if gameStarted:
		$Floor1.move_horizontally(speed * delta)
		$Floor2.move_horizontally(speed * delta)

func _on_Speed_Timer_timeout():
	speed = min(maxSpeed, speed * speedMultiplicator)