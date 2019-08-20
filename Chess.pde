Player p1, p2;
Board board;
PieceMover mover;


void setup() {
  size(800, 800);
  rectMode(CENTER);
  p1 = new Player(color(130, 160, 180), true); //white  
  p2 = new Player(color(19), false); //black
  board = new Board(p1, p2);
  mover = new PieceMover(p1, p2, board.spaces);
}

void draw() {
  background(5);
  board.show();
  mover.update();
}
