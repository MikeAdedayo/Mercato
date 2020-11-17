import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
const SCALE_FRACTION = 0.5;
const FULL_SCALE = 1.0;
const PAGER_HEIGHT = 200.0;
class Top extends StatefulWidget {
  Top({Key key}) : super(key: key);
    @override
  _TopState createState() => _TopState();
}

class _TopState extends State<Top> with TickerProviderStateMixin {
  double viewPortFraction = 0.5;

  PageController pageController;

  int currentPage = 1;

  List<Map<String, String>> listOfCharacters = [{'image': "home", 'name': "Home"},
  {'image': "Settings",'name': "Settings"},
  {'image': "alarm", 'name': "Alarm"},
  ];

  double page = 2.0;
  Animation<double> _animation;
  AnimationController _animationController;
  Tween<double> _tween;
  double _angle = 0.0;
  List<Animation<double>> topanimation;
  List<AnimationController> animationControl;
  List<double> topanimation2;
  @override
  void initState() {
        animationControl = listOfCharacters.map((tab) =>AnimationController(duration: Duration(milliseconds: 10000), vsync: this) ).toList(); 
        pageController =
        PageController(initialPage: currentPage, viewportFraction: viewPortFraction);
      _animationController =
          AnimationController(duration: Duration(milliseconds: 500), vsync: this);
      _tween = Tween<double>(begin: 500.0, end: 100.0); 
      topanimation = listOfCharacters.map((item) => _tween.animate(_animationController) ).toList();
      listOfCharacters.asMap().forEach((index, value) => {topanimation[index] =  _tween.animate(animationControl[index])});
      // topanimation2 = listOfCharacters.map((tab) => 0.0).toList();
      // .animate(_animationController)).toList();
      _animation = _tween.animate(_animationController)
          ..addListener(() {
              setState(() {
                _angle =_animationController.value;
              });
          });
// print(topanimation[0].value);
super.initState();
  }
  static Matrix4 _pmat(num pv) {
    return new Matrix4(
      1.0, 0.0, 0.0, 0.0, //
      0.0, 1.0, 0.0, 0.0, //
      0.0, 0.0, 1.0, pv * 0.001, //
      0.0, 0.0, 0.0, 1.0,
    );
}

Matrix4 perspective = _pmat(1.0);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: PAGER_HEIGHT,
       child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                if (notification is ScrollUpdateNotification) {
                  setState(() {
                    page = pageController.page;
                  });
                }
              },
              child: PageView.builder(
                onPageChanged: (pos) async {
                  print(pos);

                  _animationController.reset();
                  // topanimation[pos] = _tween.animate(_animationController)
  //                 ..addListener(() {
        setState(() {currentPage = pos;
        // _animationController.forward();
        });
  //     })
  //    ..addStatusListener((status) {
  //       if (status == AnimationStatus.completed) {
  //         _animationController.reverse();
  //         // _animationController.forward();
  //         // topanimation2[pos] = topanimation[pos].value;
  //       } else if (status == AnimationStatus.dismissed) {
  //         _animationController.forward();
  //         // topanimation2[pos] = _animationController.value;
  // // topanimation2[pos] = topanimation[pos].value;
  //       }
  //     });
                  await _animationController.forward();
                    // ..whenComplete((status){

                    // })
                    
                  
                print(topanimation[pos]);
                },
                physics: BouncingScrollPhysics(),
                controller: pageController,
                itemCount: listOfCharacters.length,
                itemBuilder: (context, index) {
                  // print(topanimation[index].value);
                  // print('index $index');
                  final scale =
                      math.max(SCALE_FRACTION, (FULL_SCALE - (index - page).abs()) + viewPortFraction);
                  return AnimatedBuilder(
                      animation: _animationController,
                      builder: (context, child) => Transform.scale(
                        child: child,
                        scale: index == currentPage ? 1 : 1,
                      ),
                       child: Align(
                                                child: AnimatedContainer(
                        transform:perspective.scaled(1.0, 1.0, 1.0)
          ..rotateX(0.0)
          ..rotateY(2.0)
          ..rotateZ(0.0),
      
                        
                      duration: Duration(milliseconds: 50),
                         height: index == currentPage ? _animation.value : PAGER_HEIGHT,
                      width:  index == currentPage ? _animation.value : PAGER_HEIGHT,
                      // color:  index % 2 == 0 ? Colors.black12 : Colors.red,
                      child: Transform.translate(
                        offset: Offset(1 , 1),
                                              child: Card(
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              shape: CircleBorder(side: BorderSide(color: Colors.grey.shade200, width: 5)),
              child: Icon(Icons.access_alarms),
            ),
                      ),
                    ),
                       )
                  );
                },
              ),
            ),
    );
  }
}