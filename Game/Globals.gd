extends Node

# For the Big 5 slots
var BigSlots: Array = [0, 0, 0, 0, 0] 
# Each one groups 4 small panels in slot sections
var SmallSlots1: Array = [0, 0, 0, 0]
var SmallSlots2: Array = [0, 0, 0, 0]
var SmallSlots3: Array = [0, 0, 0, 0]
var SmallSlots4: Array = [0, 0, 0, 0]
var grid: Array = [BigSlots, SmallSlots1, SmallSlots2, SmallSlots3, SmallSlots4]

const SYMBOL_TO_ID = { # Converts symbol to number which is then put in the Array
	"seven":  0,
	"bar":    1,
	"bell":   2,
	"melon":  3,
	"plum":   4,
	"orange": 5,
	"cherry": 6,
	"lemon":  7
}

@warning_ignore("unused_signal")
signal pressed

func update_slot(slot_index: int, symbolId: int) -> void: #This updates the array with the actual symbol on the slots
	if slot_index == 0:
		grid[0][2] = symbolId #This isn't zero cause its in the middle, just for more readability
	elif slot_index == 1:
		grid[0][0] = symbolId
	elif slot_index == 2:
		grid[0][1] = symbolId
	elif slot_index == 3:
		grid[0][3] = symbolId
	elif slot_index == 4: # LAST Big Slot
		grid[0][4] = symbolId
	
	# From 5 to 21 it's small slots, in groups of 4
	elif slot_index == 5: 
		grid[1][0] = symbolId
	elif slot_index == 6: 
		grid[1][1] = symbolId
	elif slot_index == 7:
		grid[1][2] = symbolId
	elif slot_index == 8:
		grid[1][3] = symbolId
	
	elif slot_index == 9:
		grid[2][0] = symbolId
	elif slot_index == 10:
		grid[2][1] = symbolId
	elif slot_index == 11:
		grid[2][2] = symbolId
	elif slot_index == 12:
		grid[2][3] = symbolId
	
	elif slot_index == 13:
		grid[3][0] = symbolId
	elif slot_index == 14:
		grid[3][1] = symbolId
	elif slot_index == 15:
		grid[3][2] = symbolId
	elif slot_index == 16:
		grid[3][3] = symbolId
	
	elif slot_index == 17:
		grid[4][0] = symbolId
	elif slot_index == 18:
		grid[4][1] = symbolId
	elif slot_index == 19:
		grid[4][2] = symbolId
	elif slot_index == 20:
		grid[4][3] = symbolId

func check_horizontal_win_3(): #HOW TF DO I DO THIS WITHOUT USING 3000 IF STATEMENTSSSSSS
	#if grid has 3 same symbols touching:
		#add_coins 
	pass
