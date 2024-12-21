import 'package:annfsu_app/view/home.view.dart';
import 'package:annfsu_app/view/members/memberProfile.view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:annfsu_app/utils/global.colors.dart';

class MembersView extends StatefulWidget {
  const MembersView({Key? key}) : super(key: key);

  @override
  State<MembersView> createState() => _MembersViewState();
}

class _MembersViewState extends State<MembersView> {
  final List<Map<String, String>> members = [
    {
      "name": "John Doe",
      "position": "President",
      "phoneNumber": "+977-9801111111",
      "location": "Kathmandu, Nepal",
      "bloodGroup": "O+",
      "organization": "Tribhuvan University",
    },
    {
      "name": "Jane Smith",
      "position": "Secretary",
      "phoneNumber": "+977-9802222222",
      "location": "Lalitpur, Nepal",
      "bloodGroup": "A+",
      "organization": "Kathmandu University",
    },
    {
      "name": "Michael Johnson",
      "position": "Treasurer",
      "phoneNumber": "+977-9803333333",
      "location": "Pokhara, Nepal",
      "bloodGroup": "B+",
      "organization": "Pokhara University",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Members"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.off(() => const HomeView());
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        backgroundColor: GlobalColors.mainColor,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage:
                    AssetImage("images/logo.png"), // Placeholder image
                radius: 25,
              ),
              title: Text(
                member['name']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(member['position']!),
              onTap: () {
                Get.to(() => MemberProfileView(
                      name: member['name']!,
                      position: member['position']!,
                      phoneNumber: member['phoneNumber']!,
                      location: member['location']!,
                      bloodGroup: member['bloodGroup']!,
                      organization: member['organization']!,
                    ));
              },
            ),
          );
        },
      ),
    );
  }
}
