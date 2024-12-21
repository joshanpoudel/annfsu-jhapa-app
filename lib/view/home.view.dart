// ignore_for_file: avoid_print

import 'dart:async';

import 'package:annfsu_app/utils/constants.dart';
import 'package:annfsu_app/utils/dialog.dart';
import 'package:annfsu_app/utils/global.colors.dart';
import 'package:annfsu_app/utils/snackbar.dart';
import 'package:annfsu_app/view/auth/login.view.dart';
import 'package:annfsu_app/view/members/members.view.dart';
import 'package:annfsu_app/view/profile.view.dart';
import 'package:annfsu_app/widgets/profile.widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    super.initState();
    // Timer(const Duration(seconds: 1), fetchProfile);
  }

  // Future<void> fetchProfile() async {
  //   final profile = await ProfileAPIService().getProfile();
  //   if (profile is Profile) {
  //     setState(() {
  //       _profile = profile;
  //     });
  //   } else {
  //     Get.off(() => const ProfileCreateView());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard", style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: () async {
              SharedPreferences pref = await prefs;

              showConfirmationDialog("Are you sure you want to logout?", () {
                pref.remove("accessToken");
                Get.offAll(() => const LoginView());
                generateSuccessSnackbar("Success", "Logged out successfully!");
              });
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.dark_mode,
            color: Colors.white,
          ),
          onPressed: () => {
            generateErrorSnackbar(
                "Unimplemented", "Feature not implemented yet!")
          },
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: GlobalColors.mainColor,
      ),
      body: WillPopScope(
          onWillPop: () => _onBackButtonPressed(context),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            height: MediaQuery.of(context).size.height,
            color: Colors.grey.shade300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 140,
                  color: Colors.transparent,
                  child: const ProfileWidget(
                    firstName: "Joshan Poudel",
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      getExpanded("profile", "Profile", "View Profile", () {
                        Get.to(() => const UserProfileView());
                      }),
                      getExpanded("members", "Members", "View Members", () {
                        Get.to(() => const MembersView());
                      }),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      getExpanded("blood", "Blood Donors", "View Blood Donors",
                          () {
                        // Get.to(() => const UserProfileView());
                      }),
                      getExpanded("about", "About Us", "Our Info", () {})
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  _onBackButtonPressed(BuildContext context) async {
    bool exitApp = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Confirmation"),
            content: const Text("Do you want to close the app?"),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: const Text(
                    "No",
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                onPressed: () {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
                child: const Text(
                  "Yes",
                ),
              ),
            ],
          );
        });

    return exitApp;
  }
}
