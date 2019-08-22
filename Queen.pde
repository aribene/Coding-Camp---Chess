class Queen extends ChessPiece {
  Queen(Player p) {
    super(p); 
  }
  
  int pieceValue() {return 9;};
  
  ArrayList<Move> getMoves(Position p, int r, int f) {
    ArrayList<Move> moves = new ArrayList<Move>();
    super.setTemp(p, r, f);
    // up, down, and sideways
    moves.addAll(ray(1, 0));
    moves.addAll(ray(0, 1));
    moves.addAll(ray(-1, 0));
    moves.addAll(ray(0, -1));
    
    // diagnols
    moves.addAll(ray(1, 1));
    moves.addAll(ray(-1, 1));
    moves.addAll(ray(1, -1));
    moves.addAll(ray(-1, -1));
    return moves;
  }
  
    void show(float x, float y){
    pushAll(x, y);
      rect(0, 35, 60, 15);
      circle(10, -30, 15);
      quad(10, -30, 20, 30, 0, 30, -5, 10);
      circle(-10, -30, 15);
      quad(-10, -30, -20, 30, 0, 30, 5, 10);
      circle(30, -20, 15);
      triangle(30, -20, 20, 30, 0, 30);
      circle(-30, -20, 15);
      triangle(-29.5, -20, -20, 30, 0, 30);
    popAll();
  }
}
