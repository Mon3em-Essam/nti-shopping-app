import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBarWidget extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).bottomNavigationBarTheme;
    final selectedColor = theme.selectedItemColor ?? const Color(0xFFFF9800);
    final unselectedColor =
        theme.unselectedItemColor ?? const Color(0xFF9E9E9E);

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed, 
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/home.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(unselectedColor, BlendMode.srcIn),
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/home.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/cart.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(unselectedColor, BlendMode.srcIn),
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/cart.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn),
          ),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/favourite.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(unselectedColor, BlendMode.srcIn),
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/favourite.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn),
          ),
          label: 'Favourite',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/icons/account.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(unselectedColor, BlendMode.srcIn),
          ),
          activeIcon: SvgPicture.asset(
            'assets/icons/account.svg',
            width: 24,
            height: 24,
            colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn),
          ),
          label: 'Account',
        ),
      ],
    );
  }
}
