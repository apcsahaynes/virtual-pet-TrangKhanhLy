VirtualPet myPet;

Button feedButton;
Button playButton;

Food apple;
Food cupcake;
Food broccoli;
Food potato;
Button appleButton;
Button cupcakeButton;
Button broccoliButton;
Button potatoButton;
int feed = 0;

Game coinToss;
Game hoopJumping;
Game simonSays;
Button coinTossButton;
Button hoopJumpingButton;
Button simonSaysButton;
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

  appleButton = new Button("Apple", 150, 350, 120, 45);
  cupcakeButton = new Button("Cupcake", 150, 300, 120, 45);
  broccoliButton = new Button("Broccoli", 150, 250, 120, 45);
  potatoButton = new Button("Potato", 150, 200, 120, 45);

  coinTossButton = new Button("Coin Toss", 330, 350, 120, 45);
  hoopJumpingButton = new Button("Hoop Jumping", 330, 300, 120, 45);
  simonSaysButton = new Button("Simon Says", 330, 250, 120, 45);


  //Create food option
  //Food(name, energyIncrease, happinessIncrease, weightGain)
  apple = new Food("Apple", 2, 1, 1);
  cupcake = new Food("Cupcake", 1, 2, 2);
  broccoli = new Food("Broccoli", 3, -1, 1);
  potato = new Food("Potato", 2, 0, 2);

  //Create game option
  //Game(name, happinessIncr, weightDecr)
  coinToss = new Game("Coin Toss", 1, 0);
  hoopJumping = new Game("Hoop Jumping", 2, 2);
  simonSays = new Game("Simon Says", 1, 2);
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
    appleButton.display();
    cupcakeButton.display();
    broccoliButton.display();
    potatoButton.display();
  }
  playButton.display();
  if (play > 0) {
    coinTossButton.display();
    hoopJumpingButton.display();
    simonSaysButton.display();
  }
  drawMessage();
}

void mousePressed() {

  //Feed with food options
  if (feedButton.isClicked(mouseX, mouseY)) {
    feed++;
  }
  if (appleButton.isClicked(mouseX, mouseY)) {
    myPet.feed(apple);
    showMessage(apple.getName() + " eaten!");
    feed--;
  }
  if (cupcakeButton.isClicked(mouseX, mouseY)) {
    myPet.feed(cupcake);
    showMessage(cupcake.getName() + " eaten!");
    feed--;
  }
  if (broccoliButton.isClicked(mouseX, mouseY)) {
    myPet.feed(broccoli);
    showMessage(broccoli.getName() + " eaten!");
    feed--;
  }
  if (potatoButton.isClicked(mouseX, mouseY)) {
    myPet.feed(potato);
    showMessage(potato.getName() + " eaten!");
    feed--;
  }

  //Play with game options
  if (playButton.isClicked(mouseX, mouseY)) {
    play++;
  }
  if (coinTossButton.isClicked(mouseX, mouseY)) {
    showMessage(myPet.getName() + myPet.play(coinToss));
    play--;
  }
  if (hoopJumpingButton.isClicked(mouseX, mouseY)) {
    showMessage(myPet.getName() + myPet.play(hoopJumping));
    play--;
  }
  if (simonSaysButton.isClicked(mouseX, mouseY)) {
    showMessage(myPet.getName() + myPet.play(simonSays));
    play--;
  }
}

// Call this to set a new message
void showMessage(String msg) {
  actionMessage = msg;
  messageTime = millis();
}
