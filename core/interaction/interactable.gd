class_name Interactable extends Node2D

signal on_interact(interactable: Interactable)

func interact():
	print( "interacting with %s" % name)
