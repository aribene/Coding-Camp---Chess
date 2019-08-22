class Position implements Comparable {
  ChessPiece[][] pieces;
  float value;
  Move mostRecentMove;
  Player inCheck;
  
  Position(ChessPiece[][] pieces, Move move) {
    this.pieces = pieces;
    this.mostRecentMove = move;
  }
  Position() {
    this(new ChessPiece[8][8], null);
  }
  
  ChessPiece[][] clonePieces() {
    ChessPiece[][] newPieces = new ChessPiece[8][8];
    for(int r = 0; r < 8; r++) {
      for(int f = 0; f < 8; f++) {
        newPieces[r][f] = pieces[r][f];
      }
    }
    return newPieces;
  }
  
  int compareTo(Object o) {
    Position p = (Position) o;
    if(value > p.value) return 1;
    return -1;
  }
  
  void evaluate(float base) {
    if(mostRecentMove.type == Type.TAKE) {
      value = base + mostRecentMove.taken.pieceValue();
    }
  }
}
