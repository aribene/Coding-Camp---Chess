class Pawn extends ChessPiece {
  Pawn(Player p) {
    super(p);
  }
  
  void show(float x, float y){
    pushAll(x, y);
      rect(0, 30, 60, 20  );
      ellipse(0, 10, 30, 60);
      circle(0, -20, 40);
    popAll();
  }
}