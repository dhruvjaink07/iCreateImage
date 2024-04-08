import 'package:flutter/material.dart';
import 'package:icreate_image/Model/button_data.dart';
import 'package:icreate_image/components/template_card.dart';
import 'package:icreate_image/utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.setCurrentPage});
  final Function(String) setCurrentPage;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<ButtonData> buttons = [
    ButtonData(
        gradient: const LinearGradient(
            colors: [Color(0xFF9F3AF0), Color(0xFFF6A7FF)],
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight),
        buttonText: "Video 1"),
    ButtonData(
        gradient: const LinearGradient(
            colors: [Color(0xFFFCB463), Color(0xFFF68B5D)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        buttonText: "Video 2"),
    ButtonData(
        gradient: const LinearGradient(
            colors: [Color(0xFFFF9FAE), Color(0xFFDC5572)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        buttonText: "Video 3"),
    ButtonData(
        gradient: const LinearGradient(
            colors: [Color(0xFFA1CAFF), Color(0xFF6A7EFC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        buttonText: "Video 4"),
    ButtonData(
        gradient: const LinearGradient(
            colors: [Color(0xFFBCFF5E), Color(0xFF4EBE31)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        buttonText: "Video 5"),
    ButtonData(
        gradient: const LinearGradient(
            colors: [Color(0xFFFE5209), Color.fromARGB(255, 252, 120, 72)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        buttonText: "Video 6"),
    ButtonData(
      gradient: const LinearGradient(colors: [
        Color(0xFFFF3587),
        Color(0xFFFF5DB0) // Corrected color string
      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      buttonText: "Video 7",
    ),
  ];
  bool _isListVisibleRecent = false;
  bool _isListVisiblePopular = false;
  List<String> _imageTemplates = [
    'assets/images/image.jpg',
    'assets/images/vertical.jpg',
    'assets/images/vertical2.jpg',
    // Add more image paths as needed
  ];
  late bool isPortrait;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    double gridViewHeight = screenHeight / 3; // Default height

    if (screenHeight > 500) {
      gridViewHeight = 3 *
          screenHeight /
          7; // Adjusted height if device height is more than 500
    }
    setState(() {});
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: screenHeight / 18, left: 10, right: 10),
        child: Column(children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              "icreate : $isPortrait",
              style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 32),
            ),
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              "What would you like to design today ?",
              style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          Container(
            width: screenWidth / 1.5,
            alignment: Alignment.center,
            child: const Text(
                "High quality templates to go from ideas to outstanding designs",
                textAlign: TextAlign.center,
                style: TextStyle(color: Color.fromARGB(255, 128, 126, 126))),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            height: (isPortrait)
                ? (screenHeight < 500)
                    ? screenHeight / 1.8
                    : screenHeight / 3
                : screenHeight / 2,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    isPortrait ? 2 : 3, // Adjust based on orientation
                childAspectRatio: isPortrait ? 3 : 4,
                crossAxisSpacing: 10, // Add horizontal spacing between buttons
                mainAxisSpacing: 2,
              ),
              itemCount: buttons.length +
                  1, // Increase the itemCount by 1 for the additional item
              itemBuilder: (context, index) {
                if (index == buttons.length) {
                  // Special button at the end
                  return InkWell(
                    onTap: () {
                      print("More");
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      height: isPortrait
                          ? screenHeight * 0.05
                          : screenHeight * 0.07,
                      width: isPortrait ? screenWidth * 0.4 : screenWidth * 0.3,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(
                            isPortrait ? screenHeight / 15 : screenWidth / 20),
                      ),
                      child: const Center(
                        child: Text(
                          "More",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                } else {
                  // Regular buttons with gradient
                  return InkWell(
                    onTap: () {
                      widget.setCurrentPage("/videoList");
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      height: isPortrait
                          ? (screenHeight > 500)
                              ? screenHeight * 0.07
                              : screenHeight * 0.05
                          : screenHeight * 0.9,
                      // Adjust the height based on orientation
                      width: isPortrait ? screenWidth * 0.4 : screenWidth * 0.3,
                      // Adjust the width based on orientation
                      decoration: BoxDecoration(
                        gradient: buttons[index].gradient,
                        border: Border.all(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(
                            isPortrait ? screenHeight / 15 : screenWidth / 20),
                      ),
                      child: Center(
                        child: Text(
                          buttons[index].buttonText,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                _isListVisibleRecent = !_isListVisibleRecent;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey),
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Recent used templates",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Icon(
                    _isListVisibleRecent
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: AppColors.primaryColor,
                  )
                ],
              ),
            ),
          ),
          if (_isListVisibleRecent)
            Material(
              elevation: 5,
              borderRadius:
                  BorderRadius.circular(10), // Same as container's borderRadius

              child: Container(
                width: screenWidth / 1.2,
                height: screenHeight * 0.5, // Adjust height as needed
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                child: ListView.builder(
                  itemCount: _imageTemplates.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        widget.setCurrentPage("/video_edit");
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          _imageTemplates[index],
                          fit: BoxFit
                              .contain, // Ensure the image fits within the container
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              setState(() {
                _isListVisiblePopular = !_isListVisiblePopular;
              });
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.grey),
                  borderRadius: BorderRadius.circular(25)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Most popular categories",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Icon(
                    _isListVisiblePopular
                        ? Icons.arrow_drop_up
                        : Icons.arrow_drop_down,
                    color: AppColors.primaryColor,
                  )
                ],
              ),
            ),
          ),
          if (_isListVisiblePopular)
            Material(
              elevation: 5,
              borderRadius:
                  BorderRadius.circular(10), // Same as container's borderRadius

              child: Container(
                width: screenWidth / 1.2,
                height: screenHeight * 0.4, // Adjust height as needed
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10)),
                child: ListView.builder(
                  itemCount: _imageTemplates.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        widget.setCurrentPage("/video_edit");
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          _imageTemplates[index],
                          fit: BoxFit
                              .contain, // Ensure the image fits within the container
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          TemplateCard()
        ]),
      ),
    ));
  }
}
