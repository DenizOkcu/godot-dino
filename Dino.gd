extends Area2D

var startingY
var isJumping = false

var dinoGravity = 35
var dinoAcceleration = 700

var jumpSpeed = 0

func _ready():
	startingY = global_position.y

func _process(delta):
	if isJumping == false:
		if Input.is_action_just_pressed("ui_accept"):
			isJumping = true
			jumpSpeed = dinoAcceleration * delta
	else:
		jumpSpeed -= dinoGravity * delta
		
	if global_position.y > startingY:
		global_position.y = startingY
		jumpSpeed = 0
		isJumping = false
	
	global_position.y -= jumpSpeed

