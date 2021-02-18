extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()
var nextLevel = false
var death = false
var timer = 0

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
	if !nextLevel && !death:
		get_input()
		velocity = move_and_slide(velocity)
		for i in get_slide_count():
			var collision = get_slide_collision(i)
			if collision.collider.name == "Coin":
				get_node("Player").visible = false
				get_node("PlayerWin").visible = true
				# Remove Coin sprite
				get_node("AudioStreamPlayer2D").playing = true
				nextLevel = true
			elif collision.collider.name == "Among" || collision.collider.name == "Conill" || collision.collider.name == "Paret":
				get_node("Player").visible = false
				get_node("PlayerDeath").visible = true
				# Sound death here
				death = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if nextLevel && (timer == 60): 
		var name = get_tree().get_current_scene().get_name()
		name = name.right(5)
		name = String(int(name) + 1)
		if name == "6": name = "1"
		name = "res://levels/level" + name + ".tscn"
		get_tree().change_scene(name) == OK
	elif death && (timer == 60): get_tree().change_scene("res://levels/level1.tscn") == OK
	if nextLevel || death:
		timer = timer + 1
