extends Control


func _on_StartButton_pressed():
	get_tree().change_scene("res://scenes/game_window.tscn")


func _on_OptionsButton_pressed():
	get_tree().change_scene("res://scenes/options.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_CreditsButton_pressed():
	get_tree().change_scene("res://scenes/credits.tscn")
