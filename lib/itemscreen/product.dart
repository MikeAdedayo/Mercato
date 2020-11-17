import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

Animation<double> productImage;
Animation productInfo1;
Animation productInfo2;
Animation productInfo3;
Animation productDetail1;
Animation productDetail2;
Animation productDetail3;
Animation<double> progressIcon;
AnimationController animationController;

class Product extends StatefulWidget {
  Product({Key key}) : super(key: key);

  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    progressIcon = Tween<double>(begin: 0.1, end: 1).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.1, 0.9, curve: Curves.easeInCirc)));
    productImage = Tween<double>(begin: 0.1, end: 1).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.1, 0.4, curve: Curves.easeInCirc)));
    productInfo1 = Tween<double>(begin: 0.2, end: 1).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.3, 0.65, curve: Curves.elasticInOut)));
    productInfo2 = Tween<double>(begin: 0.2, end: 1).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.4, 0.75, curve: Curves.elasticInOut)));
    productInfo3 = Tween<double>(begin: 0.2, end: 1).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.6, 0.95, curve: Curves.elasticInOut)));
    productDetail1 = Tween<double>(begin: -200, end: 0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.6, 0.9, curve: Curves.easeInOutSine)));
    productDetail2 = Tween<double>(begin: -150, end: 0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.7, 0.9, curve: Curves.easeInCirc)));
    productDetail3 = Tween<double>(begin: 0.2, end: 1).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1.0, curve: Curves.easeInCirc)))
      ..addListener(() {
        setState(() {});
      });
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        ScaleTransition(
                          scale: productImage,
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            height: MediaQuery.of(context).size.height / 1.7,
                            decoration: BoxDecoration(
                                color: Color(0xFFcccccc),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50))),
                          ),
                        ),
                        Positioned(
                          bottom: 30,
                          left: 60,
                          right: 60,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                ScaleTransition(
                                  scale: productInfo1,
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0x77EEEEEE),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text('COLOR'),
                                            Icon(
                                              Icons.stop,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ScaleTransition(
                                  scale: productInfo2,
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0x77EEEEEE),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text('PRICE'),
                                            Text("#90"),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ScaleTransition(
                                  scale: productInfo3,
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Color(0x77EEEEEE),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text('COLOR'),
                                            Icon(
                                              Icons.stop,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Transform.translate(
                            offset: Offset(productDetail1.value, 0),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Relaxed',
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(productDetail2.value, 0),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text('Grandad Shirt',
                                    style: TextStyle(fontSize: 19))),
                          ),
                          // SizedBox(height: 15,),
                          Opacity(
                            opacity: productDetail3.value,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                                child: Ink(
                                  child: Text('BUY NOW',
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.deepPurple)),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                height: 8,
                                width: 40,
                                child: Container(
                                  color: Color(0xCC775555),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text('4.5', style: TextStyle(fontSize: 16)),
                                  Icon(Icons.star)
                                ],
                              ),
                              
                            ],
                          ),
                          Transform.translate(
                      offset: Offset(productDetail1.value, 0),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('hello stock discription')),
                    )
                        ],
                      ),
                    ),
                    
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Row(
                  children: <Widget>[
                    Container(
                        width: 60,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(25))),
                        child: Icon(
                          CupertinoIcons.heart_solid,
                          color: Colors.white,
                        )),
                    Container(
                        width: 60,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(25))),
                        child: Center(
                          child: AnimatedIcon(icon:AnimatedIcons.event_add,
                              progress: progressIcon,
                              color: Colors.white),
                        ))
                  ],
                ),
              )
            ],
          )),
    );
  }
}
