int N;
Pika [] pika;
Nasa [] nasa;
Pingu [] pingu;
void setup() {
  N = 3;
  pika = new Pika[N];
  nasa = new Nasa[N];
  pingu = new Pingu[N];
  size(800, 800);
  textSize(50);
  for(int i=0; i<N; i++) {
   pika[i] = new Pika(random(800), random(800), random(2,10)); 
   nasa[i] = new Nasa(random(800), random(800), random(2,10));
   pingu[i] = new Pingu(random(800), random(800), random(2,10));
  }
}
void draw() {
  
  background(0,255,255);
  for(int i=0; i<N; i++) {
   pika[i].move();
   pika[i].display();
   nasa[i].move();
   nasa[i].display();
   pingu[i].move();
   pingu[i].display();
  }
}
