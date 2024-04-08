import 'package:flutter/material.dart';
import 'package:icreate_image/utils/colors.dart';
import 'package:icreate_image/View/welcome_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;

  // Text Editing Controller
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  void login() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const WelcomePage()));
  }

  @override
  Widget build(BuildContext context) {
    // Screen Sizes
    double screenHeigth = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Container(
          height: screenHeigth,
          padding: EdgeInsets.all(screenHeigth * 0.03),
          width: screenWidth,
          color: AppColors.backgroundColor,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Hello!",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Align(
                        alignment: Alignment.center,
                        child: Text(
                            "Welcome back! Please login to your account.")),
                    const SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: RichText(
                          text: const TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "User name",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        TextSpan(
                            text: " *",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 16))
                      ])),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 5.0,
                        right: 5.0,
                      ),
                      height: 55,
                      child: TextFormField(
                        controller: userName,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Username cannot be empty';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(color: AppColors.primaryColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(color: AppColors.primaryColor),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: RichText(
                          text: const TextSpan(children: <TextSpan>[
                        TextSpan(
                            text: "Password",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16)),
                        TextSpan(
                            text: " *",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 16))
                      ])),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        left: 5.0,
                        right: 5.0,
                      ),
                      height: 55,
                      child: TextFormField(
                        controller: password,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password cannot be empty';
                          }
                          return null;
                        },
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(color: AppColors.primaryColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide:
                                BorderSide(color: AppColors.primaryColor),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                          onPressed: () {
                            print('Username : ${userName.text}');
                            print('password : ${password.text}');
                          },
                          child: const Text("Forgot Password?",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 2, 17, 235)))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7.0, left: 2.0),
                      child: Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },
                            activeColor: AppColors.primaryColor,
                            visualDensity: VisualDensity.comfortable,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                          Text(
                            'Remember Me',
                            style: TextStyle(
                              color: isChecked
                                  ? AppColors.primaryColor
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: screenHeigth / 4),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: screenHeigth / 5),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 7,
                              backgroundColor: AppColors.primaryColor,
                              padding: const EdgeInsets.only(
                                  left: 50.0,
                                  right: 50.0,
                                  top: 5.0,
                                  bottom: 5.0)),
                          onPressed: () {
                            login();
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300),
                          )),
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
