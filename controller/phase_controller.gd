extends Node
class_name PhaseController

signal game_started
signal game_ended
signal phase_started(phase: PHASE)
signal phase_ended(phase: PHASE)

enum PHASE {
	START, 
	PREFLOP, 
	FLOP, 
	TURN, 
	RIVER, 
	SHOWDOWN, 
	END
}

enum RoundResult {
	WIN,
	LOSE,
	LOSE_NO_HEALTH
}

var current_phase: PHASE = PHASE.START
var game_started_once := false

func get_current_phase() -> PHASE:
	return current_phase
	
func start_game() -> void:
	if game_started_once:
		return

	game_started_once = true
	current_phase = PHASE.START
	emit_signal("game_started")
	emit_signal("phase_started", current_phase)
	
func next_phase() -> void:
	emit_signal("phase_ended", current_phase)

	match current_phase:
		PHASE.START:
			current_phase = PHASE.PREFLOP
		PHASE.PREFLOP:
			current_phase = PHASE.FLOP
		PHASE.FLOP:
			current_phase = PHASE.TURN
		PHASE.TURN:
			current_phase = PHASE.RIVER
		PHASE.RIVER:
			current_phase = PHASE.SHOWDOWN
		PHASE.SHOWDOWN:
			# Wait for showdown result
			return
		PHASE.END:
			return

	emit_signal("phase_started", current_phase)

func resolve_showdown(result: RoundResult) -> void:
	if current_phase != PHASE.SHOWDOWN:
		return

	emit_signal("phase_ended", PHASE.SHOWDOWN)

	match result:
		RoundResult.LOSE_NO_HEALTH:
			current_phase = PHASE.END
			emit_signal("phase_started", PHASE.END)
			emit_signal("game_ended")

		RoundResult.WIN, RoundResult.LOSE:
			current_phase = PHASE.PREFLOP
			emit_signal("phase_started", current_phase)
