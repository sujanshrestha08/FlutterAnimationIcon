import 'dart:ffi';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isClicked = false;
  bool isPlaying=false;
  
  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    // controller.forward().then((_) async{ await Future.delayed(Duration(seconds: 2));
    // controller.reverse();
    // } );
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Icon Animation")),
      ),
      body: Center(
        // child: new ElevatedButton(
        //   onPressed: (){},
        //  child: Text('Search'),
        //  )
        // );

        

        child: Column(
          children: [
            IconButton(
              iconSize: 150,
              icon: new AnimatedIcon(
                icon: AnimatedIcons.play_pause,
                // size: 150,
                color: Colors.green[700],
                progress: controller,
              ),
              onPressed: toggleIcon,
            ),
            SizedBox(
              height: 150,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.white),
                      onPressed: () {

                        setState(() {
                          isClicked = !isClicked;
                          print(isClicked);
                          // if(isClicked == true){

                          //   isClicked = false;
                          // }else
                          // isClicked = true;

                        });
                      },
                      
                      child: isClicked ? Image.asset(
                                  'assets/images/search1.gif',
                                  fit: BoxFit.fill,
                                ) : 
                                Image.asset(
                                  'assets/images/search.png',
                                  fit: BoxFit.fill,
                                ) 
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void toggleIcon() => setState((){
    isPlaying =!isPlaying;
    isPlaying? controller.forward() : controller.reverse();
  });
}
