import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
    // TODO: implement createState
}

class _HomePageState extends State<HomePage>{
List<String> images = ['https://images.unsplash.com/photo-1494500764479-0c8f2919a3d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80',
  'https://www.rcsdk8.org/sites/main/files/main-images/camera_lense_0.jpeg',
  'https://images.unsplash.com/photo-1494500764479-0c8f2919a3d8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1350&q=80'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ('Página Principal'),
      ),
      body:GridView.count(crossAxisCount: 3,


      children: List.generate(opcoes.length, (index) {
            return Center(
              child: OpcaoCard(opcao:opcoes[index]),
            );
          }),



      )





      ,



      );

  

  }

}

class Opcao {
 final String titulo;
  final String iconepath;

 const Opcao(this.titulo, this.iconepath);


}

const List<Opcao> opcoes = const <Opcao>[
  const Opcao("Axl Low", 'Icons/Axl_Low.png'),
  const Opcao("Anji Mito", 'Icons/Anji_Mito.png'),
  const Opcao("Chipp Zanuff", 'Icons/Chipp_Zanuff.png'),
  const Opcao("Faust", 'Icons/Faust.png'),
  const Opcao("Giovanna", 'Icons/Giovanna.png'),
  const Opcao("I-No", 'Icons/I-No.png'),
  const Opcao("Ky Kiske", 'Icons/Ky_Kiske.png'),
  const Opcao("Leo Whitefang", 'Icons/Leo_Whitefang.png'),
  const Opcao("May", 'Icons/May.png'),
  const Opcao("Millia Rage", 'Icons/Millia_Rage.png'),
  const Opcao("Nagoriyuki", 'Icons/Nagoriyuki.png'),
  const Opcao("Potemkin", 'Icons/Potemkin.png'),
  const Opcao("Ramlethal Valentine", 'Icons/Ramlethal_Valentine.png'),
  const Opcao("Sol Badguy", 'Icons/Sol_Badguy.png'),
  const Opcao("Zato-I", 'Icons/Zato-1.png'),










];

class OpcaoCard extends StatelessWidget{
  const OpcaoCard({Key key, this.opcao}) : super(key: key);
  final  Opcao opcao;
  @override
  Widget build(BuildContext context) {
    return Card(
      child:Center(
        child: Column(

          children: <Widget>[
            Image.asset(opcao.iconepath),
            Text(opcao.titulo),
          ],
        ),
      )

    );

    }
    // TODO: implement build
  }

  
