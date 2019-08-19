class Rook extends ChessPiece {
  Rook(Player p) {
    super(p);
  }
  
  ArrayList<MoveSpace> getLegalMoves() {
    ArrayList arr = new ArrayList<PieceSpace>();
    arr.addAll(ray(1, 0));
    arr.addAll(ray(0, 1));
    arr.addAll(ray(-1, 0));
    arr.addAll(ray(0, -1));
    return getMovesFromSpaces(arr);
  }
  
  void show(float x, float y){
    pushAll(x, y);
      rect(0, 30, 60, 20  );
      rect(0, 0, 30, 42  );
      rect(0, -20, 15, 20  );
      rect(20, -20, 15, 20  );
      rect(-20, -20, 15, 20  );
    popAll();
  }
}
