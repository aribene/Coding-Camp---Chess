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
      rect(0, 5, 35, 57  );
      rect(20, -32, 11, 16  );
      rect(-20, -32, 11, 16  );
      rect(0, -36, 14, 24  );
      rect(0, 36, 50, 7  );
    popAll();
  }
}
