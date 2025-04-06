class Order {
  final int id;
  final String status;
  final double total;

  Order({
    required this.id,
    required this.status,
    required this.total,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      status: json['status'],
      total: double.parse(json['total']),
    );
  }
}
