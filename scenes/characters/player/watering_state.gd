extends NodeState

@export var player : Player
@export var animated_2d_sprite : AnimatedSprite2D

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	if !animated_2d_sprite.is_playing():
		transition.emit("Idle")


func _on_enter() -> void:
	if player.playerDirection == Vector2.UP:
		animated_2d_sprite.play("water_back")
	elif player.playerDirection == Vector2.DOWN:
		animated_2d_sprite.play("water_front")
	elif player.playerDirection == Vector2.LEFT:
		animated_2d_sprite.play("water_left")
	elif player.playerDirection == Vector2.RIGHT:
		animated_2d_sprite.play("water_right")
	else:
		animated_2d_sprite.play("water_front")


func _on_exit() -> void:
	animated_2d_sprite.stop()
