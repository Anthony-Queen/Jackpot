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
	# First Linw
	if grid[0][1] == grid[0][2]:
		if grid[0][0] == grid[0][1] or grid[0][3] == grid[0][2]:
			if grid[0][0] == grid[0][1] == grid[0][3] == grid[0][2]:
				pass # Give coins for quadruple win (Use if's to figure out how many coins based on fruit)
			pass #Give Coins for triple win
	# Second Line
	if grid[1][1] == grid[1][2]:
		if grid[1][0] == grid[1][1] or grid[1][3] == grid[1][2]:
			if grid[1][0] == grid[1][1] == grid[1][3] == grid[1][2]:
				pass # Give coins for quadruple win (Use if's to figure out how many coins based on fruit)
			pass #Give Coins for triple win
	# Third Line
	if grid[2][0] == grid[2][1]:
		if grid[2][0] == grid[2][2]:
			if grid[2][0] == grid[2][3]:
				if grid[2][0] == grid[2][4]:
					pass # FIVE WIN
			# FOUR WIN
		# THREE WIN
	# Fourth Line
	if grid[3][0] == grid[3][1]:
		if grid[3][0] == grid[3][2]:
			if grid[3][0] == grid[3][3]:
				if grid[3][0] == grid[3][4]:
					pass # FIVE WIN
			# FOUR WIN
		# THREE WIN
	# Fifth Line
	if grid[4][1] == grid[4][2]:
		if grid[4][0] == grid[4][1] or grid[4][3] == grid[4][2]:
			if grid[4][0] == grid[4][1] == grid[4][3] == grid[4][2]:
				pass # Give coins for quadruple win (Use if's to figure out how many coins based on fruit)
			pass #Give Coins for triple win
	# Sixth Line
	if grid[5][1] == grid[5][2]:
		if grid[5][0] == grid[5][1] or grid[5][3] == grid[5][2]:
			if grid[5][0] == grid[5][1] == grid[5][3] == grid[5][2]:
				pass # Give coins for quadruple win (Use if's to figure out how many coins based on fruit)
			pass #Give Coins for triple win

func check_vertical_win():
	# First Column
	if grid[2][0] == grid[3][0]:
		if grid[2][0] == grid[1][0]:
			if  grid[2][0] == grid[4][0]:
				pass #FOUR WIN
			#THREE WIN

	# Second Column
	if grid[2][1] == grid[3][1]:
		if grid[2][1] == grid[1][0]:
			if  grid[2][1] == grid[4][0]:
				pass #FOUR WIN
			#THREE WIN

	# Third Column
	if grid[0][1] == grid[1][1]:
		if grid[0][1] == grid[2][2]:
			if grid[0][1] == grid[4][1]:
				if grid[0][1] == grid[5][1]:
					pass # Five Win
				# Four Win
			# Three Win

	# Fourth Column
	if grid[0][2] == grid[1][2]:
		if grid[0][2] == grid[2][2]:
			if grid[0][2] == grid[4][2]:
				if grid[0][2] == grid[5][2]:
					pass # Five Win
				# Four Win
			# Three Win

	# Fifth Column
	if grid[2][3] == grid[3][3]:
		if grid[2][3] == grid[1][3]:
			if  grid[2][3] == grid[4][3]:
				pass #FOUR WIN
			#THREE WIN

	# Sixth Column
	if grid[2][4] == grid[3][4]:
		if grid[2][4] == grid[1][3]:
			if  grid[2][4] == grid[4][3]:
				pass #FOUR WIN
			#THREE WIN

func check_diagonal_wins():
	if grid[0][0] == grid[2][2] == grid[5][3] or grid[0][3] == grid[2][2] == grid[5][0]:
		pass #Diagonal Win
	if grid[0][0] == grid[2][2] == grid[5][3] == grid[0][3] == grid[5][0]:
		pass #Jackpot!

func add_coins(x):
	if x == 0:
		coins += 100
