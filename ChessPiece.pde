abstract class ChessPiece {
  Player owner;
  color col;
  int r, c;
  PieceSpace[][] spaces;
 
  ChessPiece(Player p) {
    owner = p;
    col = owner.col;
  }
  
  void setSpaces(PieceSpace[][] s) {
    spaces = s;
  }
  
  void show(float x, float y) {}
  
  void setPos(int r, int c){
    this.r = r;
    this.c = c;
  }
  ArrayList<MoveSpace> getLegalMoves() {
    ArrayList arr = new ArrayList<MoveSpace>();
    return arr;
  }
  
  ArrayList<MoveSpace> getMovesFromSpaces(ArrayList<PieceSpace> arr) {
    ArrayList<MoveSpace> moves = new ArrayList<MoveSpace>();
    for(PieceSpace p : arr) {
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
    yChange *= - 1; //invert y
    int x = c + xChange;
    int y = r + yChange;
    while(x >= 0 && x < 8 && y >= 0 && y < 8) {
      arr.add(spaces[y][x]);
      if(spaces[y][x].piece != null) break;
      x += xChange;
      y += yChange;

    }
    return arr;
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
