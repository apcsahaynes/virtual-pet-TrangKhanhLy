
// ---- Layout constants ----
final int STATS_X      = 420;   // left edge of stats panel
final int STATS_Y      = 20;    // top edge of stats panel
final int STATS_W      = 160;   // panel width
final int ROW_HEIGHT   = 32;    // space between each stat row

void drawStats(VirtualPet pet) {
  // Panel background
  fill(255, 255, 255, 180);
  stroke(180, 160, 220);
  strokeWeight(2);
  rect(STATS_X, STATS_Y, STATS_W, 200, 12);

  // Panel title
  fill(90, 60, 130);
  noStroke();
  textAlign(CENTER, TOP);
  textSize(15);
  text(pet.getName(), STATS_X + STATS_W / 2, STATS_Y + 10);

  // ---- Stat rows ----
  // statRow(label, value, rowIndex)
  // Add a new line here for each stat you add!
  int row = 0;
  statRow("Energy",    pet.getEnergyLevel(),    row++);
  statRow("Happiness", pet.getHappinessLevel(), row++);
  statRow("Weight",    pet.getWeight(),         row++);
  statRow("Age",       pet.getAgeYears(),       row++);
}

// Draws one label + value row inside the stats panel
void statRow(String label, int value, int rowIndex) {
  float rowY = STATS_Y + 40 + rowIndex * ROW_HEIGHT;

  // Label
  fill(100, 80, 140);
  noStroke();
  textAlign(LEFT, TOP);
  textSize(13);
  text(label + ":", STATS_X + 12, rowY);

  // Value
  fill(50);
  textAlign(RIGHT, TOP);
  text(value, STATS_X + STATS_W - 12, rowY);

  // Divider line
  stroke(200, 190, 220);
  strokeWeight(1);
  line(STATS_X + 10, rowY + 20, STATS_X + STATS_W - 10, rowY + 20);
}

// Draws the message above the buttons, fades after MESSAGE_DURATION
void drawMessage() {
  if (actionMessage.equals("")) return;

  int elapsed = millis() - messageTime;
  if (elapsed > MESSAGE_DURATION) {
    actionMessage = "";
    return;
  }

  // Fade out over the last 500ms
  float alpha = 255;
  if (elapsed > MESSAGE_DURATION - 500) {
    alpha = map(elapsed, MESSAGE_DURATION - 500, MESSAGE_DURATION, 255, 0);
  }

  fill(90, 60, 130, alpha);
  noStroke();
  textAlign(CENTER, CENTER);
  textSize(16);
  text(actionMessage, width / 2, 405);
}
