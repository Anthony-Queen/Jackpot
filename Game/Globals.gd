extends Node

# For the Big 5 slots
var BigSlots: Array = [0, 0, 0, 0, 0] 
# Each one groups 4 small panels in slot sections
var SmallSlots1: Array = [0, 0, 0, 0]
var SmallSlots2: Array = [0, 0, 0, 0]
var SmallSlots3: Array = [0, 0, 0, 0]
var SmallSlots4: Array = [0, 0, 0, 0]
var grid: Array = [BigSlots, SmallSlots1, SmallSlots2, SmallSlots3, SmallSlots4]
const SYMBOL_TO_ID = {
	"seven":  0,
	"bar":    1,
	"bell":   2,
	"melon":  3,
	"plum":   4,
	"orange": 5,
	"cherry": 6,
	"lemon":  7
}

signal pressed

func update_slot(slot_index: int, symbolId: int) -> void: #This isnt act working code but it's very much a start
	if slot_index >= 5:
		grid[0][slot_index] = symbolId
	elif slot_index >= 8:
		grid[1]
	elif slot_index >= 12:
		grid[2]
	elif slot_index >= 16:
		grid[3]
	else: # 17 to 20
		grid[4]
