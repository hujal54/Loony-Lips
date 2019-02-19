extends Node2D

var player_words = []
var prompt =["a name", "a thing", "a feeling", "another feeling","some things"]
var story ="once upon a time a %s ate a %s and felt very %s. It was a %s day for all good %s."


func _ready():
	$Blackboard/TextBox.text = ""
	_welcome()
	
	
func _welcome():
	$Blackboard/StoryText.text =("Hi Player. Welcome to Loony Lips. \n Today we're gonna tell a story. \n Press Ok to continue")
	
	
func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		var new_text = $Blackboard/TextBox.get_text ()
		_on_TextBox_text_entered(new_text)

	
func _on_TextBox_text_entered(new_text):
	player_words.append(new_text)
	$Blackboard/TextBox.text = ""
	check_player_word_length()
	
func is_story_done():
	return player_words.size() == prompt.size()
	
func prompt_player():
	$Blackboard/StoryText.text = ("Can I have " + prompt[player_words.size()] + ", please ?")
	
func check_player_word_length():
	if is_story_done():
		tell_story()
	else:
		prompt_player()
		
func tell_story ():
	$Blackboard/StoryText.text = story % player_words
	end_game()

func end_game():
	$Blackboard/TextBox.queue_free()
	$Blackboard/TextureButton/RichTextLabel.text= "Again!"
