import 'package:flutter/material.dart';

Route navigateMapFadeIn(BuildContext context, Widget page) {
  return PageRouteBuilder(
    pageBuilder: (
      _,
      __,
      ___,
    ) =>
        page,
    transitionDuration: Duration(microseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
          child: child,
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeOut)));
    },
  );
}
