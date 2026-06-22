import 'package:flutter/material.dart';
import 'infobox.dart';
import 'interestItem.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => ProfileCardState();
}

class ProfileCardState extends State<ProfileCard> {
  bool isFollowing = false;

  final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    padding: const EdgeInsets.symmetric(vertical: 14),
  );

  final ButtonStyle secondaryButtonStyle = OutlinedButton.styleFrom(
    foregroundColor: Colors.blue,
    side: const BorderSide(color: Colors.blue, width: 1.5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    padding: const EdgeInsets.symmetric(vertical: 14),
  );

  void showDetailsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("User Details"),
        content: const Text(
          "Name: John Doe\n"
              "Profession: Flutter Developer\n"
              "Email: john.doe@example.com",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          /// Profile Card
          Card(
            margin: const EdgeInsets.all(20),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage("assets/images/profile.jpg"),
                  ),
                  const SizedBox(height: 12),
                  const Text("John Doe",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 5),
                  const Text("Flutter Developer",
                      style: TextStyle(color: Colors.grey, fontSize: 16)),
                  const SizedBox(height: 12),
                  Text(
                    "Passionate about creating user-friendly and engaging digital experiences.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 12),
                  const Divider(),
                  const InfoTile(icon: Icons.email, text: "john.doe@example.com"),
                  const InfoTile(icon: Icons.phone, text: "+123 456 7890"),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() => isFollowing = !isFollowing);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(isFollowing ? "Followed!" : "Unfollowed!"),
                            ));
                          },
                          style: primaryButtonStyle,
                          child: Text(isFollowing ? "Following" : "Follow"),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => showDetailsDialog(context),
                          style: secondaryButtonStyle,
                          child: const Text("Message"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          /// Interests Heading
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text("Interests",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                ),
                Expanded(child: Divider()),
              ],
            ),
          ),
          const SizedBox(height: 15),

          /// Interest Cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: const [
                Expanded(
                  child: InterestItem(
                    title: "Travel",
                    subtitle: "Exploring new places around the world",
                    imagePath: "assets/images/travel.jpg",
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: InterestItem(
                    title: "Photography",
                    subtitle: "Capturing moments through the lens",
                    imagePath: "assets/images/camera.jpg",
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}