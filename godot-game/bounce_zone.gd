extends Area2D

const BOUNCE = -100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity += get_gravity() * delta


func _on_body_entered(body: Node2D) -> void:
	
	body.velocity.y += BOUNCE # Replace with function body.
