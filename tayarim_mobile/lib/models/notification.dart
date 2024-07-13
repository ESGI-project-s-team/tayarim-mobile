class Notification {
  final int? id;
  final DateTime? date;
  final String? message;
  final String? type;
  final bool? read;

  const Notification({
    this.id,
    this.date,
    this.message,
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
