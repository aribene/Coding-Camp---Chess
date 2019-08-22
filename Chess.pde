GameHandler game;
Player p1, p2;
Board board;


void setup() {
  size(800, 800);
  rectMode(CENTER);
  p1 = new GraphicalPlayer(color(235, 230, 240)); //white  
  p2 = new GraphicalPlayer(color(10)); //black
  board = new Board();
  game = new GameHandler(board, p1, p2);
}

void draw() {
  background(5);
  board.show();
  game.onLoop();
}
