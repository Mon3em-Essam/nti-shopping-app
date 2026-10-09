import 'package:flutter/material.dart';
import 'package:nti_shopping_app/core/widgets/product_item_card.dart';
import 'package:nti_shopping_app/feature/home/presentation/view/widget/category_item.dart';
import 'package:nti_shopping_app/feature/home/presentation/view/widget/home_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: Column(
            spacing: 15,
            crossAxisAlignment: .start,
            children: [
              HomeHeader(),
              CategoriesWidget(),
              Expanded(
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.55,
                  ),
                  itemBuilder: (context, index) {
                    return ProductItemCard(
                      onTap: () {},
                      title: "title",
                      discount: 10,
                      price: 50,
                      rating: 5,
                      image:
                          "https://cdn.dummyjson.com/product-images/fragrances/gucci-bloom-eau-de/2.webp",
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*
ProductItemCard(
              onTap: () {},
              title: "title",
              discount: 10,
              price: 50,
              rating: 5,
              image: "",
            ),
*/
