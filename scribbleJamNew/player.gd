extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('right'):
		velocity.x += 1
	elif Input.is_action_pressed('left'):
		velocity.x -= 1
	elif Input.is_action_pressed('down'):
		velocity.y += 1
	elif Input.is_action_pressed('up'):
		velocity.y -= 1
	if Input.is_action_pressed('right') && Input.is_action_pressed('left'):
		velocity.x = 0
	if Input.is_action_pressed('down') && Input.is_action_pressed('up'):
		velocity.y = 0
	velocity = velocity.normalized() * speed

func _physics_process(_delta):
	get_input()
	velocity = move_and_slide(velocity)
	for i in get_slide_count():
		var collision = get_slide_collision(i)
		if collision.collider.name == "Star":
			get_tree().change_scene("res://nivellTuto2.tscn")
		elif collision.collider.name == "Among" || collision.collider.name == "Conill":
			get_tree().change_scene("res://nivellTuto5.tscn")
