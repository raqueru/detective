extends Node2D
@export var initial_dialogue: DialogueData
@onready var dialogue_box = $DialogueBox
@onready var mayor = $Mayor
@onready var detective = $Detective
@onready var bubble = $DialogueBubble

@onready var chars = {
"Mayor": $Mayor,
"Detective": $Detective,
"Test": $Test
}
# Called when the node enters the scene tree for the first time.
func _ready():
	bubble.data = initial_dialogue
	dialogue_box.data=initial_dialogue
	dialogue_box.start() 
	bubble.start()
	bubble.hide()
	 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
 

func _on_dialogue_bubble_dialogue_processed(speaker, dialogue, options):
	if (speaker is String) or (speaker is Character):
			bubble.follow_node = chars[speaker]
 

func showBubble():
	bubble.show()
	dialogue_box.hide()
 
	
func showBox():
	bubble.hide()
	dialogue_box.show()
 
	 
 

func _on_dialogue_box_dialogue_signal(value):
	match(value):
		'Dialogue': showBubble()
		'Monologue':showBox()
	 


func _on_dialogue_bubble_dialogue_signal(value):
	match(value):
		'Dialogue': showBubble()
		'Monologue':showBox()
