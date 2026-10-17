import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_shopping_app/core/di/service_locator.dart';
import 'package:nti_shopping_app/core/theme/app_colors.dart';
import 'package:nti_shopping_app/feature/cart/domain/entities/cart_entity.dart';
import 'package:nti_shopping_app/feature/cart/presentation/view/widget/cart_item.dart';
import 'package:nti_shopping_app/feature/cart/presentation/view_model/cart_get_cubit/cart_get_cubit.dart';
import 'package:nti_shopping_app/feature/cart/presentation/view_model/cart_get_cubit/cart_get_intent.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartGetCubit>(
      create: (context) =>
          serviceLocator<CartGetCubit>()..intent(CartGetAllItems()),
      child: _CartScreenBody(),
    );
  }
}

class _CartScreenBody extends StatelessWidget {
  const _CartScreenBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Cart')),
      body: Center(
        child: BlocBuilder<CartGetCubit, CartGetState>(
          builder: (context, state) {
            if (state is CartGetSuccess) {
              List<CartEntity> data = state.cartItems;
              data = [CartEntity()];
              if (data.isEmpty) {
                return Column(
                  mainAxisAlignment: .center,
                  children: [
                    Image.asset('assets/icons/cart_icon.png'),
                    SizedBox(height: 8),
                    Text(
                      "your cart is empty",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                );
              } else {
                return Padding(
                  padding: EdgeInsets.all(16),
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) => CartItem(
                      productId: data[index].productId,
                      productName: data[index].productName,
                      currPrice: data[index].currPrice,
                      prevPrice: data[index].prevPrice,
                      image: data[index].image,
                    ),
                  ),
                );
              }
            } else if (state is CartGetError) {
              return Center(
                child: Text(
                  state.errorMsg,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              );
            }
            return CircularProgressIndicator(color: AppColors.orangeLight);
          },
        ),
      ),
    );
  }
}
