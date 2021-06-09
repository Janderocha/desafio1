import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
    // TODO: implement createState
}

class _HomePageState extends State<HomePage>{
List<String> images = ['https://images.unsplash.com/photo-1494500764479-0c8f2919a3d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80',
  'https://images.unsplash.com/photo-1494500764479-0c8f2919a3d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80',
  'https://images.unsplash.com/photo-1494500764479-0c8f2919a3d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ('paginadois'),
      ),
      body:


          ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        //     itemExtent: 400, use this if you give hight of your items
        physics: ScrollPhysics(),
            itemCount: images.length,
            itemBuilder: (context, index){
          return Image.network('${images[index]}');


            }


          )



    );
    // TODO: implement build
    throw UnimplementedError();
  }

}