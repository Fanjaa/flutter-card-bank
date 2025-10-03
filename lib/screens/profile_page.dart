import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test_app/controller/user_controller.dart';
import 'package:test_app/util/bottom_navigation.dart';
import 'package:test_app/util/exit_app.dart';
import 'package:test_app/util/profile_header.dart';
import 'package:test_app/util/profile_info.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});
  final UserController userC = Get.put(UserController());

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final userC;

  @override
  void initState() {
    super.initState();
    userC = widget.userC; 
    userC.fetchUsers(); 
  }

  Widget build(BuildContext context) {
    int _currentIndex = 2;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (ExitAppUtil.handlePopInvoked()) {
          SystemNavigator.pop();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: SizedBox(
          height: 60,
          child: BottomNavigation(currentIndex: _currentIndex),
        ),
        body: Column(
          children: [
            // Banner atas
            ProfileHeader(),

            const SizedBox(height: 20),

            // Info card
            ProfileInfo(),

            const SizedBox(height: 20),

            // Tombol
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 0,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            // ke halaman edit profile
                            userC.fetchUsers();
                          },
                          icon: const Icon(
                            Icons.refresh_outlined,
                            color: Colors.white,
                          ),
                          label: const Text(
                            // "Edit Profile",
                            "Get Profile",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[800],
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 5,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
