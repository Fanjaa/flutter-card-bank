import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/user_controller.dart';
import 'package:test_app/util/loading.dart';

class ProfileInfo extends StatelessWidget {
  ProfileInfo({super.key});
  final UserController userC = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (userC.isLoading.value) {
        // Tampilkan loading
        return Loading(backgroundColor: Colors.white, colorLoad: Colors.blue[800],);
      }
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.phone, color: Colors.blue[700]),
                  title: const Text("Phone"),
                  subtitle: Text(userC.phone.value),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.location_on, color: Colors.blue[700]),
                  title: const Text("Location"),
                  subtitle: Text(userC.location.value),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.location_on, color: Colors.blue[700]),
                  title: const Text("Date of birth"),
                  subtitle: Text(userC.dateOfBirth.value),
                ),
                const Divider(),
                ListTile(
                  leading: Icon(Icons.work, color: Colors.blue[700]),
                  title: const Text("Job"),
                  subtitle: Text("Software Engineer"),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
