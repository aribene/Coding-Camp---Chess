class Bishop extends ChessPiece {
  Bishop(Player p) {
    super(p);
  }
  
  int pieceValue() {return 3;}
      
  ArrayList<Move> getMoves(Position p, int r, int f) {
    ArrayList<Move> moves = new ArrayList<Move>();
    super.setTemp(p, r, f);
    moves.addAll(ray(1, 1));
    moves.addAll(ray(-1, 1));
    moves.addAll(ray(1, -1));
    moves.addAll(ray(-1, -1));
    return moves;
  }
  
  
  void show(float x, float y){
    pushAll(x, y);
        ellipse(0, 10, 30, 60);
        circle(0, -20, 40);
        ellipse(0, -40, 17, 22);
        rect(0, 30, 60, 20  );
        ellipse(0, 10, 30, 60);
        circle(0, -20, 40);
    popAll();
  }
}
