void ready() {

  fill(0);
  rect(50, 150, 300, 100);

  fill(0);
  textAlign(CENTER, CENTER);
  textSize(20);
  text("Press START button", 200, 120);

  fill(255, 0, 0);
  textSize(50);
  text("START", 200, 200);
}



void play() {

  int eatenCount = 0;

  // nasa 출력 + 먹기 판정
  for (int i = 0; i < N; i++) {

    if (!nasa[i].eaten) {

      nasa[i].display();

      // nasa 먹기
      if (dist(pingu.x, pingu.y,
        nasa[i].x, nasa[i].y) < 40) {

        nasa[i].eaten = true;
      }
    }

    // 먹은 nasa 개수 세기
    if (nasa[i].eaten) {
      eatenCount++;
    }
  }

  // pika 움직이기
  pika.move();
  pika.display();

  // pingu는 마우스를 따라감
  pingu.x = mouseX;
  pingu.y = mouseY;

  // pika와 충돌
  if (dist(pingu.x, pingu.y,
    pika.x, pika.y) < 60) {

    if (hurtTimer == 0) {

      hurtTimer = 15;

      hitCount++;
    }
  }

  // 조건 1 : 3번 맞기
  if (hitCount >= 3) {
    state = 2;
  }

  // 조건 2 : nasa 전부 먹기
  if (eatenCount == N) {
    state = 2;
  }

  // pingu 출력
  pingu.display();

  // 반짝 타이머
  if (hurtTimer > 0) {
    hurtTimer--;
  }

  // hit 표시
  fill(0);
  textSize(20);
  textAlign(LEFT, TOP);
  text("HIT : " + hitCount, 10, 10);
}



void gameOver() {

  fill(0);
  rect(50, 140, 300, 120);

  fill(255, 0, 0);

  textAlign(CENTER, CENTER);

  textSize(45);
  text("GAME OVER", 200, 180);

  textSize(18);
  text("Click to Restart", 200, 230);
}
