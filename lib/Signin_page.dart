import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dart:math';

// enum CircleSide{left,right,}
// extension Topathext on CircleSide{
//   Path topath(Size size){
//     // return path type with coordinates

//   }
// }

class Signin_screen extends StatefulWidget {
  const Signin_screen({super.key});

  @override
  State<Signin_screen> createState() => _Signin_screenState();
}

class _Signin_screenState extends State<Signin_screen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;
  int boxvalue = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(_controller);

    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromARGB(90, 252, 189, 30),
          border: Border.all(color: Colors.red)),
      padding: EdgeInsets.only(
          top: (MediaQuery.of(context).size.height * 0.05).toDouble(),
          bottom: (MediaQuery.of(context).size.height * 0.05).toDouble()),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..rotateY(animation.value),
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.horizontal(right: Radius.circular(10)),
                        color: Colors.blue),
                  ),
                );
              },
            )),
            Stack(alignment: AlignmentDirectional.center, children: [
              Container(
                height: 50.0,
                width: 200.0,
                color: Colors.amber,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text('Alignment'),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: Text('Overlay'),
                  color: Colors.green,
                  height: 30,
                ),
              )
            ]),
            SizedBox(
              width: (MediaQuery.of(context).size.width * 0.6).toDouble(),
              height: 20.0,
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: (MediaQuery.of(context).size.width * 0.1).toDouble(),
                    height:
                        (MediaQuery.of(context).size.height * 0.1).toDouble(),
                    child: Text("hello"),
                  );
                },
                scrollDirection: Axis.horizontal,
                itemCount: 10,
              ),
            ),
            const Image(image: AssetImage("assets/Big Shock.jpeg")),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: Colors.black, style: BorderStyle.none)),
              width: MediaQuery.of(context).size.width * 0.6.toDouble(),
              height: MediaQuery.of(context).size.height * 0.05.toDouble(),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    errorBorder: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Name pls',
                    focusedBorder: OutlineInputBorder()),
                controller: TextEditingController(),
              ),
            ),
            Icon(Icons.person),
            Gap(MediaQuery.of(context).size.height * 0.1),
            Text('SIGN INTO ACCOUNT'),
            Container(
              child: Text(
                'Hello',
                // style: GoogleFonts.ptSerif(),
              ),
              height: 30,
              width: (MediaQuery.of(context).size.width * 0.6).toDouble(),
              decoration: BoxDecoration(
                  gradient:
                      RadialGradient(colors: [Colors.black, Colors.white]),
                  borderRadius: BorderRadius.circular(30)),
            ),
            Container(
                height: (MediaQuery.of(context).size.height * 0.15).toDouble(),
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            boxvalue = index;
                          });
                        },
                        child: Container(
                            height: (MediaQuery.of(context).size.height * 0.3)
                                .toDouble(),
                            width: (MediaQuery.of(context).size.width * 0.3)
                                .toDouble(),
                            child: Text('Try'),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: boxvalue == index
                                        ? Colors.blue
                                        : Colors.black))),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
