extends Node

func _ready():
	# ============================
	# CARD, DEAK and HAND Testing
	# ============================

	#var ace_spade = Card.new()
	#ace_spade.rank = Card.RANK.ACE
	#ace_spade.suit = Card.SUIT.SPADE
	#
	#var ace_heart = Card.new()
	#ace_heart.rank = Card.RANK.ACE
	#ace_heart.suit = Card.SUIT.HEART
	#
	#var ace_diamond = Card.new()
	#ace_diamond.rank = Card.RANK.ACE
	#ace_diamond.suit = Card.SUIT.DIAMOND
	#
	#var ace_club = Card.new()
	#ace_club.rank = Card.RANK.ACE
	#ace_club.suit = Card.SUIT.CLUB
	#
	#var deck = Deck.new()
	#deck.add_card(ace_spade)
	#deck.add_card(ace_heart)
	#deck.add_card(ace_diamond)
	#deck.add_card(ace_club)
	#
	#deck.shuffle()
	#
	#var hand = Hand.new()
	#for i in range(6):
		#if hand.is_full():
			#hand.add_card(deck.draw())

	# ============================
	# Phase Controller Testing
	# ============================
	
	var phase_controller = PhaseController.new()
	phase_controller.start_game()
	print(phase_controller.get_current_phase())
	phase_controller.next_phase()
	print(phase_controller.get_current_phase())
	phase_controller.next_phase()
	print(phase_controller.get_current_phase())
	phase_controller.next_phase()
	print(phase_controller.get_current_phase())
	phase_controller.next_phase()
	print(phase_controller.get_current_phase())
	phase_controller.next_phase()
	print(phase_controller.get_current_phase())
	phase_controller.resolve_showdown(PhaseController.RoundResult.WIN)
	print(phase_controller.get_current_phase())

func print_card(card: Card):
	if card == null:
		return
	print(
		"Rank:", Card.RANK.keys()[card.rank],
		"| Suit:", Card.SUIT.keys()[card.suit],
		"| Base Score:", card.base_score
	)
