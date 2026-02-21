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
@onready var health_bar: ProgressBar = $HealthBar # Get a reference to the health bar node
@onready var health_bar2: ProgressBar = $HealthBar2
@onready var label = $Label # Assuming Label is a child

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
	
	rng.randomize()
	label.text = "Do you want to " + questions.pick_random() + "?"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	YearsAffcecting = rng.randi_range(1, 20) 
	modifier = [1, -1].pick_random() 
	ExpectedDeath = YearsAffcecting * modifier
	
	if modifier < 1:
		GainorLoss = "lost"
	else: GainorLoss = "gained"
	
	label.text = "You " + GainorLoss + " " + str(YearsAffcecting) + " years because of that decision." +"\nDo you want to " + questions.pick_random() + "?" + "\n \nYour Expected Death is Now: " + str(ExpectedDeath) + "\nYour Current Age is: " + str(health_bar.value)
	health_bar.value += 1 
	if health_bar.value >= ExpectedDeath:
		print("You have died")
		
	BotYearsAffcecting = rng.randi_range(1, 20) 
	Botmodifier = [1, -1].pick_random() 
	BotExpectedDeath = YearsAffcecting * modifier
	health_bar2.value += 1 
	
	if ExpectedDeath - health_bar.value <= 5:
		health_bar.modulate = Color.RED
	else:
		health_bar.modulate = Color.WHITE


func _on_button_2_pressed() -> void:
	print("then no button has been pressed!")
