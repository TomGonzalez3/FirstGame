class_name InteractableComponent
extends Area2D

signal interactableON
signal interactableOFF

func _on_body_entered(body: Node2D) -> void:
	interactableON.emit()


func _on_body_exited(body: Node2D) -> void:
	interactableOFF.emit()
