extends Node2D

const SPEED = 60
var direction = -1
@onready var ray_castleft: RayCast2D = $RayCastleft
@onready var ray_castright: RayCast2D = $RayCastright
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ray_castup: RayCast2D = $RayCastup
var is_alive = true

func _on_ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	if is_alive:
		if ray_castleft.is_colliding():
			direction = 1
			animated_sprite.flip_h = true
		if ray_castright.is_colliding():
			direction = -1
			animated_sprite.flip_h = false
		
		position.x += SPEED * delta * direction
		$AnimatedSprite2D.play("run")
	
	
		is_alive = false
		$AnimatedSprite2D.play("hit")
		

func _on_timer_timeout() -> void:
	queue_free()# Replace with function body.
