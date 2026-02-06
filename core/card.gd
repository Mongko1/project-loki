extends Resource
class_name Card

enum RANK {
	ACE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN, JACK, QUEEN, KING
}

enum SUIT {
	SPADE, HEART, DIAMOND, CLUB
}

@export var rank: RANK
@export var suit: SUIT

var base_score: int:
	get:
		return _calculate_base_damage()
		
func _calculate_base_damage() -> int:
	match rank:
		RANK.ACE:
			return 11
		RANK.JACK, RANK.QUEEN, RANK.KING:
			return 10
		_:
			return int(rank) + 2
