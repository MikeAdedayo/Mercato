import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'itemcard.dart';
  Animation animation;
  Animation textanimation;
  Animation middleanimation;
  // Animation animation;
  AnimationController animationController;
  Tween<double> tween;
class sellerProlile extends StatefulWidget {


  sellerProlile({Key key}) : super(key: key);

  _sellerProlileState createState() => _sellerProlileState();
}

class _sellerProlileState extends State<sellerProlile> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    // double widthsize = MediaQuery.of(context).size.width;
    animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 1800));
    textanimation = Tween<double>(begin:-170,end:30 ).animate( CurvedAnimation( curve: 
    Interval(0.6, 1.0, curve:
     Curves.easeOutQuart), parent:animationController));
    middleanimation = Tween<double>(begin:1,end:0.4 ).animate( CurvedAnimation( curve: 
    Interval(0.3, 0.6, curve:
     Curves.easeOutQuart), parent:animationController));
    
    animation =Tween(begin: 150.0, end: 0.0).animate(
      CurvedAnimation(curve:Interval(0.1,0.6, curve:Curves.easeOutQuart) ,parent: animationController)
      )
    ..addListener((){
      setState(() {
        
      });
    });
    animationController.forward();
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        height: MediaQuery.of(context).size.height,
        // height: MediaQuery.of(context).size.height,
         color: Color(0xcc88888888),
         child:
         
        //  Container(color: Colors.red,height: MediaQuery.of(context).size.height, ) 
         Stack(
           children: <Widget>[

             Container(
               height: MediaQuery.of(context).size.height,
               child: Column(

               children: <Widget>[
                 Flexible(
                                  child: FractionallySizedBox(
                     heightFactor:1.1,
                     widthFactor: 1,
                     child: Container(
                       color: Colors.amberAccent,child: Icon(Icons.business))
                      //  child: Icon(Icons.business,)
                      //  child: Icon(Icons.business,))
                   ),
                 ),
                 Flexible(
                                  child: FractionallySizedBox(
                     heightFactor: 1.1,
                     widthFactor: 1,
                    //  child: Container(color: Colors.redAccent,),
                     child: Transform.translate(
                       offset: Offset(0, animation.value),
                                          child: Container(
                        //  height: 200,
                        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35))),
                        child: Column(
                           children: <Widget>[
                             SizedBox(height: 60,),
                             Padding(
                               padding: const EdgeInsets.all(15.0),
                               child: Align(alignment:Alignment.centerLeft ,child: Text('Top Products')),
                             ),
                             Flexible(
                               flex: 1,
                                                        child: ListView.builder(

                                 itemCount: 10,
                                 scrollDirection: Axis.horizontal,
                                 itemBuilder: (context,index){
                                   return  itemCard();
                                 },
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ),
                 )
               ],
             )),
             Positioned(right: 0, top: (MediaQuery.of(context).size.height/2) - 50 ,
              child:Container(height:60,decoration:
               BoxDecoration(boxShadow: [BoxShadow(blurRadius: 15,color: Color(0xcc888888),offset: Offset(-2, 2))], color: Colors.black87, borderRadius: BorderRadius.only(topLeft: Radius.circular(5),bottomLeft: Radius.circular(5))),width: MediaQuery.of(context).size.width * middleanimation.value,),),
             Positioned(top:60, left: textanimation.value, child: Container(child:Text('Welcome',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),)),)
           ],
         ),
      ),
    );
  }
}