extends Node2D


var PE_attraction=100

# Carica la scena
var ProtoneScene = preload("res://particles/proton.tscn")
var ElettroneScene = preload("res://particles/electron.tscn")
var NeutroneScene = preload("res://particles/neutron.tscn")
# Istanzia l'oggetto
var particles=0

func _init() -> void:
	for i in range(particles):
		var nuovo_protone = ProtoneScene.instantiate()
		
		# Aggiungilo alla scena
		add_child(nuovo_protone)

		# (Opzionale) Posizionalo dove vuoi
		nuovo_protone.position = Vector2(randi_range(0,1000), randi_range(0,600))
	for i in range(particles):
		var nuovo_protone = ElettroneScene.instantiate()
		
		# Aggiungilo alla scena
		add_child(nuovo_protone)

		# (Opzionale) Posizionalo dove vuoi
		nuovo_protone.position = Vector2(randi_range(0,1000), randi_range(0,600))
	for i in range(particles):
		var nuovo_protone = NeutroneScene.instantiate()
		
		# Aggiungilo alla scena
		add_child(nuovo_protone)

		# (Opzionale) Posizionalo dove vuoi
		nuovo_protone.position = Vector2(randi_range(0,1000), randi_range(0,600))
