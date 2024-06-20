import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// The root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Disable the debug banner
      home: MessagesScreen(), // Set the home screen of the app
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1C1C1E), // Set the scaffold background color
      ),
    );
  }
}

// The main screen displaying messages
class MessagesScreen extends StatelessWidget {
  final List<Message> messages = [
    Message('Danny Hopkins', 'danny@love@gmail.com', '08:42', Icons.person),
    Message('Bobby Langford', 'Will do, super, thank you 😊❤️', 'Tue', Icons.person),
    Message('William Wiles', 'Uploaded files.', 'Sun', Icons.person),
    Message('James Edelen', 'Here is another tutorial, if you need it.', '23 Mar', Icons.person),
    Message('Jose Farmer', '😃', '16 Mar', Icons.person),
    Message('Frank Marten', 'no problemy z domu przez 5...', '01 Feb', Icons.person),
    Message('Marzena Klasa', 'potem się zobaczymy', '01 Feb', Icons.person),
    Message('Shazain', 'Kutte kha ha', '28 jan', Icons.person),
  ];

  MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'), // Title of the AppBar
        backgroundColor: const Color(0xFF1C1C1E), // Background color of the AppBar
      ),
      body: Expanded(
        child: Column(
          children: [
            // Horizontal list of user avatars
            SizedBox(
              height: 101, // Fixed height for the avatars
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  UserAvatar('Barry', Icons.person),
                  UserAvatar('Perez', Icons.person),
                  UserAvatar('Alvin', Icons.person),
                  UserAvatar('Dan', Icons.person),
                  UserAvatar('Aamir', Icons.person),
                  UserAvatar('Naveed', Icons.person),
                ],
              ),
            ),
            // Expanded list of messages
            Expanded(
              child: ListView.builder(
                itemCount: messages.length, // Number of messages
                itemBuilder: (context, index) {
                  return MessageTile(messages[index]); // Create a tile for each message
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget to display user avatars
class UserAvatar extends StatelessWidget {
  final String name;
  final IconData icon;

  const UserAvatar(this.name, this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // Padding around each avatar
      child: Column(
        children: [
          CircleAvatar(
            radius: 30, // Size of the avatar
            backgroundColor: Colors.grey, // Background color of the avatar
            child: Icon(icon, size: 30, color: Colors.white), // Icon inside the avatar
          ),
          const SizedBox(height: 5),
          Text(name, style: const TextStyle(color: Colors.white)), // Name below the avatar
        ],
      ),
    );
  }
}

// Data model for messages
class Message {
  final String sender;
  final String content;
  final String time;
  final IconData icon;

  Message(this.sender, this.content, this.time, this.icon);
}

// Widget to display a single message
class MessageTile extends StatelessWidget {
  final Message message;

  const MessageTile(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Padding inside the tile
      leading: CircleAvatar(
        backgroundColor: Colors.grey, // Background color of the avatar
        child: Icon(message.icon, size: 30, color: Colors.white), // Icon inside the avatar
      ),
      title: Text(message.sender, style: const TextStyle(color: Colors.white)), // Sender's name
      subtitle: Text(message.content, style: const TextStyle(color: Colors.white54)), // Message content
      trailing: Text(message.time, style: const TextStyle(color: Colors.white54)), // Time of the message
    );
  }
}
