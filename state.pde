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

  // Visual boundary line for the bottom 1/3 area
  stroke(0, 150, 150);
  strokeWeight(2);
  line(0, height * 2.0/3.0, width, height * 2.0/3.0);

  // --- AUTOMATIC FIRING ENGINE WITH INJURY CHECK ---
  if (hurtTimer == 0) {
    if (fireCooldown <= 0) {
      bullets.add(new Bullet(pingu.x, pingu.y));
      fireCooldown = fireRate;
    } else {
      fireCooldown--;
    }
  }

  // Move and check bullet interactions
  for (int j = bullets.size() - 1; j >= 0; j--) {
    // Safety boundary check
    if (j >= bullets.size()) continue;

    Bullet b = bullets.get(j);
    b.move();
    b.display();

    boolean bulletRemoved = false;

    // A. Pika blocks bullets
    for (int i = 0; i<pika.length; i++) {
      if (dist(b.x, b.y, pika[i].x, pika[i].y) < 45) {
        bullets.remove(j);
        bulletRemoved = true;
      }
    }

    // B. Bullets hit Nasa
    if (!bulletRemoved) {
      for (int i = 0; i < N; i++) {
        if (!nasa[i].eaten) {
          // Hit detection size adapts to current HP scale factors smoothly
          float currentScale = nasa[i].hp * 0.8;
          if (dist(b.x, b.y, nasa[i].x, nasa[i].y) < (25 * currentScale)) {
            nasa[i].hp--;
            bullets.remove(j);
            bulletRemoved = true;

            if (nasa[i].hp <= 0) {
              nasa[i].eaten = true;
            }
            break;
          }
        }
      }
    }

    // Clean up out-of-bounds bullets
    if (!bulletRemoved && b.isOffScreen()) {
      bullets.remove(j);
    }
  }

  // Draw Nasa targets & count remaining active instances
  for (int i = 0; i < N; i++) {
    if (!nasa[i].eaten) {
      nasa[i].display();
    } else {
      eatenCount++;
    }
  }

  // pika 움직이기
  for (int i = 0; i<pika.length; i++) {
    pika[i].move();
    pika[i].display();
  }
  // pingu는 마우스를 따라가되, y축은 하단 1/3 구역으로 제한함
  pingu.x = mouseX;
  pingu.y = constrain(mouseY, height * 2.0/3.0, height);

  // pika와 충돌

  for (int i = 0; i<pika.length; i++) {
    if (dist(pingu.x, pingu.y, pika[i].x, pika[i].y) < 60) {
      if (hurtTimer == 0) {
        hurtTimer = 15;
        hitCount++;
      }
    }
  }

  if (hitCount >= 3) {
    state = 2;
  }

  if (eatenCount == N) {
    state = 2;
  }

  // pingu 출력
  pingu.display();

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
