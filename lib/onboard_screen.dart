import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboard_screen/screen.dart';

class OnBoardScreen extends StatefulWidget {
  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  List<Screen> screens = Screen.generateScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                itemCount: screens.length,
                itemBuilder: (_, index) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                              height: 250,
                              child: SvgPicture.asset(
                                screens[index].img,
                              )),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          screens[index].name,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              screens[index].description,
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    )),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                screens.length,
                (index) => _buildCircle(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 25, right: 25, bottom: 50, top: 30),
            height: 40,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(5),
              ),
              color: Theme.of(context).primaryColor,
            ),

            // ignore: deprecated_member_use
            child: TextButton(
              onPressed: () {},
              child: Text(
                "Next",
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildCircle() {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      height: 5,
      width: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        shape: BoxShape.rectangle,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
