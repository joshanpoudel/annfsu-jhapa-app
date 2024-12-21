import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:annfsu_app/utils/constants.dart';
import 'package:annfsu_app/utils/global.colors.dart';
import 'package:annfsu_app/utils/snackbar.dart';
import 'package:annfsu_app/view/home.view.dart';
import 'package:annfsu_app/view/auth/login.view.dart';
import 'package:annfsu_app/widgets/spinner.widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  bool isRefreshing = false;

  // Define an instance of ImagePicker
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // _fetchProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.off(const HomeView());
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
          )
        ],
        backgroundColor: GlobalColors.mainColor,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 50),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  // onTap: _pickProfilePicture, // Call the image picker function
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("images/logo.png"),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Joshan Poudel",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.grey,
                      size: 15,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Text(
                        "+977-9801717454",
                        style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.underline),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Card(
                  elevation: 20,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.person, color: Colors.grey),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                titleCase("Male"),
                                style: const TextStyle(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            const Icon(Icons.location_on, color: Colors.grey),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                "Damak-03, Jhapa",
                                style: const TextStyle(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            const Icon(Icons.bloodtype, color: Colors.grey),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                "B+",
                                style: const TextStyle(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            const Icon(Icons.school, color: Colors.grey),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                "Madan Bhandari Memorial Academy Nepal",
                                style: const TextStyle(fontSize: 14),
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            const Icon(Icons.person_2, color: Colors.grey),
                            const SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                "General Member",
                                style: const TextStyle(fontSize: 14),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
