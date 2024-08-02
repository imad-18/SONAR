// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../enums/menu_state.dart';

class CustomButtomNavBar extends StatelessWidget {
  final MenuState selectedMenu;
  
  const CustomButtomNavBar({
    super.key,
    required this.selectedMenu,
  });

  @override
  Widget build(BuildContext context) {
    const Color inActiveIconColor = Color.fromARGB(255, 239, 239, 239);
    
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: const BoxDecoration(
        color: Color(0xff4a3298),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              icon: SvgPicture.asset(
                'assets/icons/Shop Icon.svg',
                color: MenuState.home == selectedMenu
                    ? const Color(0xfff77546)
                    : inActiveIconColor,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/onb_scr');
              },
              icon: SvgPicture.asset('assets/icons/Heart Icon.svg',
                color: MenuState.favourite == selectedMenu
                    ? const Color(0xfff77546)
                    : inActiveIconColor,),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/Chat bubble Icon.svg',
                color: MenuState.message == selectedMenu
                    ? const Color(0xfff77546)
                    : inActiveIconColor,),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              icon: SvgPicture.asset('assets/icons/User Icon.svg',
                
                color: MenuState.profile == selectedMenu
                    ? const Color(0xfff77546)
                    : inActiveIconColor,),
            ),
          ],
        ),
      ),
    );
  }
}
