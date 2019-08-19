Player p1, p2;
Board board;
void setup() {
  size(800, 800);
  rectMode(CENTER);
  p1 = new Player(color(130, 160, 180)); //white
  p2 = new Player(color(19)); //black
  board = new Board(p1, p2);
}

void draw() {
  background(5);
  board.show();
}