import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rexpackaging/Constants.dart';

class DesktopScreen extends StatefulWidget {
  @override
  _DesktopScreenState createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
  ScrollController scrollController = ScrollController();
  ScrollController mainScrollController = ScrollController();
  int ind = 0;
  Color buttonColor = secondaryColor;
  Color productColor = thirdColor;
  Color emailButtonColor = secondaryColor;
  Color arrowColor = primaryColor;
  Color buttonTextColor = thirdColor;
  Timer timer;
  Offset positionOfForm;
  var containerKey = GlobalKey();
  var scaffoldKey = GlobalKey();
  double scrollBarOffset = 0;
  double columnHeight;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    mainScrollController.addListener(() {
      if (mainScrollController.offset /
              (columnHeight / MediaQuery.of(context).size.height) <
          MediaQuery.of(context).size.height)
        setState(() {
          scrollBarOffset = mainScrollController.offset /
                  (columnHeight / MediaQuery.of(context).size.height) +
              10;
        });
    });
    timer = Timer.periodic(Duration(seconds: 5), (value) {
      if (ind <= 18)
        setState(() {
          scrollController.position.moveTo(
              scrollController.offset + MediaQuery.of(context).size.width,
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn);
        });
      else
        setState(() {
          ind = 0;
          scrollController.position.moveTo(0,
              duration: Duration(seconds: 3), curve: Curves.fastOutSlowIn);
        });
    });
  }

  _afterLayout(_) {
    final RenderBox renderBox = containerKey.currentContext.findRenderObject();
    positionOfForm = renderBox.localToGlobal(Offset.zero);
    final RenderBox scaffoldBox = scaffoldKey.currentContext.findRenderObject();
    columnHeight = scaffoldBox.size.height - 120;
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(120.0),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Container(
                  color: primaryColor,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: secondaryColor, width: 3.0),
                      ),
                      margin: EdgeInsets.only(left: 40),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "REX PACKAGING",
                          style: TextStyle(
                              color: secondaryColor,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            controller: mainScrollController,
            child: Column(
              key: scaffoldKey,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 24.0),
                  color: primaryColor,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Flexible(
                                child: Container(
                                  child: Text(
                                    'Branding and design without the headaches.',
                                    style: TextStyle(
                                      fontSize: 50.0,
                                      color: thirdColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                child: Container(
                                  child: Text(
                                    'Located in Ottawa, we are a top level graphic design and branding studio focused on helping'
                                    ' our clients exceed their goals. Let us make your life easier!',
                                    style: TextStyle(
                                      fontSize: 25.0,
                                      color: thirdColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: InkWell(
                                        onTap: () {
                                          mainScrollController.position.moveTo(
                                              positionOfForm.dy,
                                              duration: Duration(seconds: 2),
                                              curve: Curves.fastOutSlowIn);
                                        },
                                        child: MouseRegion(
                                          onEnter: (event) {
                                            setState(() {
                                              buttonColor = thirdColor;
                                              buttonTextColor = primaryColor;
                                            });
                                          },
                                          onExit: (event) {
                                            setState(() {
                                              buttonColor = secondaryColor;
                                              buttonTextColor = thirdColor;
                                            });
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(right: 40),
                                            decoration: BoxDecoration(
                                              color: buttonColor,
                                              borderRadius:
                                                  BorderRadius.circular(50.0),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Text(
                                                'Get your Free Quote',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  color: buttonTextColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: InkWell(
                                        onTap: () {},
                                        child: MouseRegion(
                                          onEnter: (event) {
                                            setState(() {
                                              productColor = secondaryColor;
                                              arrowColor = thirdColor;
                                            });
                                          },
                                          onExit: (event) {
                                            setState(() {
                                              productColor = thirdColor;
                                              arrowColor = primaryColor;
                                            });
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(20.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  child: Text(
                                                    'See Our Products',
                                                    style: TextStyle(
                                                      color: productColor,
                                                      fontSize: 18.0,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  alignment: Alignment.center,
                                                  margin: EdgeInsets.only(
                                                      left: 10.0),
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: productColor),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Icon(
                                                      Icons.arrow_forward,
                                                      color: arrowColor,
                                                      size: 18.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                            flex: 1,
                            child: Container(
                              child: Placeholder(),
                            )),
                      ],
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height + 210,
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          controller: scrollController,
                          scrollDirection: Axis.horizontal,
                          itemCount: 20,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            ind = index;
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height + 210,
                              color: secondaryColor,
                            );
                          }),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              if (ind > 0) {
                                setState(() {
                                  scrollController.position.moveTo(
                                      scrollController.offset -
                                          MediaQuery.of(context).size.width,
                                      duration: Duration(seconds: 1),
                                      curve: Curves.fastOutSlowIn);
                                });
                              }
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 40,
                            ),
                          ),
                          Text(
                            ind.toString(),
                            style: TextStyle(
                                fontSize: 80.0, fontWeight: FontWeight.bold),
                          ),
                          InkWell(
                            onTap: () {
                              if (ind < 20)
                                setState(() {
                                  scrollController.position.moveTo(
                                      scrollController.offset +
                                          MediaQuery.of(context).size.width,
                                      duration: Duration(seconds: 1),
                                      curve: Curves.fastOutSlowIn);
                                });
                              else
                                setState(() {
                                  ind = 0;
                                  scrollController.position.moveTo(0,
                                      duration: Duration(seconds: 3),
                                      curve: Curves.fastOutSlowIn);
                                });
                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              size: 40,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: Stack(
                    alignment: Alignment.center,
                    overflow: Overflow.visible,
                    children: [
                      Positioned.fill(
                        top: -200,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 100,
                          height: MediaQuery.of(context).size.height * 0.85,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: thirdColor,
                            boxShadow: [
                              BoxShadow(
                                color: shadowColor,
                                spreadRadius: 2.0,
                                offset: Offset(-1, 1),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 50.0),
                                child: Text(
                                  'Why work with us?',
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontSize: 50.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 50.0, vertical: 20.0),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 50.0, horizontal: 20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Icon(
                                          Icons.email,
                                          size: 50.0,
                                        ),
                                      ),
                                      Flexible(
                                        flex: 2,
                                        child: Text(
                                          'Get started with your free 30 minute brand strategy call.',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 30.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: InkWell(
                                          onTap: () {},
                                          child: MouseRegion(
                                            onEnter: (event) {
                                              setState(() {
                                                buttonColor = Colors.black;
                                              });
                                            },
                                            onExit: (event) {
                                              setState(() {
                                                buttonColor = secondaryColor;
                                              });
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: buttonColor,
                                                borderRadius:
                                                    BorderRadius.circular(25.0),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Text(
                                                  'Email Now',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                    fontSize: 20.0,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 40.0),
                  child: Container(
                    key: containerKey,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          topRight: Radius.circular(25.0)),
                      color: primaryColor,
                    ),
                    margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: CustomPaint(
                      painter: MyPainter(),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              flex: 2,
                              child: Column(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(vertical: 20.0),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Contact Us',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: thirdColor,
                                          fontSize: 40.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    margin:
                                        EdgeInsets.symmetric(vertical: 20.0),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Feel like contacting us? Submit your queries here and we will get back to you as soon as possible.',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: thirdColor,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                margin: EdgeInsets.only(left: 20.0, right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: shadowColor,
                                        offset: Offset(2, 2),
                                        spreadRadius: 3.0),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          'Send us a Message',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: primaryColor,
                                              fontSize: 25.0),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 30.0),
                                        child: TextFormField(
                                          maxLines: 1,
                                          decoration: InputDecoration(
                                              labelText: 'Name',
                                              labelStyle: TextStyle(
                                                color: primaryColor,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: shadowColor,
                                                          width: 2.0))),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 30.0),
                                        child: TextFormField(
                                          maxLines: 1,
                                          decoration: InputDecoration(
                                              labelText: 'Email',
                                              labelStyle: TextStyle(
                                                color: primaryColor,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: shadowColor,
                                                          width: 2.0))),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 30.0),
                                        child: TextFormField(
                                          maxLines: 1,
                                          decoration: InputDecoration(
                                              labelText: 'Phone',
                                              labelStyle: TextStyle(
                                                color: primaryColor,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: shadowColor,
                                                          width: 2.0))),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 30.0),
                                        child: TextFormField(
                                          maxLines: 3,
                                          decoration: InputDecoration(
                                              labelText: 'Message',
                                              labelStyle: TextStyle(
                                                color: primaryColor,
                                              ),
                                              enabledBorder:
                                                  UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: shadowColor,
                                                          width: 2.0))),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(top: 50.0),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            color: secondaryColor,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Text(
                                              'Submit',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Container(
                            child: Text(
                                ' Address : \n D - 40 , Sector No - 5 , \n DSIIDC Bawana Industrial Area ,\n Delhi - 110039 , INDIA',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 16.0, color: thirdColor)),
                          ),
                        ),
                        Flexible(child: Column()),
                        InkWell(
                            onTap: () {
                              mainScrollController.position.moveTo(0,
                                  duration: Duration(seconds: 2),
                                  curve: Curves.easeIn);
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_upward,
                                  size: 20,
                                  color: thirdColor,
                                ),
                                Text(
                                  'TOP',
                                  style: TextStyle(
                                      color: thirdColor, fontSize: 20.0),
                                )
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 5,
          top: scrollBarOffset,
          child: GestureDetector(
            onVerticalDragUpdate: (details) {
              if (details.globalPosition.dy + 70 <
                      MediaQuery.of(context).size.height &&
                  details.globalPosition.dy > 0)
                setState(() {
                  scrollBarOffset = details.globalPosition.dy;
                  mainScrollController.position.moveTo(
                      details.globalPosition.dy *
                          (columnHeight / MediaQuery.of(context).size.height));
                });
            },
            child: Container(
              height: 70,
              width: 10,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    print(size);
    Paint curvePaint = Paint()
      ..color = secondaryColor.withOpacity(0.5)
      ..isAntiAlias = true;
    Path curvePath = Path();
    curvePath.moveTo(0, size.height);
    curvePath.quadraticBezierTo(
        size.width * 0.10, size.height * 0.10, size.width, size.height);
    canvas.drawPath(curvePath, curvePaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
