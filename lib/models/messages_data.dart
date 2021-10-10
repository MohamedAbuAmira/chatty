import 'package:meta/meta.dart';

@immutable
class MessageData {
  final String senderName;
  final String message;
  final String profilePicture;
  final String dateMessage;
  final DateTime messageDate;

  const MessageData(
      {required this.senderName,
      required this.message,
      required this.profilePicture,
      required this.dateMessage,
      required this.messageDate});
}
