class Pawn extends ChessPiece {
  Pawn(Player p) {
    super(p);
  }
  
  ArrayList<MoveSpace> getLegalMoves() {
    ArrayList moves = new ArrayList<PieceSpace>();
    PieceSpace ahead = super.at(0, 1);
    if(ahead != null) {
      if(ahead.piece == null) moves.add(ahead);
      //moving ahead by 2 on first move
      PieceSpace ahead2 = at(0, 2);
      if(!hasMoved && ahead.piece == null && ahead2 != null && ahead2.piece == null) moves.add(ahead2);    
    }
    
    
    //taking diagonally
    PieceSpace diag1 = at(1, 1);
    PieceSpace diag2 = at(-1, 1);
    if(diag1 != null && diag1.piece != null) moves.add(diag1);
    if(diag2 != null && diag2.piece != null) moves.add(diag2);


    
    return getMovesFromSpaces(moves); 
  }
  
  void show(float x, float y){
    pushAll(x, y);
      rect(0, 30, 60, 20  );
      ellipse(0, 10, 30, 60);
      circle(0, -20, 40);
    popAll();
  }
}
