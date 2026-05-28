class Pika {

  float x, y;
  float vx, vy;
  float d;

  Pika(float x, float y, float d) {

    this.x = x;
    this.y = y;
    this.d = d;

    vx = random(3, 8);
    vy = random(3, 8);
  }

  void display() {

    fill(255, 255, 0);

    ellipse(x-3*d, y-2*d, 2*d, 8*d);
    ellipse(x+3*d, y-2*d, 2*d, 8*d);

    ellipse(x, y+d, 10*d, 8*d);

    fill(255, 0, 0);

    circle(x+3*d, y+2*d, 2*d);
    circle(x-3*d, y+2*d, 2*d);

    fill(0);

    circle(x+1.5*d, y-.5*d, d);
    circle(x-1.5*d, y-.5*d, d);

    fill(255);

    circle(x+1.25*d, y-.75*d, .25*d);
    circle(x-1.25*d, y-.75*d, .25*d);

    noFill();

    arc(x+d, y+2*d,
      2*d, 2*d, PI/2, PI);

    arc(x-d, y+2*d,
      2*d, 2*d, 0, PI/2);
  }

  void move() {

    x += vx;
    y += vy;

    if (x > width || x < 0) {
      vx *= -1;
    }

    if (y > height || y < 0) {
      vy *= -1;
    }
  }
}



class Nasa {

  float x, y;
  float d;

  boolean eaten = false;

  Nasa(float x, float y, float d) {

    this.x = x;
    this.y = y;
    this.d = d;
  }

  void display() {

    fill(255);
    stroke(0);
    strokeWeight(1);

    // left arm
    pushMatrix();
    translate(x-10*d, y);
    rotate(radians(2*d));
    ellipse(0, 0, 7*d, 20*d);
    popMatrix();

    // right arm
    pushMatrix();
    translate(x+10*d, y);
    rotate(radians(-2*d));
    ellipse(0, 0, 7*d, 20*d);
    popMatrix();

    ellipse(x-5*d, y+20*d, 7*d, 20*d);
    ellipse(x+5*d, y+20*d, 7*d, 20*d);

    ellipse(x-15*d, y-15*d, 5*d, 10*d);
    ellipse(x+15*d, y-15*d, 5*d, 10*d);

    ellipse(x, y+5*d, 20*d, 30*d);

    quad(x-10*d, y+6*d,
      x+10*d, y+6*d,
      x+10*d, y+4*d,
      x-10*d, y+4*d);

    quad(x-5*d, y+8*d,
      x+5*d, y+8*d,
      x+5*d, y+2*d,
      x-5*d, y+2*d);

    ellipse(x, y-15*d, 30*d, 28*d);

    fill(0);
    ellipse(x, y-15*d, 29*d, 20*d);

    stroke(255);
    strokeWeight(d);

    noFill();
    arc(x, y-15*d, 25*d, 16*d, PI, 3*PI/2);
    arc(x, y-15*d, 25*d, 16*d, 0, PI/3);

    fill(0);
    noStroke();

    arc(x-5*d, y+30.5*d, 7*d, 7*d, PI, 2*PI);
    arc(x+5*d, y+30.5*d, 7*d, 7*d, PI, 2*PI);

    circle(x-14*d, y+10*d, 7*d);
    circle(x+14*d, y+10*d, 7*d);

    fill(207, 63, 63);
    circle(x-2.5*d, y+5*d, 2.5*d);

    fill(63, 118, 207);
    circle(x+2.5*d, y+5*d, 2.5*d);
  }
}



class Pingu {

  float x, y;
  float d;

  Pingu(float x, float y, float d) {

    this.x = x;
    this.y = y;
    this.d = d;
  }

  void display() {

    // 맞으면 빨간색 반짝
    if (hurtTimer > 0 &&
      hurtTimer % 4 < 2) {

      fill(255, 0, 0);

    } else {

      fill(0);
    }

    noStroke();

    // 얼굴
    circle(x, y, 12*d);

    // 눈
    fill(255);

    circle(x-4*d, y-3*d, 4*d);
    circle(x+4*d, y-3*d, 4*d);

    fill(0);

    circle(x-4*d, y-3*d, 2*d);
    circle(x+4*d, y-3*d, 2*d);

    // 입
    fill(255, 0, 0);

    ellipse(x, y+2*d, 8*d, 4*d);
  }
}
