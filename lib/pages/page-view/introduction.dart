import 'package:flutter/material.dart';
import 'package:hello_world/pages/page-view/components/onboard_page.dart';
import 'package:hello_world/pages/page-view/data/onboard-page-dat.dart';

class IntroducctionPage extends StatelessWidget {
  const IntroducctionPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        PageView.builder(
          itemCount: onboardData.length,
          itemBuilder: (context, index) {
            return OnboardPageState(
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
                        .copyWith(color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 32),
                  child: Text(
                    'Skip',
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
