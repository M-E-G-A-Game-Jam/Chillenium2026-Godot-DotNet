extends Control

#initiralizing a Random Generator
var rng = RandomNumberGenerator.new()


var question_data = {
	"0-5": [
		{"text": "Learn to read?", "yes": 1, "no": -1},
		{"text": "Eat a penny?", "yes": -1, "no": 1},
		{"text": "Play with a big tower of legos, twin?", "yes": 1, "no": -1},
		{"text": "Slide down the very steep slide, twin?", "yes": -1, "no": 1},
		{"text": "Wait until timeout is over, twin?", "yes": 1, "no": -1},
		{"text": "Run across a creek filled with slippery rocks, twin?", "yes": -1, "no": 1},
		{"text": "Yell at Mike the Tiger through a broken fence?", "yes": -1, "no": 1},
		{"text": "Sneak into a closed ride at ThisKnee World?", "yes": -1, "no": 1},
		{"text": "Touch a hot stove because it looks enticing?", "yes": -5, "no": 1}
	],
	"6-10": [
		{"text": "Bully a classmate?", "yes": -1, "no": 1},
		{"text": "Join a sports team?", "yes": 1, "no": -1},
		{"text": "Slide down a slide that is way too tall for you?", "yes": -1, "no": 1},
		{"text": "Run a lemonade stand?", "yes": 1, "no": -1},
		{"text": "Grow taller?", "yes": 1, "no": 0},
		{"text": "Eat way too much birthday cake?", "yes": -1, "no": 1},
		{"text": "Sign up for Soccer?", "yes": 1, "no": -1},
		{"text": "Sign up for Basketball?", "yes": 1, "no": -1},
		{"text": "Sign up for Baseball?", "yes": 1, "no": -1},
		{"text": "Sign up for American Football?", "yes": -1, "no": 1}, # High injury risk!
		{"text": "Sign up for Gymnastics?", "yes": 1, "no": -1}
	],
	"11-20": [
		{"text": "Start smoking?", "yes": -1, "no": 1},
		{"text": "Join the school choir?", "yes": 1, "no": -1},
		{"text": "Sign up for Rugby?", "yes": -1, "no": 1},
		{"text": "Sign up for Private School?", "yes": 1, "no": -1},
		{"text": "Climb 'Beeg Roc' while rock climbing?", "yes": -1, "no": 1},
		{"text": "Go inside the Haunted House?", "yes": -1, "no": 1},
		{"text": "Join the American Parkour Samurai Gladiator Challenge?", "yes": -1, "no": 1},
		{"text": "Have a big growth spurt?", "yes": 1, "no": 0},
		{"text": "Spar with your twin just for fun?", "yes": -1, "no": 1},
		{"text": "Go to a dangerous Black Friday Sale at BallMart?", "yes": -1, "no": 1},
		{"text": "Try to solve a coding bug as fast as possible?", "yes": -1, "no": 1},
		{"text": "Keep the 'Life Note' and write your name in it?", "yes": -10, "no": 1},
		{"text": "Play 'Umamusume: John Darby' gacha game?", "yes": -1, "no": 1},
		{"text": "Study early for the big test?", "yes": 1, "no": -1},
		{"text": "Spam dank memes everywhere you go?", "yes": -1, "no": 1}
	],
	"21-30": [
		{"text": "Go to a frat party?", "yes": -1, "no": 1},
		{"text": "Climb 'Beeg Roc'?", "yes": -1, "no": 1},
		{"text": "Keep the 'Life Note' and write your name in it?", "yes": -10, "no": 1},
		{"text": "Your twin asks if you'd lose a certain fight. Would you lose?", "yes": -1, "no": 1}
	],
	"31-40": [
		{"text": "Have children?", "yes": -1, "no": 1}, # Kids are stressful!
		{"text": "Talk to the skrunkly guy at the Gardening Addiction support group?", "yes": 1, "no": -1},
		{"text": "Cheat on your significant other?", "yes": -2, "no": 1},
		{"text": "A stray dog bit you. Go to the doctor even if insurance might not cover it?", "yes": 1, "no": -2},
		{"text": "Invest everything into Bitcoin?", "yes": -1, "no": 1},
		{"text": "Bail your hairdresser out of jail for the Nair incident?", "yes": -1, "no": 1},
		{"text": "Go bald voluntarily?", "yes": 1, "no": 0},
		{"text": "Quit your job to follow your dreams?", "yes": 1, "no": -1},
		{"text": "Max out your 401k contribution?", "yes": 1, "no": -1},
		{"text": "Max out your credit card on a jet ski?", "yes": -1, "no": 1}
	],
	"41-50": [
		{"text": "Buy a mid-life crisis sports car?", "yes": -1, "no": 1},
		{"text": "Start doing yoga to fix your 'bad back'?", "yes": 1, "no": -1},
		{"text": "Try to DIY fix the electrical wiring in your house?", "yes": -2, "no": 1},
		{"text": "Yell at the neighbor's kid for stepping on your lawn?", "yes": -1, "no": 1},
		{"text": "Go on a strictly 'Juice Cleanse' diet for a month?", "yes": -1, "no": 1}
	],
	"51-60": [
		{"text": "Retire early and live on a boat?", "yes": 1, "no": -1},
		{"text": "Take up extreme bird watching?", "yes": 1, "no": 0},
		{"text": "Start a fight with a goose at the local pond?", "yes": -1, "no": 1},
		{"text": "Learn how to use 'The TikTok'?", "yes": -1, "no": 1},
		{"text": "Eat a steak every single night?", "yes": -1, "no": 1}
	],
	"61-70": [
		{"text": "Move into a retirement community with a great pool?", "yes": 1, "no": -1},
		{"text": "Refuse to wear your hearing aid?", "yes": -1, "no": 1},
		{"text": "Drive your car through the front of a pharmacy accidentally?", "yes": -2, "no": 1},
		{"text": "Take up competitive Bingo?", "yes": 1, "no": 0}
	],
	"71-80": [
		{"text": "Try to do a backflip to impress your grandkids?", "yes": -5, "no": 1},
		{"text": "Eat nothing but soft prunes?", "yes": 1, "no": -1},
		{"text": "Argue with a ghost in the hallway?", "yes": -1, "no": 1},
		{"text": "Finally tell your twin what you really think of them?", "yes": 1, "no": -1}
	],
	"81-90": [
		{"text": "Attempt to outrun a snail?", "yes": -1, "no": 1},
		{"text": "Take a 4-hour nap in the middle of the grocery store?", "yes": 1, "no": -1},
		{"text": "Mistake the TV remote for a telephone?", "yes": 0, "no": 0}
	],
	"91-100": [
		{"text": "Breathe deeply?", "yes": 1, "no": -10},
		{"text": "Try to remember where you put your teeth?", "yes": 1, "no": -1},
		{"text": "Ascend to a higher plane of existence?", "yes": -10, "no": 1}
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


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
