import 'package:flutter/material.dart';

class FadePageRouteBuilder<T> extends PageRouteBuilder<T> {
  final WidgetBuilder builder;
  @override
  final RouteSettings settings;

  FadePageRouteBuilder({
    required this.builder,
    required this.settings,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => builder(context),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 300),
          settings: settings,
        );
}
