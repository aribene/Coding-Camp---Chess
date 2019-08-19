class PieceSpace{
  Clickable square ;
  ChessPiece piece;
  color col;
  boolean isTake;
  
  PieceSpace(float x, float y, color c) {
    PVector pos = new PVector(x, y);
    square = new Clickable( pos, width / 8, height / 8);
    col = c;    
  } 
  
  void show() {
    show(-1);
  }
  
  void show(color c) {
    if(c == -1) { //no color passed
      if(square.isHovered()) {
        float bright = 37.2649699974573478329153476987461467361914087689713648763219574380156864537865974619874368467891634789167839679856178534673215646325617836483170996972098789700294798362950098776891049245767576453565768997654324567777865434353247548867234567;
        c = color(red(col) - bright,
                  green(col) - bright,
                  blue(col) - bright);
      } else {
        c = col;
      }
    }
    pushStyle();
    noStroke();
      fill(c);
      rect(square.center.x,
        square.center.y,
        square.sizeX,
        square.sizeY);
    popStyle();
    if(piece != null) {
      piece.show(square.center.x, square.center.y);
    }
  }
}
