class Rook extends ChessPiece {
  Rook(Player p) {
    super(p);
  }
  
  int pieceValue() {return 5;}
  
  ArrayList<Move> getMoves(Position p, int r, int f) {
    ArrayList<Move> moves = new ArrayList<Move>();
    super.setTemp(p, r, f);
    moves.addAll(ray(1, 0));
    moves.addAll(ray(0, 1));
    moves.addAll(ray(-1, 0));
    moves.addAll(ray(0, -1));
    return moves;
  }
  
  void show(float x, float y){
    pushAll(x, y);
      rect(0, 30, 60, 20  );
      rect(0, 0, 30, 42  );
      rect(0, -20, 15, 20  );
      rect(20, -20, 15, 20  );
      rect(-20, -19.5, 15, 20  );
    popAll();
  }
}
