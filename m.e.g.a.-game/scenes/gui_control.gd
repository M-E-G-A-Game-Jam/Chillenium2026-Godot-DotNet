extends Control

#initiralizing a Random Generator
var rng = RandomNumberGenerator.new()

var questions = [
	"Get a dog",
	"Eat poison ivy",
	"Wake up before 6 AM",
	"Switch career paths",
	"Move to another country",
	"Eat dessert for breakfast",
	"Learn a new language",
	"Save 20% of income",
	"Go skydiving",
	"Delete social media",
	"Adopt a vegan diet",
	"Start a business",
	"Forgive a grudge",
	"Spend all day in pajamas",
	"Live in a tiny house",
	"Buy a lottery ticket",
	"Always tell the truth",
	"Talk to a stranger",
	"Run a marathon",
    "Learn to play an instrument"
]

var question_data = {
	"0-5": [
		{"text": "Learn to read?", "yes": 1, "no": -1},
		{"text": "Eat a penny?", "yes": -1, "no": 1}
	],
	"6-10": [
		{"text": "Bully a classmate?", "yes": 1, "no": -1},
		{"text": "Join a sports team?", "yes": -1, "no": 1}
	],
	"11-20": [
		{"text": "Start smoking?", "yes": [1,0, -1].pick_random() , "no": [1,0, -1].pick_random() },
		{"text": "Join the school choir?", "yes": [1, -1].pick_random() , "no": [1, -1].pick_random() }
	
	],
	"21-30":[
		{"text": "abc", "yes": -1, "no":1}
	],
	"31-40":[
		{"text": "abc", "yes": -1, "no":1}
	],
	"41-50":[
		{"text": "abc", "yes": -1, "no":1}
	],
	"51-60":[
		{"text": "abc", "yes": -1, "no":1}
	],
	"61-70":[
		{"text": "abc", "yes": -1, "no":1}
	],
	"71-80":[
		{"text": "abc", "yes": -1, "no":1}
	],
	"81-90":[
		{"text": "abc", "yes": -1, "no":1}
	],
	"91-100":[
		{"text": "abc", "yes": -1, "no":1}
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
	return "90-100"

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
	ExpectedDeath += YearsAffcecting
		
	health_bar.value += 1 
	if health_bar.value >= ExpectedDeath:
		print("You have died")
		
	BotYearsAffcecting = rng.randi_range(1, 20) 
	Botmodifier = [1, -1].pick_random() 
	BotExpectedDeath += (BotYearsAffcecting * Botmodifier)
	health_bar2.value += 1 
	
	if ExpectedDeath - health_bar.value <= 5:
		health_bar.modulate = Color.RED
	else:
		health_bar.modulate = Color.WHITE
	
	label.text = "You got " + str(YearsAffcecting) + " years because of that decision." +"\nDo you want to " + get_next_question()+ "?" + "\n \nYour Expected Death is Now: " + str(ExpectedDeath) + "\nYour Current Age is: " + str(health_bar.value)



func _on_button_2_pressed() -> void:
	YearsAffcecting = current_question["no"] * get_random_volatility()
	ExpectedDeath += YearsAffcecting
		
	label.text = "You got " + str(YearsAffcecting) + " years because of that decision." +"\nDo you want to " + get_next_question()+ "?" + "\n \nYour Expected Death is Now: " + str(ExpectedDeath) + "\nYour Current Age is: " + str(health_bar.value)
	health_bar.value += 1 
	if health_bar.value >= ExpectedDeath:
		print("You have died")
	print("then no button has been pressed!")
