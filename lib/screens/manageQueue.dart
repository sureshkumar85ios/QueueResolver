import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class bookQueue extends StatefulWidget {
  @override
  _bookQueueState createState() => _bookQueueState();
}
var color1 = Color(0xFFa572c0);
var color2 = Color(0xFF6559d4);

class _bookQueueState extends State<bookQueue> {
  Items item1 = new Items(
      title: "Start Queue",
      subtitle: "Queue Start at",
      event: "10 am",
      img: "assets/images/bookQueue.png");

  Items item2 = new Items(
    title: "Stop Queue",
    subtitle: "Stop the queue at",
    event: "2 pm",
      img: "assets/images/complete.png",
  );
  Items item3 = Items(
    title: "End Of Day",
    subtitle: "Queue will be ended in",
    event: "60 mins",
    img: "assets/images/eod.png",
  );
  Items item4 = new Items(
    title: "Auto Mode",
    subtitle: "Queue will be in Auto Mode",
    event: "",
    img: "assets/images/todo.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4,];
    var color = 0xff453658;
    return Container(
      color: Colors.white,
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: const EdgeInsets.only(left: 16, right: 16, top: 50, bottom: 16),
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
