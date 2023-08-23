import 'package:flutter/material.dart';

import '../../../components/style.dart';
import '../../../models/Product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);

  final Product product;

  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(defaultPadding * .5),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: product.id,
              child: Image.asset(
                product.image,
                height: 130,
              ),
            ),
            10.ph,
            Text(
              '\$ 500.0',
              style: theme.headlineLarge,
            ),
            Text(
              product.title,
              style: theme.headlineSmall!.copyWith(fontSize: 16),
            ),
            Text(
              "500G Silver",
              style: theme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
