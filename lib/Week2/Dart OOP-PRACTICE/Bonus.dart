enum DeliveryType { delivery, pickup }

class Product {
  final String _name;
  final double _price;

  Product(this._name, this._price);
  String get name => _name;
  double get price => _price;
}
class OrderItem {
  final Product _product;
  final int _quantity;

  OrderItem(this._product, this._quantity);
  Product get product => _product;
  int get quantity => _quantity;
  double get totalPrice {
    return _product.price * _quantity;
  }
}
class Address {
  final String _street;
  final String _city;

  Address(this._street, this._city);
  String get street => _street;
  String get city => _city;
}
class Order {
  final int _id;
  final List<OrderItem> _items;
  final DeliveryType _deliveryType;
  final Address? _address;

  Order(this._id, this._items, this._deliveryType, {Address? address})
    : _address = address;

  int get id => _id;
  List<OrderItem> get items => _items;
  DeliveryType get deliveryType => _deliveryType;
  Address? get address => _address;

  double getTotalAmount() {
    double total = 0;
    for (OrderItem item in _items) {
      total += item.totalPrice;
    }

    return total;
  }
  void printOrder() {
    print("Order ID: $_id");
    for (OrderItem item in _items) {
      print("${item.product.name} x${item.quantity}");
    }
    print("Total: \$${getTotalAmount()}");
    print("Delivery Type: $_deliveryType");
    if (_deliveryType == DeliveryType.delivery && _address != null) {
      print("Address: ${_address.street}, ${_address.city}");
    }
  }
}

void main() {
  Product laptop = Product("Laptop", 1200);
  Product mouse = Product("Mouse", 25);
  OrderItem item1 = OrderItem(laptop, 1);
  OrderItem item2 = OrderItem(mouse, 2);
  Address address = Address("Street 1", "Phnom Penh");
  Order order = Order(
    1001,
    [item1, item2],
    DeliveryType.delivery,
    address: address,
  );
  order.printOrder();
}
