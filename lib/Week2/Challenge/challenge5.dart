
class Passenger {
  final String name;
  final String address;
  Passenger({
    required this.name,
    required this.address,
  });
}

class City {
  final String name;
  City(this.name);
}

enum TravelClass {
  firstClass,
  business,
  economics,
}

class TravelTicket {
  final Passenger passenger;
  final City destination;
  final TravelClass classLevel;
  final String? discountCode;
  TravelTicket({
    required this.passenger,
    required this.destination,
    required this.classLevel,
    this.discountCode,
  });
}

void main() {
  Passenger p = Passenger(name: "Mengyean", address: "Phnom Penh");
  City c = City("Tokyo");
  TravelTicket ticket = TravelTicket(
    passenger: p,
    destination: c,
    classLevel: TravelClass.business,
    discountCode: "SALE20",
  );
  print(ticket.passenger.name );
}
