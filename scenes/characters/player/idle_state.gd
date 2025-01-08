extends NodeState

@export var player : Player
@export var animated_2d_sprite : AnimatedSprite2D

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
			
	if player.playerDirection == Vector2.UP:
		animated_2d_sprite.play("idle_back")
	elif player.playerDirection == Vector2.DOWN:
		animated_2d_sprite.play("idle_front")
	elif player.playerDirection == Vector2.LEFT:
		animated_2d_sprite.play("idle_left")
	elif player.playerDirection == Vector2.RIGHT:
		animated_2d_sprite.play("idle_right")
	else:
		animated_2d_sprite.play("idle_front")


func _on_next_transitions() -> void:
	GameInputEvents.movement_input()
	
	if GameInputEvents.is_movement_input():
		transition.emit("Walk")
		
	if player.current_tool == DataTypes.Tools.Axe && GameInputEvents.use_tool():
		transition.emit("Chopping")
		
	if player.current_tool == DataTypes.Tools.TillGround && GameInputEvents.use_tool():
		transition.emit("Tilling")
		
	if player.current_tool == DataTypes.Tools.WaterCrops && GameInputEvents.use_tool():
		transition.emit("Watering")


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_2d_sprite.stop()
