import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../enums/menu_state.dart';
import '../Home/widgets/custom_nav_bar.dart';
import 'widgets/profile_horyz_bars.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<void> _picImage() async {
    final ImagePicker picker = ImagePicker();
    final LostDataResponse response = await picker.retrieveLostData();
    if (response.isEmpty) {
      return;
    }
    final List<XFile>? files = response.files;
    if (files != null) {
      // Do something with the selected image
      print('Image selected:');
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 18,
                      color: Colors.black.withOpacity(.5),
                    ),
                    const Text(
                      'Profile',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 14,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: 45),
                // Container(
                //   width: 130,
                //   height: 130,
                //   decoration: BoxDecoration(
                //     color: Colors.grey.withOpacity(.3),
                //     borderRadius: BorderRadius.circular(70),
                //   ),
                // ),
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.3),
                    borderRadius: BorderRadius.circular(70),
                    border: Border.all(color: Colors.purple, width: 1.2),
                  ),
                  child: Stack(
                    children: [
                      // Profile picture container
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.3),
                            borderRadius: BorderRadius.circular(70),
                          ),
                          child: Image.asset(
                              'assets/images/ps4_console_blue_1.png'), //just an example
                        ),
                      ),
                      // Camera icon at the bottom right
                      Positioned(
                        bottom: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: () {
                            _picImage();
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 3,
                                ),
                              ],
                            ),
                            child: const Icon(
                              Icons.camera_alt,
                              color: Colors.grey,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const ProfilaBars(
                  bareType: 'My Account',
                  myIcon: Icons.person_3_outlined,
                ),
                const SizedBox(height: 30),
                const ProfilaBars(
                    bareType: 'Notifications',
                    myIcon: Icons.notifications_none_rounded),
                const SizedBox(height: 30),
                const ProfilaBars(bareType: 'Settings', myIcon: Icons.settings),
                const SizedBox(height: 30),
                const ProfilaBars(
                    bareType: 'Help Center', myIcon: Icons.help_outline),
                const SizedBox(height: 30),
                const ProfilaBars(
                    bareType: 'Log Out', myIcon: Icons.logout_rounded),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:
          const CustomButtomNavBar(selectedMenu: MenuState.profile),
    );
  }
}
