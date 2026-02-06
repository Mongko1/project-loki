extends Resource
class_name Hand

var cards: Array[Card] = []
var max_size = 5 # Change it later

func add_card(card: Card) -> bool:
	if is_full():
		return false
	cards.append(card)
	return true

func remove_card(card: Card) -> void:
	cards.erase(card)

func is_full() -> bool:
	if cards.size() >= max_size:
		return true
	return false
