import 'package:flutter/material.dart';

class AnimateTop extends PageRouteBuilder {
  final Widget widget;
  AnimateTop({this.widget})
      : super(
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secanimation,
                Widget child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.easeInOutQuart);
              return ScaleTransition(
                scale: animation,
                child: child,
                alignment: Alignment.topCenter,
              );
            },
            transitionDuration: Duration(milliseconds:200),
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secanimation,
            ) {
              return widget;
            });
}
class AnimateCart extends PageRouteBuilder {
  final Widget widget;
  AnimateCart({this.widget})
      : super(
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secanimation,
                Widget child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.elasticOut);
              return ScaleTransition(
                scale: animation,
                child: child,
                alignment: Alignment.topCenter,
              );
            },
            transitionDuration: Duration(milliseconds:700),
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secanimation,
            ) {
              return widget;
            });
}
class AnimateBottom extends PageRouteBuilder {
  final Widget widget;
  AnimateBottom({this.widget})
      : super(
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secanimation,
                Widget child) {
              animation = CurvedAnimation(
                  parent: animation, curve: Curves.easeInOutCubic);
              return ScaleTransition(
                scale: animation,
                child: child,
                alignment: Alignment.bottomCenter,
              );
            },
            transitionDuration: Duration(milliseconds:500),
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secanimation,
            ) {
              return widget;
            });
}
class AnimateProduct extends PageRouteBuilder {
  final Widget widget;
  AnimateProduct({this.widget})
      : super(
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secanimation,
                Widget child) {
                  animation = Tween(begin: -200.0, end:0.0).animate(CurvedAnimation(
                  parent: animation, curve: Curves.easeInOut));
              // animation = CurvedAnimation(
              //     parent: animation, curve: Curves.easeInOut);
              return Transform.translate(
                offset:Offset(animation.value, 0) ,
                // scale: animation,
                // duration: Duration(seconds: 1),
                // opacity: animation.value,
                child: child,
                // alignment: Alignment.bottomCenter,
              );
            },
            transitionDuration: Duration(milliseconds:200),
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secanimation,
            ) {
              return widget;
            });
}
