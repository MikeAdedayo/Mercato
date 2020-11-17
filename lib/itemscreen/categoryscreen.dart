import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mercato/AnimationRoute.dart';
import 'package:mercato/itemscreen/itemcard.dart';
import 'package:mercato/itemscreen/product.dart';

class Category extends StatefulWidget {
  String categoryTitle;
  Category({Key key, this.categoryTitle}) : super(key: key);

  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white70, title: Text(widget.categoryTitle),centerTitle:true),
          backgroundColor: Color(0xfff1f1f1),
          body: Container(
        height: MediaQuery.of(context).size.height,
         child: StreamBuilder(
           stream: Firestore.instance.collection('Categories/wlO6QlYCOfrARBJSOd60/${widget.categoryTitle}').snapshots(),
           builder: (context, snapshot) {
            
             if (!snapshot.hasData) return const Text('Loading...');
             return GridView.count(physics: ScrollPhysics(), crossAxisCount: 2,children:
              // snapshot.maps()
              // List<DocumentSnapshot> document = snapshot.data.documents.length;
             [  for (var data in snapshot.data.documents)
               GestureDetector( onTap:() =>{
                 Navigator.push(context, AnimateProduct(widget:Product()) )
               },child: itemCard(price: data['price'].toString(), title:data['name'].toString()))
              ]
                         
                          // Container( height: 100, child: Text('$index'),),
                          // Container( height: 100, child: Text('$index'),),
                        );
           }
         ),
      ),
    );}
    }
    