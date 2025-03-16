class Message {
  final String message;
  final bool isUser;
  final bool isLoading;

  Message(
      {required this.message, required this.isUser, this.isLoading = false});
}
