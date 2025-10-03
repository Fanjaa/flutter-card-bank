import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/user_controller.dart';
import 'package:test_app/util/loading.dart';

class ProfileHeader extends StatelessWidget {
  ProfileHeader({super.key});
  final UserController userC = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (userC.isLoading.value) {
        // Tampilkan loading
        return Loading(backgroundColor: Colors.blue[800], colorLoad: Colors.transparent,);
      }
      return Container(
        height: 270,
        width: double.infinity,
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   colors: [Colors.blue[800]!, Colors.blue[400]!],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
          color: Colors.blue[800],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                // "https://reqres.in/img/faces/1-image.jpg",
                userC.profilePicture.value,
              ),
            ),
            SizedBox(height: 12),
            Text(
              // "Fanjaa",
              userC.fullName.value,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              userC.email.value,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),

            SizedBox(height: 40),
          ],
        ),
      );
    });
  }
}
