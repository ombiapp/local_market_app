class Message {
  final String id;
  final String sender;
  final String text;
  final DateTime createdAt;

  Message({
    required this.id,
    required this.sender,
    required this.text,
    required this.createdAt,
  });
}
