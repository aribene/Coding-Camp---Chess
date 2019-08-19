class Board {
  PieceSpace[][] spaces;

  color c1 = color(0, 100, 8);
  color c2 = color(207);

  float w = width / 8.0;
  float h = height / 8.0;

  Board(Player p1, Player p2) {
    spaces = new PieceSpace[8][8];
    for (int r = 0; r < 8; r++) {
      float yOffset = r * h + h/2;
      for (int c = 0; c < 8; c++) {
      float xOffset = c * w + w/2;
        color col;
        if((r + c) % 2 == 1) {
          col = c1;
        } else {
          col = c2;
        }
        spaces[r][c] = new PieceSpace(xOffset, yOffset, col);
      }
    }
    /*
    addPiece(3, 4, new Rook(p1));
    addPiece(3, 2, new Pawn(p1));
    addPiece(1, 4, new Pawn(p2));
    addPiece(2, 3, new Bishop(p2));
    addPiece(5, 3, new Queen(p1)); 
    */
    

    fillBoard(p1, p2);
  }
  
  void fillBoard(Player p1, Player p2) {
    for(int i = 0; i < 8; i++) {
      addPieces(6, i, new Pawn(p1), new Pawn(p2));
    }
    addPieces(7, 0, new Rook(p1), new Rook(p2));
    addPieces(7, 7, new Rook(p1), new Rook(p2));
    addPieces(7, 5, new Bishop(p1), new Bishop(p2));
    addPieces(7, 2, new Bishop(p1), new Bishop(p2));
    addPieces(7, 3, new Queen(p1), new Queen(p2)); 
  }
  
  void addPieces(int r, int c, ChessPiece white, ChessPiece black) {
    addPiece(r, c, white);
    addPiece(7 - r, c, black);
  }

  void addPiece(int r, int c, ChessPiece toAdd) {
    spaces[r][c].piece = toAdd;
    toAdd.setPos(r, c);
    toAdd.setSpaces(spaces);
  }
  void show() {
    for(int r = 0; r < 8; r++) {
      for(int c = 0; c < 8; c++) {
        PieceSpace s = spaces[r][c];
        s.show();
      }
    }
  }
}
