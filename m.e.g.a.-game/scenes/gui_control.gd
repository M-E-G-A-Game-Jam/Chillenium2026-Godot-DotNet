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
@onready var label = $Label # Assuming Label is a child

var ExpectedDeath: float
var YearsAffcecting: float
var AddOrSubtract: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	health_bar.max_value = ExpectedDeath
	health_bar.value = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	label.text = questions.pick_random()
	health_bar.value -= 10
	if health_bar.value <= 0:
		print("Health is zero!")
