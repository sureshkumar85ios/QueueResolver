import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


class bookForSomeone extends StatefulWidget {
  @override
  _bookForSomeoneState createState() => _bookForSomeoneState();
}

var color1 = Color(0xFFa572c0);
var color2 = Color(0xFF6559d4);

class _bookForSomeoneState extends State<bookForSomeone> {

  Items item1 = new Items(
      title: "Book Queue",
      subtitle: "Approximate time is around",
      event: "20 mins",
      img: "assets/images/start_q.png");
  Items item2 = new Items(
      title: "Cancel Queue",
      subtitle: "Remaining Time is",
      event: "40 mins",
      img: "assets/images/bookQueue.png");

  @override
  Widget build(BuildContext context) {
    final List<Items> myList = [item1,item2];
    var color = 0xff453658;
    return Container(
      color: Colors.white,
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: const EdgeInsets.only(left: 15, right: 15, top: 50, bottom: 15),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      // ignore: always_specify_types
                      colors: [color1, color2]),
                  borderRadius: BorderRadius.circular(10)),
//              decoration: BoxDecoration(
//                  color: Color(color), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 42,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    data.subtitle,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white38,
                            fontSize: 10,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.event,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items({this.title, this.subtitle, this.event, this.img});
}
