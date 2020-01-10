soundLine string;

void setup() {
  size(800, 800);

  int _x = 50;

  string = new soundLine(_x, 500, _x, 50);
}

void draw() {
  background(0);

  string.display();
  string.stretch();
}
