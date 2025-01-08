extends NodeState

@export var player : Player
@export var animated_2d_sprite : AnimatedSprite2D
@export var hit_component_collision_shape : CollisionShape2D

func _ready() -> void:
	hit_component_collision_shape.disabled = true
	hit_component_collision_shape.position = Vector2(0, 0)
	

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	if !animated_2d_sprite.is_playing():
		transition.emit("Idle")


func _on_enter() -> void:
	if player.playerDirection == Vector2.UP:
		animated_2d_sprite.play("chop_back")
		hit_component_collision_shape.position = Vector2(3, -11)
	elif player.playerDirection == Vector2.DOWN:
		animated_2d_sprite.play("chop_front")
		hit_component_collision_shape.position = Vector2(-3, 11)
	elif player.playerDirection == Vector2.LEFT:
		animated_2d_sprite.play("chop_left")
		hit_component_collision_shape.position = Vector2(-9, 7)
	elif player.playerDirection == Vector2.RIGHT:
		animated_2d_sprite.play("chop_right")
		hit_component_collision_shape.position = Vector2(9, 7)
	else:
		animated_2d_sprite.play("chop_front")
		
	hit_component_collision_shape.disabled = false
	


func _on_exit() -> void:
	animated_2d_sprite.stop()
	hit_component_collision_shape.disabled = true
