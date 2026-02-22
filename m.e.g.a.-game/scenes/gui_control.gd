extends Control

#initiralizing a Random Generator
var rng = RandomNumberGenerator.new()

var question_data = {
	"0-5": [
		{"text": "Learn to read?\n", "yes": 1, "no": -1},
		{"text": "Eat a penny?\n", "yes": -1, "no": 1}, # Negative to eat pennies!
		{"text": "Play with a big tower of legos, twin?\n", "yes": 1, "no": -1},
		{"text": "Slide down the very steep slide, twin?\n", "yes": 1, "no": -1},
		{"text": "Wait until timeout is over, twin?\n", "yes": 1, "no": -1},
		{"text": "Run across a creek filled with slippery rocks, twin?\n", "yes": 1, "no": -1},
		{"text": "Yell at Mike the Tiger through a broken fence?\n", "yes": 1, "no": -1},
		{"text": "Sneak into a closed ride at ThisKnee World?\n", "yes": 1, "no": -1},
		{"text": "Touch a hot stove because it looks enticing?\n", "yes": -5, "no": 1}
	],
	"6-10": [
		{"text": "Bully a classmate?\n", "yes": -1, "no": 1},
		{"text": "Join a sports team?\n", "yes": 1, "no": -1},
		{"text": "Slide down a slide that is way too tall for you?\n", "yes": 1, "no": -1},
		{"text": "Run a lemonade stand?\n", "yes": 1, "no": -1},
		{"text": "Grow taller?\n", "yes": 1, "no": 0},
		{"text": "Eat way too much birthday cake?\n", "yes": -1, "no": 1},
		{"text": "Sign up for Soccer?\n", "yes": 1, "no": -1},
		{"text": "Sign up for Basketball?\n", "yes": 1, "no": -1},
		{"text": "Sign up for Baseball?\n", "yes": 1, "no": -1},
		{"text": "Sign up for American Football?\n", "yes": 1, "no": -1},
		{"text": "Sign up for Gymnastics?\n", "yes": 1, "no": -1}
	],
	"11-20": [
		{"text": "Start smoking?\n", "yes": -1, "no": 1},
		{"text": "Join the school choir?\n", "yes": 1, "no": -1},
		{"text": "Sign up for Rugby?\n", "yes": 1, "no": -1},
		{"text": "Sign up for Private School?\n", "yes": 1, "no": -1},
		{"text": "Climb 'Beeg Roc' while rock climbing?\n", "yes": 1, "no": -1},
		{"text": "Go inside the Haunted House?\n", "yes": 1, "no": -1},
		{"text": "Join the American Parkour Samurai Gladiator Challenge?\n", "yes": 1, "no": -1},
		{"text": "Have a big growth spurt?\n", "yes": 1, "no": 0},
		{"text": "Spar with your twin just for fun?\n", "yes": 1, "no": -1},
		{"text": "Go to a dangerous Black Friday Sale at BallMart?\n", "yes": 1, "no": -1},
		{"text": "Try to solve a coding bug as fast as possible?\n", "yes": 1, "no": -1},
		{"text": "Keep the 'Life Note' and write your name in it?\n", "yes": -10, "no": 1},
		{"text": "Play 'Umamusume: John Darby' gacha game?\n", "yes": 1, "no": -1},
		{"text": "Study early for the big test?\n", "yes": 1, "no": -1},
		{"text": "Spam dank memes everywhere you go?\n", "yes": 1, "no": -1}
	],
	"21-30": [
		{"text": "Go to a frat party?\n", "yes": 1, "no": -1},
		{"text": "Climb 'Beeg Roc'?\n", "yes": 1, "no": -1},
		{"text": "Keep the 'Life Note' and write your name in it?\n", "yes": -10, "no": 1},
		{"text": "Your twin asks if you'd lose a certain fight. Would you lose?\n", "yes": -1, "no": 1}
	],
	"31-40": [
		{"text": "Have children?\n", "yes": 1, "no": -1},
		{"text": "Talk to the skrunkly guy at the Gardening Addiction support group?\n", "yes": 1, "no": -1},
		{"text": "Cheat on your significant other?\n", "yes": -2, "no": 1},
		{"text": "A stray dog bit you. Go to the doctor even if insurance might not cover it?\n", "yes": 1, "no": -2},
		{"text": "Invest everything into Bitcoin?\n", "yes": 1, "no": -1},
		{"text": "Bail your hairdresser out of jail for the Nair incident?\n", "yes": 1, "no": -1},
		{"text": "Go bald voluntarily?\n", "yes": 1, "no": 0},
		{"text": "Quit your job to follow your dreams?\n", "yes": 1, "no": -1},
		{"text": "Max out your 401k contribution?\n", "yes": 1, "no": -1},
		{"text": "Max out your credit card on a jet ski?\n", "yes": 1, "no": -1}
	],
	"41-50": [
		{"text": "Buy a mid-life crisis sports car?\n", "yes": 1, "no": -1},
		{"text": "Start doing yoga to fix your 'bad back'?\n", "yes": 1, "no": -1},
		{"text": "Try to DIY fix the electrical wiring in your house?\n", "yes": -2, "no": 1},
		{"text": "Yell at the neighbor's kid for stepping on your lawn?\n", "yes": 1, "no": -1},
		{"text": "Go on a strictly 'Juice Cleanse' diet for a month?\n", "yes": 1, "no": -1}
	],
	"51-60": [
		{"text": "Retire early and live on a boat?\n", "yes": 1, "no": -1},
		{"text": "Take up extreme bird watching?\n", "yes": 1, "no": 0},
		{"text": "Start a fight with a goose at the local pond?\n", "yes": 1, "no": -1},
		{"text": "Learn how to use 'The TikTok'?\n", "yes": 1, "no": -1},
		{"text": "Eat a steak every single night?\n", "yes": 1, "no": -1}
	],
	"61-70": [
		{"text": "Move into a retirement community with a great pool?\n", "yes": 1, "no": -1},
		{"text": "Refuse to wear your hearing aid?\n", "yes": -1, "no": 1},
		{"text": "Drive your car through the front of a pharmacy accidentally?\n", "yes": -2, "no": 1},
		{"text": "Take up competitive Bingo?\n", "yes": 1, "no": 0}
	],
	"71-80": [
		{"text": "Try to do a backflip to impress your grandkids?\n", "yes": -5, "no": 1},
		{"text": "Eat nothing but soft prunes?\n", "yes": 1, "no": -1},
		{"text": "Argue with a ghost in the hallway?\n", "yes": -1, "no": 1},
		{"text": "Finally tell your twin what you really think of them?\n", "yes": 1, "no": -1}
	],
	"81-90": [
		{"text": "Attempt to outrun a snail?\n", "yes": 1, "no": -1},
		{"text": "Take a 4-hour nap in the middle of the grocery store?\n", "yes": 1, "no": -1},
		{"text": "Mistake the TV remote for a telephone?\n", "yes": 0, "no": 0}
	],
	"91-100": [
		{"text": "Breathe deeply?\n", "yes": 1, "no": -10},
		{"text": "Try to remember where you put your teeth?\n", "yes": 1, "no": -1},
		{"text": "Ascend to a higher plane of existence?\n", "yes": 1, "no": -10}
	]
}

@onready var health_bar: ProgressBar = $HealthBar # Get a reference to the health bar node
@onready var health_bar2: ProgressBar = $HealthBar2
@onready var label = $Label # Assuming Label is a child


var current_question
var ExpectedDeath: int
var YearsAffcecting: int
var AddOrSubtract: bool
var modifier
var GainorLoss = ""

var BotExpectedDeath: int
var BotYearsAffcecting: int
var BotAddOrSubtract: bool
var Botmodifier

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health_bar.max_value = 100
	health_bar.value = 1
	health_bar2.max_value = 100
	health_bar2.value = 1
	ExpectedDeath = health_bar.max_value
	rng.randomize()
	label.text = "Do you want to " + get_next_question() + "?"




func get_age_key() -> String:
	if health_bar.value <= 5: return "0-5"
	if health_bar.value <= 10: return "6-10"
	if health_bar.value <= 20: return "11-20"
	if health_bar.value <= 30: return "21-30"
	if health_bar.value <= 40: return "31-40"
	if health_bar.value <= 50: return "41-50"
	if health_bar.value <= 60: return "51-60"
	if health_bar.value <= 70: return "61-70"
	if health_bar.value <= 80: return "71-80"
	if health_bar.value <= 90: return "81-90"
	return "91-100"

func get_next_question() -> String:
	var key = get_age_key()
	var pool = question_data[key]
	current_question = pool.pick_random()
	return current_question["text"]

func get_random_volatility() -> int:
	var intensity = 0
	
	if health_bar.value <= 10:
		intensity = randi_range(10,15)
	elif health_bar.value <= 50:
		intensity = randf_range(3,7)
	else:
		intensity = randf_range(1,3)
	return intensity
	
	

func _on_button_pressed() -> void:
	YearsAffcecting = current_question["yes"] * get_random_volatility()
		
	health_bar.value += 1 
	if health_bar.value >= ExpectedDeath:
		print("You have died")
	
	Botmodifier = [1, -1].pick_random() 
	BotYearsAffcecting = Botmodifier *  get_random_volatility()
	BotExpectedDeath += (BotYearsAffcecting * Botmodifier)
	health_bar2.value += 1 
	
	if ExpectedDeath - health_bar.value <= 5:
		health_bar.modulate = Color.RED
	else:
		health_bar.modulate = Color.WHITE
		
	if ExpectedDeath >= 100:
		ExpectedDeath = 100
		label.text = "\nDo you want to " + get_next_question()+ "?" + "\n \nYour Expected Death is maxxed out." + "\nYour Current Age is: " + str(health_bar.value)
	else:
		ExpectedDeath += YearsAffcecting
		label.text = "You got " + str(YearsAffcecting) + " years because of that decision." +"\nDo you want to " + get_next_question()+ "?" + "\n \nYour Expected Death is Now: " + str(ExpectedDeath) + "\nYour Current Age is: " + str(health_bar.value)



func _on_button_2_pressed() -> void:
	YearsAffcecting = current_question["no"] * get_random_volatility()
	ExpectedDeath += YearsAffcecting
		
	label.text = "You got " + str(YearsAffcecting) + " years because of that decision." +"\nDo you want to " + get_next_question()+ "?" + "\n \nYour Expected Death is Now: " + str(ExpectedDeath) + "\nYour Current Age is: " + str(health_bar.value)
	health_bar.value += 1 
	
	Botmodifier = [1, -1].pick_random() 
	BotYearsAffcecting = Botmodifier *  get_random_volatility()
	BotExpectedDeath += (BotYearsAffcecting * Botmodifier)
	health_bar2.value += 1 
			
	if ExpectedDeath >= 100:
		ExpectedDeath = 100
		label.text = "\nDo you want to " + get_next_question()+ "?" + "\n \nYour Expected Death is maxxed out." + "\nYour Current Age is: " + str(health_bar.value)
	else:
		ExpectedDeath += YearsAffcecting
		label.text = "You got " + str(YearsAffcecting) + " years because of that decision." +"\nDo you want to " + get_next_question()+ "?" + "\n \nYour Expected Death is Now: " + str(ExpectedDeath) + "\nYour Current Age is: " + str(health_bar.value)


	if health_bar.value >= ExpectedDeath:
		print("You have died")
	print("then no button has been pressed!")
