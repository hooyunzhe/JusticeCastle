/* @pjs preload=
"../../assets/characters/ninja/ninjaStanding.png",
"../../assets/characters/ninja/ninjaJump.png",
"../../assets/characters/ninja/deadNinja.png",
"../../assets/characters/ninja/ninjaL5.png",
"../../assets/characters/ninja/ninjaL4.png",
"../../assets/characters/ninja/ninjaL3.png",
"../../assets/characters/ninja/ninjaL2.png",
"../../assets/characters/ninja/ninjaL1.png",
"../../assets/characters/ninja/ninjaR5.png",
"../../assets/characters/ninja/ninjaR4.png",
"../../assets/characters/ninja/ninjaR3.png",
"../../assets/characters/ninja/ninjaR2.png",
"../../assets/characters/ninja/ninjaR1.png",
"../../assets/platforms/plat1.png",
"../../assets/platforms/plat2.png",
"../../assets/platforms/plat3.png",
"../../assets/platforms/plat4.png",
"../../assets/objects/spike.png",
"../../assets/objects/portal.png"; */

var platforms = new Array();
var objects = new Array();
var bg;
var playerRight = [];
var playerLeft = [];
var playerJump;
var player;
var door;

void setup() {

// setup canvas
  size(SCREEN_WIDTH, SCREEN_HEIGHT);
  fill(0, 0, 0);
  RIGHT_MARGIN = 105
  bg = loadImage("../../assets/backgrounds/level1_without_plat.png");
  bgPlat = loadImage("../../assets/backgrounds/level1.png")
  startImage = loadImage("../../assets/screens/Start.png");

// platforms
  platforms.push(new Platform(646, 350, loadImage("../../assets/platforms/plat1.png")));
  platforms.push(new Platform(510, 471, loadImage("../../assets/platforms/plat2.png")));
  platforms.push(new Platform(564, FLOOR, loadImage("../../assets/platforms/plat3.png")));
  platforms.push(new Platform(0, FLOOR, loadImage("../../assets/platforms/plat4.png")));
  platforms.push(new Platform(251, FLOOR, loadImage("../../assets/platforms/plat4.png")));

// objects
  objects.push(new Spikes(loadImage("../../assets/objects/spike.png"), 177, FLOOR));
  objects.push(new Spikes(loadImage("../../assets/objects/spike.png"), 495, FLOOR));
  objects.push(new Spikes(loadImage("../../assets/objects/spike.png"), 425, FLOOR));
  objects.push(new Door(loadImage("../../assets/objects/portal.png"), 683, 298, "level_two.html"));

//Player Right Images
  playerRight[0] = loadImage("../../assets/characters/ninja/ninjaR1.png");
  playerRight[1] = loadImage("../../assets/characters/ninja/ninjaR2.png");
  playerRight[2] = loadImage("../../assets/characters/ninja/ninjaR3.png");
  playerRight[3] = loadImage("../../assets/characters/ninja/ninjaR4.png");
  playerRight[4] = loadImage("../../assets/characters/ninja/ninjaR5.png");
//Player Left Images
  playerLeft[0] = loadImage("../../assets/characters/ninja/ninjaL1.png");
  playerLeft[1] = loadImage("../../assets/characters/ninja/ninjaL2.png");
  playerLeft[2] = loadImage("../../assets/characters/ninja/ninjaL3.png");
  playerLeft[3] = loadImage("../../assets/characters/ninja/ninjaL4.png");
  playerLeft[4] = loadImage("../../assets/characters/ninja/ninjaL5.png");
// Player jump
  playerJump = loadImage("../../assets/characters/ninja/ninjaJump.png");
  playerIdle = loadImage("../../assets/characters/ninja/ninjaStanding.png");
  playerDead = loadImage("../../assets/characters/ninja/deadNinja.png");

  player = new Player(playerRight, playerLeft, playerJump, playerIdle, playerDead, 10, FLOOR);
}

void draw() {
  calculate();
  image(bg);
  drawPlatforms(platforms);
  drawObjects(objects);
  player.draw();
  if (gameState == gameStates.START) {
    image(startImage, 200, 200);
  }
}

function calculate() {
    calculatePlayerMovement();
    calculateJump();
    calculateGravity();
    calculatePlatforms(platforms);
    calculateObjects(objects);
}
