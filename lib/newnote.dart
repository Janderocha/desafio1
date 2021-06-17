import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'db.dart';
import 'details.dart';

TextEditingController noteController = new TextEditingController();

class NewNote extends StatefulWidget{
  @override
  _NewNoteState createState() => _NewNoteState();


}

class _NewNoteState extends State<NewNote>  {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title:Text ('Notas'),
      ),
      body: Container(


        child:  TextField(

          controller: noteController,
          textAlign: TextAlign.left,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'INFORME A NOTA',
            hintStyle: TextStyle(color: Colors.grey),
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){DBProvider.db.insertNota(new Notas(id: 90, char: 'Sol Badguy', nota:noteController.text));},

        child: const Icon(Icons.add),
    ),
    );

        


  }

}