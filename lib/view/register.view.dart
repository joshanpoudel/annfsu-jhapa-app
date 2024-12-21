import 'package:annfsu_app/view/login.view.dart';
import 'package:annfsu_app/widgets/button.global.dart';
import 'package:annfsu_app/widgets/spinner.widget.dart';
import 'package:annfsu_app/widgets/text.form.global.dart';
import 'package:annfsu_app/utils/global.colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController bloodGroupController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController contactNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController collegeController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: SafeArea(
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 60),
                        const Image(
                          image: AssetImage("images/logo.png"),
                          height: 100,
                          width: 100,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "ANNFSU JHAPA",
                          style: TextStyle(
                            color: GlobalColors.mainColor,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Register an account",
                          style: TextStyle(
                            color: GlobalColors.textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Section 1: Personal Details
                                const Text(
                                  "Personal Details",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormGlobal(
                                  labelText: "Full Name",
                                  controller: fullNameController,
                                  obscure: false,
                                  text: "Full Name",
                                  textInputType: TextInputType.text,
                                ),
                                const SizedBox(height: 20),
                                TextFormGlobal(
                                  labelText: "Email",
                                  controller: emailController,
                                  obscure: false,
                                  text: 'Email',
                                  textInputType: TextInputType.emailAddress,
                                ),
                                const SizedBox(height: 20),
                                TextFormGlobal(
                                  labelText: "Password",
                                  controller: passwordController,
                                  obscure: true,
                                  text: 'Password',
                                  textInputType: TextInputType.text,
                                ),
                                const SizedBox(height: 30),

                                // Section 2: Additional Information
                                const Text(
                                  "Additional Information",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormGlobal(
                                  labelText: "Blood Group",
                                  controller: bloodGroupController,
                                  obscure: false,
                                  text: "Blood Group",
                                  textInputType: TextInputType.text,
                                ),
                                const SizedBox(height: 10),
                                TextFormGlobal(
                                  labelText: "Gender",
                                  controller: genderController,
                                  obscure: false,
                                  text: "Gender",
                                  textInputType: TextInputType.text,
                                ),
                                const SizedBox(height: 20),
                                TextFormGlobal(
                                  labelText: "Contact Number",
                                  controller: contactNumberController,
                                  obscure: false,
                                  text: "Contact Number",
                                  textInputType:
                                      const TextInputType.numberWithOptions(),
                                ),
                                const SizedBox(height: 20),
                                TextFormGlobal(
                                  labelText: "Address",
                                  controller: addressController,
                                  obscure: false,
                                  text: "Address",
                                  textInputType: TextInputType.text,
                                ),
                                const SizedBox(height: 20),
                                TextFormGlobal(
                                  labelText: "College Name",
                                  controller: collegeController,
                                  obscure: false,
                                  text: "College Name",
                                  textInputType: TextInputType.text,
                                ),
                                const SizedBox(height: 20),
                                TextFormGlobal(
                                  labelText: "Position",
                                  controller: positionController,
                                  obscure: false,
                                  text: "Position",
                                  textInputType: TextInputType.text,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        ButtonGlobal(text: "Register", onTap: () async {}),
                      ],
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
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () {
                          Get.off(() => const LoginView());
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: GlobalColors.mainColor,
                          ),
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
