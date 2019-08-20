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
