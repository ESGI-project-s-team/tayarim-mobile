class House {
  final int id;
  final String name;
  final String address;
  final String imageUrl;
  final String price;
  final String type;
  final String status;
  final String createdAt;
  final String updatedAt;

  House({
    required this.id,
    required this.name,
    required this.address,
    required this.imageUrl,
    required this.price,
    required this.type,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory House.fromJson(Map<String, dynamic> json) {
    return House(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      imageUrl: json['imageUrl'],
      price: json['price'],
      type: json['type'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}