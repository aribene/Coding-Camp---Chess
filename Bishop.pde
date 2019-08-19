class Bishop extends ChessPiece {
  Bishop(Player p) {
    super(p);
  }
      
  ArrayList<MoveSpace> getLegalMoves() {
    ArrayList arr = new ArrayList<PieceSpace>();
    arr.addAll(ray(1, 1));
    arr.addAll(ray(-1, 1));
    arr.addAll(ray(1, -1));
    arr.addAll(ray(-1, -1));
    return getMovesFromSpaces(arr);
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
