class Pika {
  //Properties
  float x, y;
  float vx, vy;
  float d;

  //Constructor
  Pika(float x, float y, float d) {
    this.x = x;
    this.y = y;
    this.d = d;
    this.vx = random(3, 8);
    this.vy = random(3, 8);
  }

  //Methods
  void display() {
    // Ears
    fill(255, 255, 0);
    ellipse(x-3*d, y-2*d, 2*d, 8*d);
    ellipse(x+3*d, y-2*d, 2*d, 8*d);

    // Head
    ellipse(x, y+d, 10*d, 8*d);

    // Cheeks
    fill(255, 0, 0);
    circle(x+3*d, y+2*d, 2*d);
    circle(x-3*d, y+2*d, 2*d);

    // Eyes
    fill(0);
    circle(x+1.5*d, y-.5*d, d);
    circle(x-1.5*d, y-.5*d, d);

    // Pupils
    fill(255);
    circle(x+1.25*d, y-.75*d, .25*d);
    circle(x-1.25*d, y-.75*d, .25*d);

    // Mouth
    noFill();
    arc(x+d, y+2*d, 2*d, 2*d, PI/2, PI);
    arc(x-d, y+2*d, 2*d, 2*d, 0, PI/2);
  }
  void move() {
    x += vx;
    y += vy;
    if (x> width || x < 0) vx *= -1;
    if (y > height || y < 0) vy *= -1;
  }
}


class Nasa {
  //Properties
  float x, y;
  float vx, vy;
  float d;

  //Constructor
  Nasa(float x, float y, float d) {
    this.x = x;
    this.y = y;
    this.d = d;
    this.vx = random(3, 8);
    this.vy = random(3, 8);
  }

  //Methods
  void display() {
    fill(255);
    stroke(0);
    strokeWeight(1);
    //legt arm
    pushMatrix();
    translate(x-10*d, y);
    rotate(radians(2*d));
    ellipse(0, 0, 7*d, 20*d);
    popMatrix();
    //right arm
    pushMatrix();
    translate(x+10*d, y);
    rotate(radians(-2*d));
    ellipse(0, 0, 7*d, 20*d);
    popMatrix();
    ellipse(x-5*d, y+20*d, 7*d, 20*d); //left leg
    ellipse(x+5*d, y+20*d, 7*d, 20*d); //right leg
    ellipse(x-15*d, y-15*d, 5*d, 10*d); //left ear
    ellipse(x+15*d, y-15*d, 5*d, 10*d); //right ear
    ellipse(x, y+5*d, 20*d, 30*d);
    quad(x-10*d, y+6*d, x+10*d, y+6*d, x+10*d, y+4*d, x-10*d, y+4*d);
    quad(x-5*d, y+8*d, x+5*d, y+8*d, x+5*d, y+2*d, x-5*d, y+2*d); //body
    ellipse(x, y-15*d, 30*d, 28*d); //head
    fill(0);
    ellipse(x, y-15*d, 29*d, 20*d); // glass
    stroke(255, 255, 255);
    strokeWeight(d);
    noFill();
    arc(x, y-15*d, 25*d, 16*d, PI, 3*PI/2);
    arc(x, y-15*d, 25*d, 16*d, 0, PI/3);
    fill(0);
    noStroke();
    arc(x-5*d, y+30.5*d, 7*d, 7*d, PI, 2*PI); //left foot
    arc(x+5*d, y+30.5*d, 7*d, 7*d, PI, 2*PI); //right foot
    circle(x-14*d, y+10*d, 7*d); //left hand
    circle(x+14*d, y+10*d, 7*d); //right hand
    //button
    fill(207, 63, 63);
    circle(x-2.5*d, y+5*d, 2.5*d);
    fill(63, 118, 207);
    circle(x+2.5*d, y+5*d, 2.5*d);
  }
  void move() {
    this.x += this.vx;
    this.y += this.vy;
    if (this.x> width || this.x < 0) this.vx *= -1;
    if (this.y > height || this.y < 0) this.vy *= -1;
  }
}

class Pingu {
  //Properties
  float x, y;
  float vx, vy;
  float d;

  //Constructor
  Pingu(float x, float y, float d) {
    this.x = x;
    this.y = y;
    this.d = d;
    this.vx = random(3, 8);
    this.vy = random(3, 8);
  }

  //Methods
  void display() {
     fill(0);
  noStroke();
  circle(x, y, 12 * d); // Face
  stroke(0);
  strokeWeight(2);
  fill(255);
  circle(x - 4 * d, y - 3 * d, 4.5 * d); // Left sclera
  circle(x + 4 * d, y - 3 * d, 4.5 * d); // Right sclera
  fill(0);
  noStroke();
  circle(x - 4 * d, y - 3 * d, 2 * d); // Left pupil
  circle(x + 4 * d, y - 3 * d, 2 * d); // Right pupil
  fill(255, 0, 0);
  noStroke();
  ellipse(x, y + 2 * d, 8 * d, 4 * d); // Mouth
  }
  void move() {
    this.x += this.vx;
    this.y += this.vy;
    if (this.x> width || this.x < 0) this.vx *= -1;
    if (this.y > height || this.y < 0) this.vy *= -1;
  }
}
