extends Resource
class_name Deck

var cards: Array[Card] = []

func add_card(card: Card) -> void:
	cards.append(card)
	
func shuffle() -> void:
	cards.shuffle()
	
func draw() -> Card:
	if cards.is_empty():
		return null
	return cards.pop_back()

func get_count() -> int:
	return cards.size()
