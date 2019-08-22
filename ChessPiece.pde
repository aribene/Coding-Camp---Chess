abstract class ChessPiece {
  final Player owner;
  final color col;
  ChessPiece[][] pieces;
  int rank, file;
  
  ChessPiece(Player owner) {
    this.owner = owner;
    this.col = owner.col;
  }
  
  void setTemp(Position p, int rank, int file) {
    this.pieces = p.pieces;
    this.rank = rank;
    this.file = file;
  }
  
  abstract ArrayList<Move> getMoves(Position pos, int r, int f);
  
  ArrayList<Move> getLegalMoves(Position pos, int r, int f) {    
    ArrayList<Move> legalMoves = new ArrayList<Move>(); 
    ArrayList<Move> moves = this.getMoves(pos, r, f);
    
    if(pos.inCheck != owner) return moves;
    //check checking process
    /*
    candidateLoop: for(Move candidate :moves) {
      // loop over candidates
      Position testPosition = candidate.applyTo(pos);
      // create new board after doing move
      if(threatMove.isLegal(testPosition)) {
        // candidate move was illegal, try next move
        continue candidateLoop;
      }
    }
      // candidate move was legal, add to list
      ArrayList<Move> = getMoves(testPosition, candidate.to.rank, candidate.to.file);
      //ArrayList<Move> threats = new ArrayList<>(); 
      for(Move maybeCheck : maybeChecks) {
        if(maybeCheck.taken instanceof King) {
          maybeCheck.threat = true; 
        }
      }
      legalMoves.add(candidate);
      */
      return null;
}
  
  abstract int pieceValue();
  abstract void show(float x, float y);
  
  ArrayList<Move> ray(int xChange, int yChange) {
    // returns a list of potential moves along a ray (for Rook, Bishop, Queen)
    ArrayList<Move> moves = new ArrayList<Move>();
    if(!owner.forward) yChange *= -1; // invert y if players moves other direction
    int r2 = rank + yChange;
    int f2 = file + xChange;
    while(inBounds(r2, f2)) {
      // as long as within bounds of board, add to list and apply change
      if(pieces[r2][f2] != null) {
        // collided with other piece, add to list then stop
        if(pieces[r2][f2].owner != owner) moves.add(new Move(pieces, rank, file, r2, f2, Type.TAKE));
        break;
      } else {
        // continue ray
        moves.add(new Move(pieces, rank, file, r2, f2));
        r2 += yChange;
        f2 += xChange;
      }
    }
    return moves;
  }
  
  Move at(int xChange, int yChange) {
    if(!owner.forward) yChange *= -1; // invert y if players moves other direction
    int r2 = rank + yChange;
    int f2 = file + xChange;
    if(!inBounds(r2, f2)) return null;
    // as long as within bounds of board, add to list and apply change
    if(pieces[r2][f2] == null) return new Move(pieces, rank, file, r2, f2);
    else if(pieces[r2][f2].owner != owner) return new Move(pieces, rank, file, r2, f2, Type.TAKE);
    return null;
  }
  
  ChessPiece pieceAt(int xChange, int yChange) {
    if(!owner.forward) yChange *= -1;
    int r2 = rank + yChange;
    int f2 = file + xChange;
    if(!inBounds(r2, f2)) return null;
    return pieces[r2][f2];
  }
  
  boolean inBounds(int r, int f) {
    // returns if (x, y) is within board
    return r >= 0 && r < 8 && f >= 0 && f < 8;
  }
  
  void pushAll(float x, float y) {
    // apply translation and styling before drawing piece
    pushMatrix();
    translate(x, y);
    pushStyle();
    fill(col);
    noStroke();
  }
  
  void popAll() {
    // remove translation and styling after drawing piece
    popStyle();
    popMatrix();
  }
}
