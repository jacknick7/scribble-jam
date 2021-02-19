extends KinematicBody2D

export (int) var speed = 200

var velocity = Vector2()
var nextLevel = false
var death = false
var timer = 0
var level = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	var name = get_tree().get_current_scene().get_name()
	name = name.right(5)
	level = int(name)
	#if level == 2: get_node("Sprite").visible = true


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
			if collision.collider.name == "Coin": handle_coin_collision()
			elif collision.collider.name == "Paret": handle_paret_collision()
			elif collision.collider.name == "Conill": handle_conill_collision()
			elif collision.collider.name == "Among": handle_among_collision()
			elif collision.collider.name == "Huma": handle_huma_collision()


func handle_coin_collision():
	if (level == 1) || (level == 2) || (level == 4): win()
	elif (level == 3) || (level == 5): lose()


func handle_paret_collision():
	if (level == 3) || (level == 5): win()
	elif (level == 2) || (level == 4): lose()


func handle_conill_collision():
	lose()

func handle_among_collision():
	lose()


func handle_huma_collision():
	lose()


func win():
	get_node("Player").visible = false
	get_node("PlayerWin").visible = true
	# Remove Coin sprite
	get_node("AudioStreamPlayer2D1").playing = true
	nextLevel = true


func lose():
	get_node("Player").visible = false
	get_node("PlayerDeath").visible = true
	# Remove enemy sprite?
	get_node("AudioStreamPlayer2D2").playing = true
	death = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if nextLevel && (timer == 60): 
		var name = String(int(level) + 1)
		if name == "6": name = "1"
		name = "res://levels/level" + name + ".tscn"
		get_tree().change_scene(name) == OK
	elif death && (timer == 60): get_tree().change_scene("res://levels/level1.tscn") == OK
	if nextLevel || death:
		timer = timer + 1
