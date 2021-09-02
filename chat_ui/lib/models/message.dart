import 'package:chat_ui/models/user.dart';

class Message {
  final User sender;
  final String time;
  final String text;
  final bool isLiked;
  final bool unread;
  Message({
    required this.sender,
    required this.time,
    required this.text,
    required this.isLiked,
    required this.unread,
  });
}

// Me
final User currentUser =
    User(id: 0, name: "Saurav", imageUrl: "assets/images/grey.jpeg");
final User jordan =
    User(id: 1, name: "Jordan", imageUrl: "assets/images/jordan.jpeg");
final User mia = User(id: 1, name: "Mia", imageUrl: "assets/images/mia.jpeg");
final User samantha =
    User(id: 2, name: "Samantha", imageUrl: "assets/images/samantha.jpeg");
final User tina =
    User(id: 3, name: "Tina", imageUrl: "assets/images/tina.jpeg");

// FAVORITE CONTACTS
List<User> favorites = [jordan, mia, samantha, tina];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sender: jordan,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: mia,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
  Message(
    sender: samantha,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: false,
  ),
  Message(
    sender: tina,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    isLiked: false,
    unread: true,
  ),
];
