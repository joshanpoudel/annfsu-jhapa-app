import 'package:annfsu_app/utils/global.colors.dart';
import 'package:annfsu_app/view/home.view.dart';
import 'package:annfsu_app/view/register.view.dart';
import 'package:annfsu_app/widgets/button.global.dart';
import 'package:annfsu_app/widgets/spinner.widget.dart';
import 'package:annfsu_app/widgets/text.form.global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool isLoading = false;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        padding: const EdgeInsets.only(top: 100),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Center(
                              child: Image(
                                image: AssetImage("images/logo.png"),
                                height: 150,
                                width: 150,
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                "ANNFSU JHAPA",
                                style: TextStyle(
                                    color: GlobalColors.mainColor,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Text(
                                "Login to your account",
                                style: TextStyle(
                                    color: GlobalColors.textColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormGlobal(
                              controller: usernameController,
                              obscure: false,
                              labelText: "Username",
                              text: "Username",
                              textInputType: TextInputType.text,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextFormGlobal(
                              controller: passwordController,
                              obscure: true,
                              labelText: "Password",
                              text: "Password",
                              textInputType: TextInputType.text,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            ButtonGlobal(
                              text: "Login",
                              onTap: () async {
                                Get.off(() => const HomeView());
                              },
                            ),
                            const SizedBox(height: 10),
                            // TextButton(
                            //   onPressed: () {
                            //     // Get.to(() => const SetBaseUrlView());
                            //   },
                            //   child: const Text("Set Base URL"),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (!isLoading)
                Container(
                  height: 50,
                  color: Colors.white,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      InkWell(
                        onTap: () {
                          Get.to(() => const RegisterView());
                        },
                        child: Text(
                          " Signup",
                          style: TextStyle(
                              color: GlobalColors.mainColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
          if (isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: ModernSpinner(
                  color: GlobalColors.mainColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
