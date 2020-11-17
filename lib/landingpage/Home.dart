import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mercato/itemscreen/cart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mercato/itemscreen/sellerProfile.dart';
import 'package:mercato/landingpage/categories.dart';
import 'another.dart';
import 'package:flutter/animation.dart';
import '../AnimationRoute.dart';

Animation search;
Animation searchIcon;
Animation searchContainer;
AnimationController _animationController;

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  @override
  void initState() {
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 400));
    search = Tween(begin: 0.0,end: 150.0).animate(_animationController);
    searchIcon = Tween(begin: 0.0,end: 1.0).animate(_animationController);
    searchContainer = Tween(begin: -900.0,end: 0.0).animate(CurvedAnimation(parent:_animationController,curve: Curves.easeInOut))
    ..addListener((){
      setState(() {
        
      });
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Frame(),
    );
  }
}

class Frame extends StatefulWidget {
  Frame({Key key}) : super(key: key);

  _FrameState createState() => _FrameState();
}

class _FrameState extends State<Frame> {
  void doAnim() {
    if(_animationController.isCompleted){
                              _animationController.reverse();
                            } else if(_animationController.isDismissed){
                              _animationController.forward();
                            }else{

                            }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xF0EaEaEa),
      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      body: Stack(
              children: [Column(children: <Widget>[
          Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: SizedBox(
                    height: 100,
                    child: Row(
                      children: <Widget>[
                        Flexible(
                            flex: 4,
                            child: Align(
                                alignment: Alignment(-0.8, 0),
                                child: Text(
                                  'Mercato',
                                  style: TextStyle(
                                      fontSize: 25, fontWeight: FontWeight.bold),
                                ))),
                                Container(width: search.value, child: TextField(
                                 decoration: InputDecoration(
                                   fillColor: Color(0xbb222222),
                      filled: true,
                    
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.white)),
                      enabledBorder: UnderlineInputBorder(borderRadius: BorderRadius.circular(10)),

                                 ), 
                                )),
                        Flexible(
                            flex: 1, child: Align(child: GestureDetector(onTap: ()=>{
                              doAnim()
                            }, child: AnimatedIcon(icon:AnimatedIcons.search_ellipsis,progress: searchIcon,)))),
                        Flexible(
                            flex: 1,
                            child: Align(child: GestureDetector(onTap:()=>{
                              Navigator.push(context, AnimateCart(widget:Cart()))
                            } ,child: Icon(CupertinoIcons.shopping_cart))))
                      ],
                    )),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Container(
              height: 55,
              child: CategoryList() 
            ),
          ),
          Flexible(flex: 3, child: Carroussel()),
          Container(
            height: 20,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Flexible(
                      flex: 1,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'More',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))),
                  Icon(Icons.arrow_forward)
                ],
              ),
            ),
          ),
          Flexible(
              flex: 2,
              child: SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return bottomList(
                        title: 'Title $index',
                        subtitle: 'Subtitle $index',
                      );
                    },
                  )))
        ]),
              Positioned(
                bottom:searchContainer.value,
                left: 0,
                
                              child: GestureDetector(
                    onVerticalDragDown: (dragDownDetails) => {
                      doAnim()
                    },
                    
                  child: Container(
                        decoration: BoxDecoration( color: Color(0xdd111111),borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35))),
                        height: MediaQuery.of(context).size.height * (9/10) - 18,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Align(alignment: Alignment.centerLeft,child: Text('Result', style:TextStyle(fontSize: 22,color:Colors.white))),
                            )
                          ],
                        ),
                      ),
                  ),
              ),
              ]),
    );
    // ItCrowdPage();
  }
}

class bottomList extends StatefulWidget {
  bottomList({Key key, this.title, this.subtitle}) : super(key: key);
  final String title;
  final String subtitle;
  _bottomListState createState() => _bottomListState();
}

class _bottomListState extends State<bottomList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: GestureDetector(
              onTap: ()=>{
                Navigator.push(context, AnimateBottom(widget: sellerProlile()))
              },
              child: Container(
          height: 70,
          width: 100,
          decoration: BoxDecoration(
              color: Color(0xffcccccc),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: <Widget>[
              Flexible(
                  flex: 4,
                  child: Align(child: Icon(Icons.airline_seat_legroom_extra))),
              Flexible(flex: 2, child: Align(child: Text(widget.title))),
              Flexible(flex: 2, child: Align(child: Text(widget.subtitle))),
            ],
          ),
        ),
      ),
    );
  }
}
