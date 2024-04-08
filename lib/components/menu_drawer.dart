import 'package:flutter/material.dart';
import 'package:icreate_image/View/login_page.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({
    Key? key,
    required this.screenHeight,
    required this.onMenuItemSelected,
  }) : super(key: key);

  final double screenHeight;
  final Function(String) onMenuItemSelected;

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10, top: 30),
                child: Align(
                  alignment: Alignment.topLeft, // Align icon to the right
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close drawer when pressed
                    },
                    icon: const Icon(
                      Icons.close_sharp,
                      color: Colors.black,
                      size: 50, // Set icon color
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: const Text(
                    "Home",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                onTap: () {
                  widget.onMenuItemSelected("/");
                },
              ),
              ListTile(
                title: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: const Text(
                    "Invitation card",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                onTap: () {},
              ),
              ListTile(
                title: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: const Text(
                    "Poster design",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                onTap: () {
                  print("Video 2");
                },
              ),
              ListTile(
                title: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: const Text(
                    "Thankyou card",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                onTap: () {
                  print("Video 3");
                },
              ),
              ListTile(
                title: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: const Text(
                    "Certificate design",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                onTap: () {
                  print("Video 4");
                },
              ),
              ListTile(
                title: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: const Text(
                    "Birthday greetings",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                onTap: () {
                  print("Video 5");
                },
              ),
              ListTile(
                title: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: const Text(
                    "Reminder card",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                onTap: () {
                  print("Video 6");
                },
              ),
              ListTile(
                title: Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: const Text(
                    "Anniversary greetings",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                onTap: () {
                  print("Video 7");
                },
              ),
            ],
          ),
          // Last element
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const LoginPage()));
            },
            child: Container(
              margin: const EdgeInsets.only(left: 30, bottom: 20),
              child: const Row(
                children: [
                  Icon(Icons.logout_outlined),
                  Text(
                    "Logout",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
