import 'dart:io';
import 'challenge1.dart';

// Challenge2
class Rectangle {
  Point topLeft;
  Point bottomRight;
  Rectangle(this.topLeft, this.bottomRight);

  int get width => (bottomRight.x - topLeft.x).abs();
  int get height => (topLeft.y - bottomRight.y).abs();
  int get area => width * height;

  String toString() {
    return "My rectangle is\nTop left $topLeft\nBottom right  $bottomRight\nWidth: $width\nHeight: $height\nArea: $area";
  }
}

// Challenge3
class Person {
  String firstName, lastName;
  Person(this.firstName, this.lastName);
  String get fullName => "$firstName $lastName";
}

void main() {
  // Challenge2
  List<int> topPoint = inputTwoNum("Enter top left:");
  List<int> bottomPoint = [];
  while (true) {
    bottomPoint = inputTwoNum("Enter bottom right:");
    if (bottomPoint[0] > topPoint[0] && bottomPoint[1] < topPoint[1]) {
      break;
    }
    print("Invalid. Please enter bottom point coordinator:");
  }
  Point topLeft = Point(topPoint[0], topPoint[1]);
  Point bottomRight = Point(bottomPoint[0], bottomPoint[1]);
  Rectangle rect = Rectangle(topLeft, bottomRight);
  print(rect);
  //Challenge3
}
