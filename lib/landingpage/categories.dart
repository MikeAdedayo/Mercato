import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mercato/itemscreen/categoryscreen.dart';

import '../AnimationRoute.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('Categories').document('wlO6QlYCOfrARBJSOd60').snapshots(),
      builder: (context, snapshot) {
        // print(snapshot.data.data['Category'].toString());
        if (!snapshot.hasData) return const Text('Loading...');
        return ListView.builder(
                    itemBuilder: (context, index) {
                      String categoryValue = snapshot.data.data['Category'][index];
                      return Container(
                        // height: 50,
                        // width: 65,
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(8)),
                        child: GestureDetector(onTap:() =>{
                          Navigator.push(context,
                           AnimateTop(widget:Category(categoryTitle: categoryValue,))
                        )} , child: Text(categoryValue)), margin: EdgeInsets.all(15),
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    // initialItemCount: 10,
                    itemCount: snapshot.data.data['Category'].length,
                  );
      }
    );
  }
}