import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
class Carroussel extends StatefulWidget {
  @override
  _CarrousselState createState() => new _CarrousselState();
}

class _CarrousselState extends State<Carroussel> with SingleTickerProviderStateMixin {
  PageController controller;
  int currentpage = 0;
  Animation<double> _animation;
  AnimationController _animationController;
  Tween<double> _tween;
  double interpolate = ((1-0)/(0-1));
  @override
  initState() {
    super.initState();
    controller = new PageController(
      initialPage: currentpage,
      keepPage: false,
      viewportFraction: 0.5,
    );
    _animationController = AnimationController(
      duration: const Duration(microseconds: 1),
      vsync: this,
   )..repeat();
    
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _animationController = AnimationController(vsync: _CarrousselState(), duration: Duration(seconds: 2) );
    
    // _animation = Tween( end: 50.0, begin: 0.0,).animate(_animationController);
    
    return  new Center(
        child: new Container(
          height: 300,
          width: 400,
          child: new PageView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
              onPageChanged: (value) {
                // _animationController.animateTo(2.0);
                // setState(() {
                  currentpage = value;
                // });
                // _animationController.animateBack(0.0);
              },
              controller: controller,
              itemBuilder: (context, index) => builder(index)),
        ),
      );
  }

  builder(int index) {
    double value = 1.0;
        double value2 = 0.0;
    return new AnimatedBuilder(
      
      animation: _animationController,
      builder: (context, child) {
        
        if (controller.position.haveDimensions) {
          // print(index);
          // print('index is $index and controller is');
          // print(controller.page);
          value = controller.page - index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
          value2 = 0 + (value - 1) * interpolate;
          // print(value2);
        }

        return Transform.rotate(
            angle:  index != currentpage ? index > currentpage ? Curves.easeInOut.transform(value2) * 0.2 : Curves.easeInOut.transform(value2) * -0.2 :  value2/6 ,
                  child: Center(
                    
            child: new SizedBox(
              height: Curves.easeOut.transform(value) * 300,
              width: Curves.easeOut.transform(value) * 250,
              child: child,
            ),
          ),
        );
      },
      child: new Container(
        decoration: BoxDecoration(boxShadow: [BoxShadow(blurRadius: 15,color: Color(0xbb888888),offset: Offset(-2, 2))], color: index % 2 == 0 ? Colors.blue : Colors.red,borderRadius: BorderRadius.all(Radius.circular(1)) ),
        child: Text('$index'),
        margin: const EdgeInsets.all(8.0),
        
      ),
    );
  }
}
