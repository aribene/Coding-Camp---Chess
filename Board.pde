class Board {
  Position pos;
  PieceSpace[][] spaces;
  
  final color c1 = color(80); // black
  //final color c2 = color(255); // white
  final color c2 = color(182, 0, 0);
  
  final float w = width / 8.0;
  final float h = height / 8.0;
  
  Board() {
    pos = new Position();
    spaces = new PieceSpace[8][8]; // initialize 2D array with 8x8 grid of PieceSpaces
    
    // cycle through all 64, make PieceSpace instance, set color, put in 2D array
    for(int r = 0; r < 8; r++) {
      // ranks
      float yOffset = map(r, 0, 7, height - h/2, h/2);//r * h + h/2;
      for(int f = 0; f < 8; f++) {
        // files
        float xOffset = f * w + w/2;
        color col;
        //if((r + f) % 2 == 1) col = c1; // black
        //else col = c2; // white
        col = color(0, r * 33, f *33);
        
        // put in array
        spaces[r][f] = new PieceSpace(xOffset, yOffset, col, r, f, this);
      }
    }
  }
  
  void fillBoard(Player p1, Player p2) {
    /*
    addPiece(3, 4, new Rook(p1));
    addPiece(3, 2, new Pawn(p1));
    addPiece(1, 4, new Pawn(p2));
    addPiece(2, 3, new Bishop(p2));
    */
    
    // start the board with pieces in the right places
    for(int i = 0; i < 8; i++) {
      addPiecePair(1, i, new Pawn(p1), new Pawn(p2));
    }
    addPiecePair(0, 0, new Rook(p1), new Rook(p2));
    addPiecePair(0, 1, new Knight(p1), new Knight(p2));
    addPiecePair(0, 2, new Bishop(p1), new Bishop(p2));
    addPiecePair(0, 3, new Queen(p1), new Queen(p2));
    addPiecePair(0, 4, new King(p1), new King(p2));
    addPiecePair(0, 5, new Bishop(p1), new Bishop(p2));
    addPiecePair(0, 6, new Knight(p1), new Knight(p2));
    addPiecePair(0, 7, new Rook(p1), new Rook(p2));
  }
  
  void addPiecePair(int r, int f, ChessPiece white, ChessPiece black) {
    // add pieces to both black and white sides using single (r,f) pair
    addPiece(r, f, white);
    addPiece(7 - r, f, black);
  }
  
  void addPiece(int r, int f, ChessPiece toAdd) {
    // add a piece to the board and set it up
    pos.pieces[r][f] = toAdd;
  }
  
  void show() {
    // on loop: display all PieceSpace tiles, chess piece included
    for(int r = 0; r < 8; r++) {
      for(int f = 0; f < 8; f++) {
        PieceSpace s = spaces[r][f];
        s.show();
      }
    }
  }
}
