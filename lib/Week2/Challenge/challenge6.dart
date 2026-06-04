class Distance {

  final double _cms;
  Distance._(this._cms);

  Distance.cms(double cms) : _cms = cms;
  Distance.meters(double meters) : _cms = meters * 100;
  Distance.kms(double kms) : _cms = kms * 100000;

  double get cms => _cms;
  double get meters => _cms / 100;
  double get kms => _cms / 100000;

  Distance operator +(Distance other) {
    return Distance.cms(_cms + other._cms);
  }

  void display() {
    print("Distance:");
    print("$kms km");
    print("$meters meters");
    print("$cms cm");
  }
}
void main() {
  Distance d1 = Distance.kms(3.4);
  Distance d2 = Distance.meters(1000);
  Distance total = d1 + d2;
  print("=== Distance 1 ===");
  d1.display();
  print("=== Distance 2 ===");
  d2.display();
  print("=== Total Distance ===");
  total.display();
}
