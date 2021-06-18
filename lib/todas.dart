import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'db.dart';
import 'details.dart';
import 'newnote.dart';






class Todas extends StatefulWidget{



  @override
  _TodasState createState() => _TodasState();


}

class _TodasState extends State<Todas>  {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title:Text ('Todas as Notas '),
      ),
      body: Container(

        child:  FutureBuilder<List<Notas>>(
            future: DBProvider.db.todasNotas(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Notas>> snapshot) {
              if (snapshot.hasData) {
                return Container(

               child: ListView.builder(
                 keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      Notas item = snapshot.data[index];
                      return  ListTile(

                        title: Text(item.nota),
                        leading: Text(item.char),
                        trailing: TextButton(onPressed: () {
                          setState(() {});
                          DBProvider.db.deleteNota(item.id);}, child: const Icon(Icons.remove)),

                      );
                    }
                ),
              );
              }else{
                return CircularProgressIndicator();
              }
            }
        ),
      ),

    );
  }


  }

