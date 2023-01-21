import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery/utils/Constants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LoginBody(),
    );
  }
}

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isLoginTrue = true;
  bool isPasswordTrue = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200.0,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/img.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  width: 56.0,
                  height: 56.0,
                  image: AssetImage("assets/images/img_burger_coffe.png"),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                SizedBox(
                  height: 56.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 4.0,
                      ),
                      Container(
                        height: 20.0,
                        width: 120.0,
                        alignment: Alignment.center,
                        child: SvgPicture.asset(
                          "assets/images/name_text.svg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              Container(
                height: 500.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/bg_image.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        // height: 48.0,
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 0.0,
                              horizontal: 5.0,
                            ),
                            errorText: isLoginTrue ? null : "Login xato",
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.blueAccent,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            labelText: 'Username',
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              loginController.text = value.toString();
                              isLoginTrue = true;
                            });
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 0.0,
                              horizontal: 5.0,
                            ),
                            errorText: isPasswordTrue ? null : "Parol xato",
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.blueAccent,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            labelText: 'Password',
                          ),
                          onChanged: (value) {
                            setState(() {
                              passwordController.text = value.toString();
                              isPasswordTrue = true;
                            });
                          },
                        ),
                      ),
                    ),
                    const Text(
                      "Forgot password?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    InkWell(
                      child: Container(
                        margin: const EdgeInsets.all(16.0),
                        width: double.infinity,
                        alignment: Alignment.center,
                        height: 48.0,
                        decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(
                            Radius.circular(24.0),
                          ),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      onTap: () {
                        if (loginController.text == Constants.LOGIN &&
                            passwordController.text == Constants.PASSWORD) {
                          Navigator.pushNamed(context, Constants.HOME_PAGE);
                        } else if (loginController.text == Constants.LOGIN &&
                            passwordController.text != Constants.PASSWORD) {
                          reloadPage(true, false);
                        } else if (loginController.text != Constants.LOGIN &&
                            passwordController.text == Constants.PASSWORD) {
                          reloadPage(false, true);
                        } else {
                          reloadPage(false, false);
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void reloadPage(bool isLogin, bool isPass) {
    setState(() {
      isLoginTrue = isLogin;
      isPasswordTrue = isPass;
    });
  }
}
