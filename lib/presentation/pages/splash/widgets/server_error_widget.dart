import 'package:flutter/material.dart';

import '../../../view_helpers/asset_paths.dart';

class ServerErrorWidget extends StatelessWidget {
  const ServerErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Image.asset(
          AssetPath.SERVER_ERROR,
          width: double.maxFinite,
        ),
      ),
    );
  }
}