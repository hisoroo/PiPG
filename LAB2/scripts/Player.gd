extends KinematicBody

var velocity = Vector3(0,0,0)
const SPEED = 6
const ROTSPEED = 6


func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_pressed("ui_right") and Input.is_action_pressed("ui_left"):
		velocity.x = 0
	elif Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
		$MeshInstance.rotate_z(deg2rad(-ROTSPEED))
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$MeshInstance.rotate_z(deg2rad(ROTSPEED))
	else:
		velocity.x = lerp(velocity.x,0,0.1)
		$MeshInstance.rotate_z(deg2rad(lerp(-velocity.x,0,0.001)))
		
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_down"):
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		velocity.z = -SPEED
		$MeshInstance.rotate_x(deg2rad(-ROTSPEED))
	elif Input.is_action_pressed("ui_down"):
		velocity.z = SPEED
		$MeshInstance.rotate_x(deg2rad(ROTSPEED))
	else:
		velocity.z = lerp(velocity.z,0,0.1)
		$MeshInstance.rotate_x(deg2rad(lerp(velocity.z,0,0.001)))
	
	move_and_slide(velocity)


func _on_enemy_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://GameOver.tscn")


func _on_Timer_timeout():
	pass # Replace with function body.
