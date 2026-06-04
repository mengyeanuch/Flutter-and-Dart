import 'dart:io';

class Point {
  final int x, y;
  Point(this.x, this.y);
  void printPoint() {
    print("Point: x=$x, y=$y");
  }

  void translate(int dx, int dy) {
    int newx = 0;
    int newy = 0;
    newx = x + dx;
    newy = y + dy;
    print("After translated: x=$newx, y=$newy");
  }
}

List<int> inputTwoNum(String message) {
  List<int> num = [];
  while (true) {
    print(message);
    num = stdin
        .readLineSync()!
        .split(' ')
        .where((e) => e.isNotEmpty)
        .map(int.parse)
        .toList();
    if (num.length == 2) {
      return num;
    }
    print("Invalid input.Please enter only 2 integers");
  }
}

void main() {
  List<int> originalPoint = inputTwoNum("Enter x and y seperated by space:");
  Point p = Point(originalPoint[0], originalPoint[1]);
  List<int> translationPoint = inputTwoNum(
    "Enter dx and dy seperated by space:",
  );
  p.printPoint();
  p.translate(translationPoint[0], translationPoint[1]);
}
