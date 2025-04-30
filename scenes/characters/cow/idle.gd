extends NodeState

@export var character : CharacterBody2D
@export var animated_2d_sprite : AnimatedSprite2D
@export var time_idle : float = 5.0

@onready var timer_idle : Timer = Timer.new()

var idle_status_timeout : bool = false

func _ready() -> void:
	timer_idle.wait_time = time_idle
	timer_idle.timeout.connect(on_idle_timeout)
	add_child(timer_idle)

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	if idle_status_timeout:
		transition.emit("Walk")


func _on_enter() -> void:
	animated_2d_sprite.play("Idle")
	
	idle_status_timeout = false
	timer_idle.start()
	
func _on_exit() -> void:
	animated_2d_sprite.stop()
	timer_idle.stop()

func on_idle_timeout() -> void:
	idle_status_timeout = true
