class King extends ChessPiece {
  King(Player p) {
    super(p);
  }
  
  ArrayList<MoveSpace> getLegalMoves() {
    ArrayList moves = new ArrayList<PieceSpace>();
    
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
    return getMovesFromSpaces(moves);
  }
  
  void show(float x, float y) {
    pushAll(x, y);
      rect(0, 0, 50, 50);
    popAll();
  }
}
