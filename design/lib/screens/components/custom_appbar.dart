
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../notification_screen.dart';

class CustomAppBar {
  PreferredSizeWidget customAppBar({title = 'eAttend'}) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      forceMaterialTransparency: true,
    );
  }
}
