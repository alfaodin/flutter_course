import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:hello_world/product_manager.dart';
import 'package:hello_world/pages/page-view/data/onboard-page-dat.dart';
import 'package:hello_world/pages/page-view/components/onboard_page.dart';
import 'package:hello_world/pages/page-view/providers/color_provider.dart';
import 'package:hello_world/pages/page-view/components/page_indicator.dart';

class IntroducctionPage extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    ColorProvider colorProvider = Provider.of<ColorProvider>(context);
    return Stack(
      children: <Widget>[
        PageView.builder(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          itemCount: onboardData.length,
          itemBuilder: (context, index) {
            return OnboardPageState(
              pageController: pageController,
              pageModel: onboardData[index],
            );
          },
        ),
        Container(
          width: double.infinity,
          height: 60,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Text(
                    'Fun with',
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(color: colorProvider.color),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 32),
                  child: InkWell(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => ProductManager(),
                          ),
                        ),
                    child: Text(
                      'Skip',
                      style: Theme.of(context)
                          .textTheme
                          .title
                          .copyWith(color: colorProvider.color),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 80.0, left: 50.0),
            child: PageViewIndicator(
              controller: pageController,
              itemCout: onboardData.length,
              color: colorProvider.color,
            ),
          ),
        )
      ],
    );
  }
}
