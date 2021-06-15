import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'db.dart';

class Notas{
  final int id;
  final String char;
  final String nota;

  Notas({
     this.id,
     this.char,
     this.nota,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'char': char,
      'nota': nota,
    };
  }


  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Notas{id: $id, char: $char, nota: $nota}';
  }
}



class Details extends StatefulWidget{
  @override
  _DetailsState createState() => _DetailsState();


}

class _DetailsState extends State<Details> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Página Detalhes'),
        ),
        body: FutureBuilder<List<Notas>>(
            future: DBProvider.db.todasNotas(),
            builder: (BuildContext context,
                AsyncSnapshot<List<Notas>> snapshot) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    Notas item = snapshot.data[index];
                    child:
                    ListTile(
                      title: Text(item.nota),
                      leading: Text(item.id.toString()),

                    );
                  }
              );
            })
    );
  }
}
