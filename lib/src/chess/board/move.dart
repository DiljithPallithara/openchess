class Move {
  int previousCoordinate;
  int newCoordinate;

  Move({
    this.previousCoordinate,
    this.newCoordinate,
  });

  int getPreviousCordinate() {
    return previousCoordinate;
  }

  int getNewCoordinate() {
    return newCoordinate;
  }

}
