extends Node

var Line1: Array = ["BIG", "SMALL", "SMALL", "BIG"]
var Line2: Array = ["BIG", "SMALL", "SMALL", "BIG"]
var Line3: Array = ["SMALL", "SMALL", "BIG", "SMALL", "SMALL"]
var Line4: Array = ["SMALL", "SMALL", "BIG", "SMALL", "SMALL"]
var Line5: Array = ["BIG", "SMALL", "SMALL", "BIG"]
var Line6: Array = ["BIG", "SMALL", "SMALL", "BIG"]
var grid: Array = [Line1, Line2, Line3, Line4, Line5, Line6]
var coins = 100 

const SYMBOL_TO_ID = { # Converts symbol to number which is then put in the Array
	"seven":  7,
	"bar":    6,
	"bell":   5,
	"melon":  4,
	"plum":   3,
	"orange": 2,
	"cherry": 1,
	"lemon":  0
}

# Symbol, RowWin: coins
const PAYOUTS = {  
	0: {3: 5,  4: 10, 5: 20,},
	1: {3: 6,  4: 12, 5: 25},
	2: {3: 8,  4: 16, 5: 40},
	3: {3: 10, 4: 20, 5: 60},
	4: {3: 12, 4: 25, 5: 80},
	5: {3: 15, 4: 30, 5: 120},
	6: {3: 20, 4: 50, 5: 200},
	7: {3: 50, 4: 200,5: 1000}
}

@warning_ignore_start("unused_signal")
signal pressed
signal rotated
@warning_ignore_restore("unused_signal")

func update_slot(slot_index: int, symbolId: int) -> void: #This updates the array with the actual symbol on the slots
	if slot_index == 0:
		grid[2][3] = symbolId #This isn't zero cause its in the middle, just for more readability
		grid[3][3] = symbolId
	elif slot_index == 1:
		grid[0][0] = symbolId
		grid[1][0] = symbolId
	elif slot_index == 2:
		grid[0][3] = symbolId
		grid[1][3] = symbolId
	elif slot_index == 3:
		grid[4][0] = symbolId
		grid[5][0] = symbolId
	elif slot_index == 4: # LAST Big Slot
		grid[4][3] = symbolId
		grid[5][3] = symbolId
	# From 5 to 21 it's small slots, in groups of 4
	elif slot_index == 5: 
		grid[0][1] = symbolId
	elif slot_index == 6: 
		grid[0][2] = symbolId
	elif slot_index == 7:
		grid[1][1] = symbolId
	elif slot_index == 8:
		grid[1][2] = symbolId
	
	elif slot_index == 9:
		grid[2][0] = symbolId
	elif slot_index == 10:
		grid[2][1] = symbolId
	elif slot_index == 11:
		grid[3][0] = symbolId
	elif slot_index == 12:
		grid[3][1] = symbolId
	
	elif slot_index == 13:
		grid[2][3] = symbolId
	elif slot_index == 14:
		grid[2][4] = symbolId
	elif slot_index == 15:
		grid[3][3] = symbolId
	elif slot_index == 16:
		grid[3][4] = symbolId
	
	elif slot_index == 17:
		grid[4][1] = symbolId
	elif slot_index == 18:
		grid[4][2] = symbolId
	elif slot_index == 19:
		grid[5][1] = symbolId
	elif slot_index == 20:
		grid[5][2] = symbolId

func check_wins():
	check_horizontal_win()
	check_vertical_win()
	check_diagonal_wins()

func check_horizontal_win():
	# First Line
	if grid[0][1] == grid[0][2]:
		if grid[0][0] == grid[0][1] or grid[0][3] == grid[0][2]:
			if grid[0][0] == grid[0][1] and grid[0][1] == grid[0][2] and grid[0][2] == grid[0][3]:
				coins += PAYOUTS[grid[0][0]][4]
			else:
				coins += PAYOUTS[grid[0][1]][3]

	# Second Line
	if grid[1][1] == grid[1][2]:
		if grid[1][0] == grid[1][1] or grid[1][3] == grid[1][2]:
			if grid[1][0] == grid[1][1] and grid[1][1] == grid[1][2] and grid[1][2] == grid[1][3]:
				coins += PAYOUTS[grid[1][0]][4]
			else:
				coins += PAYOUTS[grid[1][1]][3]

	# Third Line
	if grid[2][0] == grid[2][1]:
		if grid[2][0] == grid[2][2]:
			if grid[2][0] == grid[2][3]:
				if grid[2][0] == grid[2][4]:
					coins += PAYOUTS[grid[2][0]][5]
				else:
					coins += PAYOUTS[grid[2][0]][4]
			else:
				coins += PAYOUTS[grid[2][0]][3]

	# Fourth Line
	if grid[3][0] == grid[3][1]:
		if grid[3][0] == grid[3][2]:
			if grid[3][0] == grid[3][3]:
				if grid[3][0] == grid[3][4]:
					coins += PAYOUTS[grid[3][0]][5]
				else:
					coins += PAYOUTS[grid[3][0]][4]
			else:
				coins += PAYOUTS[grid[3][0]][3]

	# Fifth Line
	if grid[4][1] == grid[4][2]:
		if grid[4][0] == grid[4][1] or grid[4][3] == grid[4][2]:
			if grid[4][0] == grid[4][1] and grid[4][1] == grid[4][2] and grid[4][2] == grid[4][3]:
				coins += PAYOUTS[grid[4][0]][4]
			else:
				coins += PAYOUTS[grid[4][1]][3]

	# Sixth Line
	if grid[5][1] == grid[5][2]:
		if grid[5][0] == grid[5][1] or grid[5][3] == grid[5][2]:
			if grid[5][0] == grid[5][1] and grid[5][1] == grid[5][2] and grid[5][2] == grid[5][3]:
				coins += PAYOUTS[grid[5][0]][4]
			else:
				coins += PAYOUTS[grid[5][1]][3]

func check_vertical_win():
	# First Column
	if grid[2][0] == grid[3][0]:
		if grid[2][0] == grid[1][0]:
			if grid[2][0] == grid[4][0]:
				coins += PAYOUTS[grid[2][0]][4]
			else:
				coins += PAYOUTS[grid[2][0]][3]

	# Second Column
	if grid[2][1] == grid[3][1]:
		if grid[2][1] == grid[1][1]:
			if grid[2][1] == grid[4][1]:
				coins += PAYOUTS[grid[2][1]][4]
			else:
				coins += PAYOUTS[grid[2][1]][3]

	# Third Column
	if grid[0][1] == grid[1][1]:
		if grid[0][1] == grid[2][1]:
			if grid[0][1] == grid[4][1]:
				if grid[0][1] == grid[5][1]:
					coins += PAYOUTS[grid[0][1]][5]
				else:
					coins += PAYOUTS[grid[0][1]][4]
			else:
				coins += PAYOUTS[grid[0][1]][3]

	# Fourth Column
	if grid[0][2] == grid[1][2]:
		if grid[0][2] == grid[2][2]:
			if grid[0][2] == grid[4][2]:
				if grid[0][2] == grid[5][2]:
					coins += PAYOUTS[grid[0][2]][5]
				else:
					coins += PAYOUTS[grid[0][2]][4]
			else:
				coins += PAYOUTS[grid[0][2]][3]

	# Fifth Column
	if grid[2][3] == grid[3][3]:
		if grid[2][3] == grid[1][3]:
			if grid[2][3] == grid[4][3]:
				coins += PAYOUTS[grid[2][3]][4]
			else:
				coins += PAYOUTS[grid[2][3]][3]

	# Sixth Column
	if grid[2][4] == grid[3][4]:
		if grid[2][4] == grid[1][4]:
			if grid[2][4] == grid[4][4]:
				coins += PAYOUTS[grid[2][4]][4]
			else:
				coins += PAYOUTS[grid[2][4]][3]

func check_diagonal_wins():
	if grid[0][0] == grid[2][2] and grid[2][2] == grid[5][3] or grid[0][3] == grid[2][2] and grid[2][2] == grid[5][0]:
		coins += PAYOUTS[grid[0][0][5]] * 10
	if grid[0][0] == grid[2][2] == grid[5][3] == grid[0][3] == grid[5][0]:
		coins += PAYOUTS[grid[0][0][5]] * 100
