int N = 20; // [cite: 26]

Nasa[] nasa;
Pika[] pika;
Pingu pingu;
ArrayList<Bullet> bullets;

int hurtTimer = 0;
int state = 0; // [cite: 26]

int fireRate = 12;      
int fireCooldown = 0;   

int hitCount = 0;

void setup() {
  size(400, 400); // [cite: 27]
  startGame(); // [cite: 28]
}

void draw() {
  background(0, 255, 255);

  if (state == 0) { // [cite: 28]
    ready(); // [cite: 28]
  } // [cite: 29]
  else if (state == 1) { // [cite: 29]
    play(); // [cite: 29]
  } // [cite: 30]
  else if (state == 2) { // [cite: 30]
    gameOver(); // [cite: 30]
  }
}

void mousePressed() {
  if (state == 0) { // [cite: 31]
    if (mouseX > 50 && mouseX < 350 && mouseY > 150 && mouseY < 250) { // [cite: 31]
      state = 1; // [cite: 31]
    } // [cite: 32]
  }
  else if (state == 2) { // [cite: 32]
    startGame(); // [cite: 32]
    state = 0; // [cite: 33]
  }
}

void startGame() {
  nasa = new Nasa[N]; // [cite: 33]
  for (int i = 0; i < N; i++) { // 
    // Randomize health points between 1 and 3.
    // The Nasa class constructor automatically scales size based on this value.
    float randomHP = floor(random(1, 4)); 
    nasa[i] = new Nasa(random(width), random(height - 150), randomHP); // 
  }
  pika = new Pika[2];
  for (int i = 0; i<pika.length; i++) {
  pika[i] = new Pika(random(width), random(height), 5); // [cite: 35] 
  }
  pingu = new Pingu(width/2, height - 50, 5); // [cite: 36]
  
  bullets = new ArrayList<Bullet>();

  hitCount = 0; // [cite: 37]
  hurtTimer = 0; // [cite: 37]
  fireCooldown = 0;
}
