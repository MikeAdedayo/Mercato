
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
Animation cartIcon;
AnimationController animationController;
class Cart extends StatefulWidget {
  Cart({Key key}) : super(key: key);

  _CartState createState() => _CartState();
}

class _CartState extends State<Cart>  with SingleTickerProviderStateMixin{
@override
  void initState() {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    cartIcon = Tween(begin: 0.0, end: 1.0).animate(animationController);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
         child: Column(
           children:[
             Flexible(
               flex:3,
               child: FractionallySizedBox(
                 
                  heightFactor:1.0,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
                    child: Column( children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                        Container(
                          color: Colors.black87,
                          width: 40,
                          height: 40,
                          

                                                child: GestureDetector(
                            
                            onTap:()=>{
                              // Navigator.pop(context)
                              if(animationController.isCompleted){
                                animationController.reverse()
                              } else if(animationController.isDismissed){
                                animationController.forward()
                              }else{

                              }
                            } ,
                            child: Center(
                              child: AnimatedIcon(
                                progress: cartIcon ,
                                icon:AnimatedIcons.view_list,color: Colors.white,size: 22,),
                            ),
                          ),
                        ),
                        Container(child: Icon(Icons.delete_outline),)
                      ],),
                      SizedBox(height: 25,),
                      Align(alignment: Alignment.centerLeft, child: Text('My Cart', style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),))
                    ]),
                  ),    
                               ) ,
             ),
             Flexible(
               flex: 7,
               child: FractionallySizedBox(
                 alignment: Alignment.bottomCenter,
                 heightFactor: 1.05,
                 child: Container(
                   decoration: BoxDecoration(
                     color: Color(0xEE1a1a1a),
                     borderRadius: BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35))
                   ),
                 ),
               ) ,
             ),
             Expanded(
               flex: 2,
              //  fit: FlexFit.loose,
               child: FractionallySizedBox(
                 heightFactor: 1,
                 child: Container(
                   color: Color(0xEE1a1a1a),
                   child: Padding(
                     padding: const EdgeInsets.fromLTRB(20, 2, 20, 1),
                     child: Column(
                       children: <Widget>[
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: <Widget>[
                             Text('Total',style: TextStyle(fontSize: 13,color: Colors.white),),
                             Text('#30,000',style: TextStyle(fontSize: 20,color: Colors.white),),
                             
                           ],
                         ),
                         SizedBox(
                           height: 25,
                         ),
                         Container(
                           
                              width: double.infinity,
                              height: 50,
                           

                            child: RaisedButton(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                              color: Colors.deepOrange,
                              
                              onPressed: ()=>{

                           },
                              child: Center(child: Text('Checkout',style: TextStyle(color: Colors.white),)),
                           ),
                         )
                       ],
                     ),
                   ) ,
                 ),
               ) ,
             ),
             
             ]
           
         ),
      ),
    );
  }
}