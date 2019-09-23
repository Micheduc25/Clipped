import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
  
        primarySwatch: Colors.green,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage("My header"),
    );
  }
}


class MyHomePage extends StatefulWidget{
  final String title;
  @override
  MyHomePage( this.title):super();

   @override
  _MyHomePageState createState()=>_MyHomePageState();
 
}


class _MyHomePageState extends State<MyHomePage>{
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClippedBody(),
    );
     
  }
}









class ClippedBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
    //we create a stack in which we will super pose the two clipped containers
    //the container with light background is at the base of the stack, while the one with strong bg is at the top
    Stack(
      children:[
    ClipPath(
      clipper:MyClipper2(),
      child: Container(color:Color.fromRGBO(251, 235, 236, 1)),
      
    
    ),

    
     ClipPath(
      child: Container(
        width:double.infinity,
        color: Color.fromRGBO(236, 154, 156, 1),

        child: 
        Center(
          child:
        Column(
          mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            
            Container(
              margin:EdgeInsets.only(bottom: 110,top: 110),
              child:
              
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

                //we create our own custom icon with a sized box and a container
                Padding(
                  padding:EdgeInsets.only(bottom: 6),
                  child:
                SizedBox(
                  width:90,
                  height: 90,
                  child: Container(
                    decoration:BoxDecoration(
                      border:Border.all(width: 2, color: Colors.white),
                      borderRadius: BorderRadius.circular(100)
                    ),
                    alignment: Alignment.center,

                    child:Text("!", style: TextStyle(fontSize: 70, fontWeight: FontWeight.w700, color: Colors.white),)
                  ),
                  )
                  )
                ,

                Text("Wrong", style: TextStyle(color:Colors.white, fontSize: 27),)

                ,

                Text("Try again with code", style: TextStyle(color:Colors.white, fontSize: 12),)
              ],
            ),
            ),

            //we create a button and give it some padding horizontally to make it long and give it border Radius
            FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                
              ),
              color: Colors.white,
              onPressed: (){
                print("but pressed");
              },
              
              padding: EdgeInsets.only(left:110, right:110, top:10, bottom: 10),
              child: Text("back", style: TextStyle(color:Color.fromRGBO(236, 154, 156, 1),),),
            )
          ],
        ),
        )
        
        ),
      clipper: MyClipper1(),
    )
    ]
    );
  }
}


//here we define our clippers for our clipPath class, one for each major container
class MyClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height/2.3);

    
    var firstControlPoint=Offset(31, 210);
    var firstEndpoint = Offset(34,130);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndpoint.dx, firstEndpoint.dy);

    var secondControlPoint=Offset(60, 5);
    var secondEndpoint = Offset(270,70);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndpoint.dx, secondEndpoint.dy);

    path.lineTo(size.width, size.height/6);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close(); 
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


class MyClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    
    var path=new Path();

    path.lineTo(0, size.height/2.45);


    var firstControlPoint=Offset(40, 220);
    var firstEndpoint = Offset(50,105);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy, firstEndpoint.dx, firstEndpoint.dy);

    var secondControlPoint=Offset(60, 4);
    var secondEndpoint = Offset(270,42);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndpoint.dx, secondEndpoint.dy);


    path.lineTo(size.width, size.height/9.8);
    path.lineTo(size.width,size.height);
    path.lineTo(0, size.height);
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


