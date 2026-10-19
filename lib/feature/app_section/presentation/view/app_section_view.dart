import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_shopping_app/core/di/service_locator.dart';
import 'package:nti_shopping_app/feature/account/presentation/view/screens/account_screen.dart';
import 'package:nti_shopping_app/feature/account/presentation/view_model/account_cubit.dart';
import 'package:nti_shopping_app/feature/cart/presentation/view/screens/cart_screen.dart';
import 'package:nti_shopping_app/feature/favourite/presentation/view/screens/favourite_screen.dart';
import 'package:nti_shopping_app/feature/home/presentation/view/screens/home_screen.dart';

import '../view_model/app_section_cubit.dart';
import '../view_model/app_section_state.dart';
import 'widget/bottom_nav_bar_widget.dart';

class AppSectionView extends StatelessWidget {
  AppSectionView({super.key});

  final List<Widget> screens = [
    HomeScreen(),
    CartScreen(),
    FavouriteScreen(),
    BlocProvider(
      create: (_) => serviceLocator<AccountCubit>()..getAccount(),
      child: const AccountScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppSectionCubit(),
      child: BlocBuilder<AppSectionCubit, AppSectionState>(
        builder: (context, state) {
          final cubit = AppSectionCubit.get(context);

          return Scaffold(
            body: screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavBarWidget(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
            ),
          );
        },
      ),
    );
  }
}
