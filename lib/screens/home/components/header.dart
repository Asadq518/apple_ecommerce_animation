import 'package:flutter/material.dart';

import '../../../components/colors.dart';
import '../../../components/style.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: headerHeight,
      color: MyColors.backgroundColor,
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.arrow_back_ios_new_rounded),
          Text(
            'Apple Store',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const Icon(Icons.stacked_bar_chart_rounded),
        ],
      ),
    );
  }
}
