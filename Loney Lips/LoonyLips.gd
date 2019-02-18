extends Node2D

func _on_TextureButton_pressed():
	var new_text = $Blackboard/LineEdit.get_text ()
	_on_LineEdit_text_entered(new_text)

	
func _on_LineEdit_text_entered(new_text):
	$Blackboard/StoryText.text = new_text
	$Blackboard/LineEdit.text = ""
	
	
	
