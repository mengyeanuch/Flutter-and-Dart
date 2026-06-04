enum Skill {Flutter, Dart, Other}

class Employee {
  String _name;
  double _baseSalary;
  List<Skill> _skills;
  Address _address;
  int _yearsOfExperience;

  Employee(
    this._name,
    this._baseSalary,
    this._skills,
    this._address,
    this._yearsOfExperience,
  );

  Employee.mobileDeveloper(
    String name,
    double baseSalary,
    Address address,
    int yearsOfExperience,
  ) : _name = name,
      _baseSalary = baseSalary,
      _skills = [Skill.Flutter, Skill.Dart],
      _address = address,
      _yearsOfExperience = yearsOfExperience;
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double computeSalary(_baseSalary) {
    double salary = _baseSalary;
    salary += _yearsOfExperience * 2000;
    for (Skill skill in _skills) {
      if (skill == Skill.Dart) {
        salary += 3000;
      }
      if (skill == Skill.Flutter) {
        salary += 5000;
      }
      if (skill == Skill.Other) {
        salary += 1000;
      }
    }
    return salary;
  }

  void printDetails() {
    print('Employee: $_name, Base Salary: \$${_baseSalary}');
  }
}

class Address {
  String _street;
  String _city;
  String _zipCode;


  Address(this._street, this._city, this._zipCode);
  String get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;

  String toString() {
    return "$_street $_city $_zipCode";
  }

}

void main() {
  Address addr = Address("Street 1", "Phnom Penh", "12000");
  var emp1 = Employee('Sokea', 40000, [Skill.Other], addr, 2);
  emp1.printDetails();
  var emp2 = Employee.mobileDeveloper('Ronan', 45000, addr, 3);
  emp2.printDetails();
}
