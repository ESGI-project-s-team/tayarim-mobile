class Notification {
  final int? id;
  final String date;
  final String message;
  final String? type;
  final bool? read;

  const Notification({
    this.id,
    required this.date,
    required this.message,
    this.type,
    this.read,
  });

  factory Notification.fromJson(Map<String, dynamic> json) {
    return Notification(
      id: json['id'],
      date: json['date'],
      message: json['message'],
      type: json['type'],
    );
  }
}
