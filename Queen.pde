class Queen extends ChessPiece {
  Queen(Player p) {
    super(p); 
  }
  
  ArrayList<MoveSpace> getLegalMoves() {
    ArrayList arr = new ArrayList<PieceSpace>();
   
    // up, down, and sideways
    arr.addAll(ray(1, 0));
    arr.addAll(ray(0, 1));
    arr.addAll(ray(-1, 0));
    arr.addAll(ray(0, -1));
    
    // diagnols
    arr.addAll(ray(1, 1));
    arr.addAll(ray(-1, 1));
    arr.addAll(ray(1, -1));
    arr.addAll(ray(-1, -1));
    return getMovesFromSpaces(arr);
  }
  
    void show(float x, float y){
    pushAll(x, y);
      circle(0, 0, 30);
    popAll();
  }
}
