class Coord {
  int x, y;
  
  Coord(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  int getX() {
    return x;
  }
  
  int getY() {
    return y;
  }
  
  boolean equals(Object o) {
     if (o instanceof Coord) {
       Coord other = (Coord) o;
        return other.getX() == this.x && other.y == this.y; 
     }
     return false;
  }
}
    
