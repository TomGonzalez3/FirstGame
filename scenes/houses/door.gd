extends StaticBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var interactable_component: InteractableComponent = $InteractableComponent

func _ready() -> void:
	interactable_component.interactableON.connect(interactable_activated)
	interactable_component.interactableOFF.connect(interactable_deactivated)
	
func interactable_activated() -> void:
	animated_sprite_2d.play("open_door")
	collision_layer = 2
	
func interactable_deactivated() -> void:
	animated_sprite_2d.play("close_door")
	collision_layer = 1
