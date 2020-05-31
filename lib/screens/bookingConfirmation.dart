import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


class bookingConfirmation extends StatefulWidget {
  @override
  _bookingConfirmationState createState() => _bookingConfirmationState();
}

var color1 = Color(0xFFa572c0);
var color2 = Color(0xFF6559d4);

class _bookingConfirmationState extends State<bookingConfirmation> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              title: Text(''),
              backgroundColor: Colors.green,
              expandedHeight: 350.0,
              flexibleSpace: FlexibleSpaceBar(
                background: getImage(),
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 200.00,
              delegate: SliverChildListDelegate([
               // buildSelectedDetails(context, widget.trip),
                const SizedBox(height: 60.0),
                buildButtons(),
              ]),
            )
          ],
        ),
      ),
    );
  }
  Widget buildButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
//        SizedBox(
//          width: MediaQuery.of(context).size.width * 0.60,
//          child: Text(
//            'Your Queue number is 100',
//            style: TextStyle(
//              color: Color(0xFF527DAA),
//              letterSpacing: 1.5,
//              fontSize: 22.0,
//              fontWeight: FontWeight.bold,
//              fontFamily: 'OpenSans',
//            ),
//          ),
//        ),
//        SizedBox(
//          width: MediaQuery.of(context).size.width * 0.60,
//          child: Text(
//            'Estimated time for you is 20 mins.',
//            style: TextStyle(
//              color: Color(0xFF527DAA),
//              letterSpacing: 1.5,
//              fontSize: 22.0,
//              fontWeight: FontWeight.bold,
//              fontFamily: 'OpenSans',
//            ),
//          ),
//        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.60,
          height: 100,
          child: MaterialButton(
            height: 140.0,
            minWidth: double.infinity,
            color: Theme.of(context).primaryColor,
            textColor: Colors.white,
            child:  Text(
              "Your Queue number is 100. Estimated time for you is 20 mins.",
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.yellow,
              ),
            ),
            splashColor: Colors.redAccent,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.60,
          child: RaisedButton(
            child: Text('Comfirm'),
            color: Colors.amberAccent,
            onPressed: () {
//              widget.trip.startDate = _startDate;
//              widget.trip.endDate = _endDate;
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => NewTripBudgetView(
//                    trip: widget.trip,
//                  ),
//                ),
//              );
            },
          ),
        ),
      ],
    );
  /*“∑SX*/}

  Image getImage() {
    final imageUrl = "https://static1.squarespace.com/static/55f45174e4b0fb5d95b07f39/t/5aec4511aa4a991e53e6c044/1525433627644/Alexandra+Agoston+archives.jpg?format=1000w";
    return Image.network(imageUrl, fit: BoxFit.cover);
  }}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items({this.title, this.subtitle, this.event, this.img});
}
