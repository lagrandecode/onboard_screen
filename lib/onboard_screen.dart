import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboard_screen/screen.dart';
import 'homePage.dart';

class OnBoardScreen extends StatefulWidget {
  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  List<Screen> screens = Screen.generateScreen();
  int selectIndex = 0;

  PageController _controller = PageController();

  @override
  void initState() {
    // TODO: implement initState
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: screens.length,
                onPageChanged: (int index) {
                  setState(() {
                    selectIndex = index;
                  });
                },
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
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          screens[index].name,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
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
                (index) => _buildCircle(index),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 25, right: 25, bottom: 50, top: 30),
            height: 40,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
                bottomLeft: Radius.circular(5),
              ),
              color: Theme.of(context).primaryColor,
            ),

            // ignore: deprecated_member_use
            child: TextButton(
              onPressed: () {
                if (selectIndex == screens.length - 1) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (_) => HomePage(),
                    ),
                  );
                } else {
                  _controller.nextPage(
                    duration: const Duration(microseconds: 60),
                    curve: Curves.easeIn,
                  );
                }
              },
              child: Text(
                selectIndex == screens.length - 1 ? "Continue" : "Next",
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

  _buildCircle(int index) {
    return Container(
      margin: const EdgeInsets.only(right: 5),
      height: selectIndex == index ? 6 : 3,
      width: selectIndex == index ? 20 : 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        shape: BoxShape.rectangle,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
