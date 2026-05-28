int N = 20;

Nasa[] nasa;

Pika pika;
Pingu pingu;

int hurtTimer = 0;

int state = 0;

// 0 = ready
// 1 = play
// 2 = game over

int hitCount = 0;



void setup() {

  size(400, 400);

  startGame();
}



void draw() {

  background(0, 255, 255);

  // ready
  if (state == 0) {

    ready();
  }

  // play
  else if (state == 1) {

    play();
  }

  // game over
  else if (state == 2) {

    gameOver();
  }
}



void mousePressed() {

  // ready → play
  if (state == 0) {

    if (mouseX > 50 &&
      mouseX < 350 &&
      mouseY > 150 &&
      mouseY < 250) {

      state = 1;
    }
  }

  // game over → ready
  else if (state == 2) {

    startGame();

    state = 0;
  }
}



void startGame() {

  nasa = new Nasa[N];

  // nasa 생성
  for (int i = 0; i < N; i++) {

    nasa[i] =
      new Nasa(random(width),
      random(height), 1);
  }

  // pika 생성
  pika =
    new Pika(random(width),
    random(height), 15);

  // pingu 생성
  pingu =
    new Pingu(width/2,
    height/2, 5);

  // 초기화
  hitCount = 0;

  hurtTimer = 0;
}
