import 'package:flutter/material.dart';

import 'package:gradient_widgets/gradient_widgets.dart';

import '../../../view_helpers/asset_paths.dart';
import '../../../view_helpers/text_values.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Spacer(flex: 2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AssetPath.LOGO,
                  width: 240,
                ),
                const SizedBox(height: 20),
                const Text(TextValue.SLOGAN, textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
              ],
            ),
            const Spacer(flex: 2),
            GradientProgressIndicator(
              gradient: Gradients.taitanum,
              value: 0.65,
            ),
            const Spacer(flex: 1),
          ],
        ),
      ),
    );
  }
}