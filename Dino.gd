extends Area2D

signal death

var startingY
var isJumping = false
var isDead = false

var dinoGravity = 30
var dinoAcceleration = 700

var jumpSpeed = 0

func _ready():
	startingY = global_position.y

func _process(delta):
	if isJumping == false:
		if Input.is_action_just_pressed("ui_accept") && isDead == false:
			isJumping = true
			jumpSpeed = dinoAcceleration
	else:
		jumpSpeed -= dinoGravity
		
	if isJumping == true:
		if jumpSpeed > 0:
			$AnimationPlayer.play("JumpingUp")
		else:
			$AnimationPlayer.play("JumpingDown")
		
	if global_position.y > startingY:
		global_position.y = startingY
		jumpSpeed = 0
		isJumping = false
		if isDead == false:
			$AnimationPlayer.play("Run")
		else:
			$AnimationPlayer.play("Dead")
	
	global_position.y -= jumpSpeed * delta

func reset():
	isDead = false

func _on_Dino_area_entered(_area):
	isDead = true
	emit_signal("death")
