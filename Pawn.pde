class Pawn extends ChessPiece {
  Pawn(Player p) {
    super(p);
  }
  
  int pieceValue() {return 1;}
  
  ArrayList<Move> getMoves(Position p, int r, int f) {
    ArrayList<Move> moves = new ArrayList<Move>();
    super.setTemp(p, r, f);
    
    ChessPiece ahead = pieceAt(0, 1);
    if(ahead == null) moves.add(at(0, 1));
    
    //moving ahead by 2 on first move
    ChessPiece ahead2 = pieceAt(0, 2);
    if((r == 1 || r == 6) && ahead == null && ahead2 == null) moves.add(at(0, 2));    
    
    
    //taking diagonally
    ChessPiece diag1 = pieceAt(1, 1);
    ChessPiece diag2 = pieceAt(-1, 1);
    if(diag1 != null) moves.add(at(1, 1));
    if(diag2 != null) moves.add(at(-1, 1));


    
    return moves; 
  }
  
  void show(float x, float y){
    pushAll(x, y);
      rect(0, 30, 60, 20  );
      ellipse(0, 10, 30, 60);
      circle(0, -20, 40);
    popAll();
  }
}
