
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class itemCard extends StatefulWidget {
  final String title;
  final String price;
  
  const itemCard({Key key,this.title,this.price}) : super(key: key);

  @override
  _itemCardState createState() => _itemCardState();
}


class _itemCardState extends State<itemCard> {
  @override
  void initState() { 
    super.initState();
    _getImage();
  }
  String _imageUrl;
  // _getImage().then((onValue) { 
  //     setState(() {
  //     _imageUrl = onValue;  
  //     });
  Future _getImage() async{
var ref = FirebaseStorage.instance.ref().child('female.jpg');
    var url = await ref.getDownloadURL();
    setState(() {
      _imageUrl = url;  
      });
}

  @override
  Widget build(BuildContext context) {
    print(_imageUrl);
    
  // .getDownloadURL().then((loc) => setState(() { _imageUrl = loc; counter = counter++; }));
  
    return Container(
      // height: 500,
      width: MediaQuery.of(context).size.width/3,
      child: Column(children: <Widget>[
        Flexible(flex: 5,child: 
        
        Container(height:120,
        child: _imageUrl == null ? Icon(Icons.airplay)
                :Image.network(_imageUrl),),),
        Text('${widget.title}'),
        Text(widget.price)
      ],  ),
    );
  }
}