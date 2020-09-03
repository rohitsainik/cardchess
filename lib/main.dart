import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

Random random = new Random();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CardChess',
      theme: ThemeData(

        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'CardChess'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String k = 'king';
  String q = 'Queen';
  String r = 'Rook';
  String b = 'Bishop';
  String h = 'knight';
  String p = 'pawn';

  String choice;
  int ran = 1;
  String val;
  String asset='chess/pawn.png';

  genrandom() {
    setState(() {
      ran = random.nextInt(13) + 1;
    });
    print(ran);
    if (  1 < ran && ran<= 9) {
      setState(() {
        choice = p;
        val=ran.toString();
        asset='chess/pawn.png';
      });
    } else if (ran == 10) {
      setState(() {
        choice = h;
        val=ran.toString();
        asset='chess/knight.png';
      });
    } else if (ran == 11) {
      setState(() {
        choice = b;
        val='Jack';
        asset='chess/bishop.png';
      });
    } else if (ran == 12) {
      setState(() {
        choice = q;
        val='Queen';
        asset='chess/queen.png';
      });
    } else if (ran == 13) {
      setState(() {
        choice = k;
        val='King';
        asset='chess/king.png';
      });
    } else if(ran==1){
      setState(() {
        choice = r;
        val='Ace';
        asset='chess/rook.png';
      });
    }
    print(choice);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('chess/backgroundchess.jpg'),
                fit: BoxFit.cover
            ),
          ),
          child: GestureDetector(
            onTap: genrandom,
            child: Center(
              child: Container(
                decoration: BoxDecoration(shape: BoxShape.rectangle,color: Colors.white,
                boxShadow: [
                  BoxShadow()
                ],
                borderRadius: BorderRadius.circular(10)),
                height: 450,
                width: 300,
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Center(child: Image.asset(asset ?? 'chess/pawn.png')),

                    Positioned(child: Text(
                      val ?? '1' ,
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),top: 20,left: 20, ),
                    Positioned(child: Text(
                      val ?? '1',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),bottom: 20,right: 20, ),
                    // Positioned.fill(bottom: -10,
                    // child: Align(alignment: Alignment.bottomCenter,child: Text(
                    //   choice ?? 'pawn',
                    //   style: TextStyle(
                    //       color: Colors.grey,
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 30),
                    // ),))
                  ],
                ),
              ),
            ),
          ),
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
