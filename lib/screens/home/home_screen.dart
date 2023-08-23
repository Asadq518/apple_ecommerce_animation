import 'package:flutter/material.dart';

import '../../components/colors.dart';
import '../../components/style.dart';
import '../../controllers/home_controller.dart';
import '../../models/Product.dart';
import '../deatils/details_screen.dart';
import 'components/cart_details_view.dart';
import 'components/cart_short_view.dart';
import 'components/header.dart';
import 'components/product_card.dart';

class HomeScreen extends StatelessWidget {
  final controller = HomeController();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.backgroundColor,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: MyColors.backgroundColorDark,
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return LayoutBuilder(
                builder: (context, BoxConstraints constraints) {
                  return Stack(
                    children: [
                      AnimatedPositioned(
                        duration: panelTransition,
                        top: controller.homeState == HomeState.normal
                            ? headerHeight
                            : -(constraints.maxHeight -
                                cartBarHeight * 2 -
                                headerHeight),
                        left: 0,
                        right: 0,
                        height: constraints.maxHeight -
                            headerHeight -
                            cartBarHeight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: MyColors.backgroundColor,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(defaultPadding * 2.5),
                              bottomRight:
                                  Radius.circular(defaultPadding * 2.5),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(defaultPadding * 2.5),
                              bottomRight:
                                  Radius.circular(defaultPadding * 2.5),
                            ),
                            child: GridView.builder(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: defaultPadding / 2),
                              itemCount: demo_products.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 3 / 4,
                                mainAxisSpacing: defaultPadding / 2,
                                crossAxisSpacing: defaultPadding / 2,
                              ),
                              itemBuilder: (context, index) => ProductCard(
                                product: demo_products[index],
                                press: () {
                                  _openDetailScreen(
                                      context, demo_products[index]);
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Card Panel
                      AnimatedPositioned(
                        duration: panelTransition,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        height: controller.homeState == HomeState.normal
                            ? cartBarHeight
                            : (constraints.maxHeight - cartBarHeight),
                        child: GestureDetector(
                          onVerticalDragUpdate: _onVerticalGesture,
                          child: Container(
                            padding: const EdgeInsets.all(defaultPadding),
                            // color: Colors.amber,
                            alignment: Alignment.topLeft,
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 500),
                              child: controller.homeState == HomeState.normal
                                  ? CardShortView(controller: controller)
                                  : CartDetailsView(controller: controller),
                            ),
                          ),
                        ),
                      ),
                      // Header
                      AnimatedPositioned(
                        duration: panelTransition,
                        top: controller.homeState == HomeState.normal
                            ? 0
                            : -headerHeight,
                        right: 0,
                        left: 0,
                        height: headerHeight,
                        child: const HomeHeader(),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -0.7) {
      controller.changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 12) {
      controller.changeHomeState(HomeState.normal);
    }
  }

  void _openDetailScreen(BuildContext context, Product product) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        reverseTransitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(
          opacity: animation,
          child: DetailsScreen(
            product: product,
            onProductAdd: () {
              controller.addProductToCart(product);
            },
          ),
        ),
      ),
    );
  }
}
