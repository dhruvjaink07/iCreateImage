import 'package:flutter/material.dart';
import 'package:icreate_image/utils/colors.dart';
import 'package:icreate_image/components/menu_drawer.dart';
import 'package:icreate_image/View/home_page.dart';
import 'package:icreate_image/View/profile_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String _currentPage = "/"; // Current page route

  @override
  Widget build(BuildContext context) {
    // Screen Size
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWeigth = MediaQuery.of(context).size.width;
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
              // Open drawer on icon tap
            },
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_active_outlined,
                    color: Colors.white,
                    size: 28,
                    weight: .7,
                  )),
              InkWell(
                  onTap: () {
                    setState(() {
                      _currentPage = "/profile";
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    height: 30,
                    child: Image.asset("assets/user.png"),
                  ))
            ],
          ),
        ),
        drawer: MenuDrawer(
          screenHeight: screenHeight,
          onMenuItemSelected: (String route) {
            setState(() {
              _currentPage = route; // Update current page route
            });
            Navigator.pop(context); // Close drawer
          },
        ),
        body: _buildBody());
  }

  Widget _buildBody() {
    switch (_currentPage) {
      case "/":
        return HomePage(
          setCurrentPage: setCurrentPage,
        ); // Your home page widget
      case "/profile":
        return ProfilePage(); // Your profile page widget
      // case "/videoList":
      //   return VideoListPage(
      //     setCurrentPage: setCurrentPage,
      //   );
      // Add cases for other routes if needed
      default:
        return Container(); // Empty container as default
    }
  }

  void setCurrentPage(String page) {
    setState(() {
      _currentPage = page;
    });
  }
}
