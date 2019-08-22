class King extends ChessPiece {
  King(Player p) {
    super(p);
  }
  
  int pieceValue() {return 15;}
  
  ArrayList<Move> getMoves(Position p, int r, int f) {
    ArrayList<Move> moves = new ArrayList<Move>();
    super.setTemp(p, r, f);
    
    // up, down, and sideways
    moves.add(at(1, 0));
    moves.add(at(0, 1));
    moves.add(at(-1, 0));
    moves.add(at(0, -1));
    
    // diagnols
    moves.add(at(1, 1));
    moves.add(at(-1, 1));
    moves.add(at(1, -1));
    moves.add(at(-1, -1));
    return moves;
  }
  
  void show(float x, float y) {
    pushAll(x, y);
      rect(0, 0, 50, 50);
    popAll();
  }
}
