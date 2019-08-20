abstract class ChessPiece {
  Player owner;
  color col;
  int r, c;
  boolean hasMoved;
  PieceSpace[][] spaces;
 
  ChessPiece(Player p) {
    owner = p;
    col = owner.col;
  }
  
  void setSpaces(PieceSpace[][] s) {
    spaces = s;
  }
  
  abstract void show(float x, float y);
  abstract ArrayList<MoveSpace> getLegalMoves();
  
  void setPos(int r, int c){
    this.r = r;
    this.c = c;
  }
  
  ArrayList<MoveSpace> getMovesFromSpaces(ArrayList<PieceSpace> arr) {
    ArrayList<MoveSpace> moves = new ArrayList<MoveSpace>();
    for(PieceSpace p : arr) {
      if(p == null) continue;
      if(p.piece != null) {
        if(p.piece.owner != this.owner) {
          moves.add(new MoveSpace(p, true));
        }
      } else {
        moves.add(new MoveSpace(p, false));
      }
    }
    return moves;
  }
  
  ArrayList<PieceSpace> ray(int xChange, int yChange) {
    ArrayList<PieceSpace> arr = new ArrayList<PieceSpace>();
    if(owner.forward) yChange *= - 1; //invert y
    int x = c + xChange;
    int y = r + yChange;
    while(inBounds(x, y)) {
      arr.add(spaces[y][x]);
      if(spaces[y][x].piece != null) break;
      x += xChange;
      y += yChange;

    }
    return arr;
  }
  
  PieceSpace at(int xChange, int yChange) {
    if(owner.forward) yChange *= - 1; //invert y
    if(!inBounds(r + yChange, c + xChange)) return null;
    return spaces[r + yChange][c + xChange];
  }
  
  boolean inBounds(int x, int y) {
    return x >= 0 && x < 8 && y >= 0 && y < 8;
  }
  
  void pushAll(float x, float y){
    pushMatrix();
    translate(x, y);
    pushStyle();
    noStroke();
    fill(col);
  }
  
  void popAll() {
    popStyle();
    popMatrix();
  }
}
