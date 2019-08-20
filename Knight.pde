class Knight extends ChessPiece {
  Knight(Player p) {
    super(p);
  }
  
  ArrayList<MoveSpace> getLegalMoves() {
    ArrayList moves = new ArrayList<PieceSpace>();
    moves.add(at(2, -1));
    moves.add(at(2, 1));
    moves.add(at(1, -2));
    moves.add(at(1, 2));
    moves.add(at(-2, -1));
    moves.add(at(-2, 1));
    moves.add(at(-1, -2));
    moves.add(at(-1, 2));
  
    return getMovesFromSpaces(moves);
  }
  void show(float x, float y) {
    pushAll(x, y);
      rect(0, 35, 60, 15);
      quad(0, 0, 20, 29.5, -20, 30, -15, -5);
      triangle(0, 5, 0, -35, -15, -5);
      quad(0, -30, -5, 5, 25, -15, 18, -25);
      quad(25, -15, 30, -5, 20, 5, 5, -10);
    popAll();
  }
}
