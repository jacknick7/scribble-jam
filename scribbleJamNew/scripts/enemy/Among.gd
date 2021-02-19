extends KinematicBody2D

export (int) var speed = 250

var velocity = Vector2()
var level = 0
var dir = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var name = get_tree().get_current_scene().get_name()
	name = name.right(5)
	level = int(name)


func get_movement():
	velocity = Vector2()
	if (level == 4) || (level == 8) || (level == 6):
		if dir: velocity.y += 1
		else: velocity.y -= 1
	elif (level == 5):
		if dir: velocity.x += 1
		else: velocity.x -= 1
	velocity = velocity.normalized() * speed


func _physics_process(_delta):
	get_movement()
	velocity = move_and_slide(velocity)
	if get_slide_count() > 0: dir = !dir
