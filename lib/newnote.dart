import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'db.dart';
import 'details.dart';

TextEditingController noteController = new TextEditingController();

class NewNote extends StatefulWidget{
  final String char;

  const NewNote({Key key, this.char}) : super(key: key);


  @override
  _NewNoteState createState() => _NewNoteState();


}

class _NewNoteState extends State<NewNote>  {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title:Text ('Nova Nota'),
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
        onPressed: () async {
          setState(() {});
         DBProvider.db.insertNota(new Notas(char: widget.char, nota:noteController.text));
         noteController.text = ""; //PROCURAR MANEIRA DE LIMPAR ESSA VARIAVEL DEPOIS.
         Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Details(char: widget.char ),
              ),
            );
          },
        child: const Icon(Icons.add),
    ),
    );

        


  }

}