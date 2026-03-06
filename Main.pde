VirtualPet myPet;

Button feedButton;
Button playButton;

ArrayList<Food> foodOption;
ArrayList<Button> foodButton;
int feed = 0;

ArrayList<Game> gameOption;
ArrayList<Button> gameButton;
int play = 0;

// How many milliseconds between each status update
// (increase to slow down, decrease to speed up)
final int UPDATE_INTERVAL = 10000;
int lastUpdateTime = 0;

// ---- Action message ----
String actionMessage = "";
int messageTime = 0;
final int MESSAGE_DURATION = 2000; // milliseconds to show the message

void setup() {
  size(600, 500);
  textFont(createFont("Arial", 16, true));

  myPet = new VirtualPet("Coco");


  // Buttons sit along the bottom of the screen
  // Button(label, x, y, width, height)
  feedButton = new Button("Feed", 150, 430, 120, 45);
  playButton = new Button("Play", 330, 430, 120, 45);

  // Create food choice buttons
  foodButton = new ArrayList<Button>();
  foodButton.add(new Button("Apple", 150, 350, 120, 45));
  foodButton.add(new Button("Cupcake", 150, 300, 120, 45));
  foodButton.add(new Button("Broccoli", 150, 250, 120, 45));
  foodButton.add(new Button("Potato", 150, 200, 120, 45));

  // Create game choice buttons
  gameButton = new ArrayList<Button>();
  gameButton.add(new Button("Coin Toss", 330, 350, 120, 45));
  gameButton.add(new Button("Hoop Jumping", 330, 300, 120, 45));
  gameButton.add(new Button("Simon Says", 330, 250, 120, 45));


  //Create food options
  //Food(name, energyIncrease, happinessIncrease, weightGain)
  foodOption = new ArrayList<Food>();
  foodOption.add(new Food("Apple", 2, 1, 1));
  foodOption.add(new Food("Cupcake", 1, 2, 2));
  foodOption.add(new Food("Broccoli", 3, -1, 1));
  foodOption.add(new Food("Potato", 2, 0, 2));

  //Create game option
  //Game(name, happinessIncr, weightDecr)
  gameOption = new ArrayList<Game>();
  gameOption.add(new Game("Coin Toss", 1, 0));
  gameOption.add(new Game("Hoop Jumping", 2, 2));
  gameOption.add(new Game("Simon Says", 1, 2));
}

void draw() {
  background(245, 240, 255);

  // ---- Timed status update ----
  if (millis() - lastUpdateTime >= UPDATE_INTERVAL) {
    myPet.updateStatus();
    lastUpdateTime = millis();
  }

  // ---- Draw sections ----
  drawPetArea();
  drawStats(myPet);
  feedButton.display();
  if (feed > 0) {
    for (int i=0; i < foodButton.size(); i++) {
      foodButton.get(i).display();
    }
  }
  playButton.display();
  if (play > 0) {
    for (int i=0; i < gameButton.size(); i++) {
      gameButton.get(i).display();
    }
  }
  drawMessage();
}

void mousePressed() {

  //Feed with food options
  if (feedButton.isClicked(mouseX, mouseY)) {
    feed++;
  }
  for (int i=0; i < foodButton.size(); i++) {
    if (foodButton.get(i).isClicked(mouseX, mouseY)) {
      myPet.feed(foodOption.get(i));
      showMessage(foodOption.get(i).getName() + " eaten!");
      feed--;
    }
  }

  //Play with game options
  if (playButton.isClicked(mouseX, mouseY)) {
    play++;
  }
  for (int i=0; i < gameButton.size(); i++) {
    if (gameButton.get(i).isClicked(mouseX, mouseY)) {
      showMessage(myPet.getName() + myPet.play(gameOption.get(i)));
      play--;
    }
  }
}

// Call this to set a new message
void showMessage(String msg) {
  actionMessage = msg;
  messageTime = millis();
}
