extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -500.0
const DOUBLE_JUMP_VELOCITY = -300
const MAX_JUMPS = 2
var floor = true
var jump = 0


func _ready() -> void:
	$AnimatedSprite2D.play("idle")
	
	
func _physics_process(delta: float) -> void:
	
	if is_on_floor():
		floor = false
		jump = 0
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("ui_right"):
		velocity.x =  SPEED
		$AnimatedSprite2D.play("run")
		$AnimatedSprite2D.flip_h = false
		
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -SPEED
		$AnimatedSprite2D.play("run")
		$AnimatedSprite2D.flip_h = true
		
	else:
		velocity.x = 0
		$AnimatedSprite2D.play("idle")
	
	if Input.is_action_pressed("ui_up"):
		floor = false
		if jump == 0:
			$AnimatedSprite2D.play("jump")
			velocity.y += JUMP_VELOCITY
			jump += 1
		elif jump == 1:
			$AnimatedSprite2D.play("double_jump")
			velocity.y += DOUBLE_JUMP_VELOCITY
			jump += 1
		
	if velocity.y < 0 && not is_on_floor():
		$AnimatedSprite2D.play("jump")
		
	if velocity.y > 0 && not is_on_floor():
		$AnimatedSprite2D.play("fall")
	
	move_and_slide()
