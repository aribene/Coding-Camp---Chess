class PieceMover {
  Player p1, p2;
  PieceSpace[][] spaces;
  Player turn;
  PieceSpace selected;
  
  PieceMover(Player p1, Player p2, PieceSpace[][] s) {
    this.p1 = p1;
    this.p2 = p2;
    spaces = s;
    turn = p1;
  }
  
  void update() { 
    
    
    PieceSpace hovered = null;    
    outer: for(int r = 0; r < 8; r++) {
      for(int c = 0; c < 8; c++) {
        PieceSpace s = spaces [r][c];
        if(s.square.isHovered()) {
          //found hovered square
          if(s.piece != null && s.piece.owner == turn) {
            // piece on same team
            hovered = s;
            if(s.square.isClicked()) {
              if(s == selected) selected = null; // unselected
              else selected = s; // selected
            }
          } else if(selected != null && s.square.isClicked()) {
            // trying to move, check if valid move
            ArrayList<MoveSpace> moves = selected.piece.getLegalMoves();
            for(MoveSpace move : moves) {
              if(move.space == s) {
                //valid move
                movePiece(selected, s);
                s.piece.setPos(r, c);
                selected = null;                
                switchPlayer();
                return;
              }
            }
          }
           break outer; // stop searching
        }
      }
    }
    
    PieceSpace showMoveSpace = null;
    if(selected != null) {
        showMoveSpace = selected;
    } else if(hovered != null) {
      showMoveSpace = hovered;      
    }
      
    if(showMoveSpace != null) {
      ArrayList<MoveSpace> arr = showMoveSpace.piece.getLegalMoves();
      for(MoveSpace  m : arr) {
        PVector v = m.space.square.center;
        pushStyle();
          if(m.isTake) fill(255, 255, 30);
          else fill(70, 70, 255);
          stroke(0, 43, 32);
          strokeWeight(2);              
          circle(v.x, v.y, 13);
        popStyle();
      }
    }
    if(selected != null) {
      selected.show(color(2, 2, 255));
    }
  }
  
  void movePiece(PieceSpace from, PieceSpace to) {
      to.piece = from.piece;
      from.piece = null;
      from = null;
  }
  
  void switchPlayer() {
    if(turn == p1) turn = p2;
    else turn = p1;
  }
}
