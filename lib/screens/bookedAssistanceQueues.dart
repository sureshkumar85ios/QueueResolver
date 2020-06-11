import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:my_app/utilities/styles.dart';

class bookedAssistanceQueues extends StatefulWidget {
  @override
  _bookedAssistanceQueuesState createState() => _bookedAssistanceQueuesState();
}

var color1 = Color(0xFFa572c0);
var color2 = Color(0xFF6559d4);


class _bookedAssistanceQueuesState extends State<bookedAssistanceQueues> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Booked Queue Status')),
//      body: Center(child: Text('My Page!')),
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 4.0,),
            MiddleSection(),
          ],
        ),
      ),
    );
  }
}

class MiddleSection extends StatelessWidget {
  const MiddleSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          Divider(height: 8.0,),
          ListTile(
            title: Text(" Booked Queue's status"),
          ),
          SizedBox(height: 8.0,),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Container(
              height: 450.0,
              child: ListView(
                padding: EdgeInsets.all(0.0),
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  ItemCard('Customer 1', 'Est Time : 20 mins', 'spar.png'),
                  SizedBox(height: 8.0,),
                  ItemCard('Customer 2 ', 'Est Time : 60 mins','makro.png'),
                  SizedBox(height: 8.0,),
                  // ItemCard(Icons.queue, 'Woolworth', '35 mins'),
                  // SizedBox(height: 8.0,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final name;
  final tasks;
  final image;
  const ItemCard(
      this.name,
      this.tasks,
      this.image,
      );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        //    padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
//    decoration: BoxDecoration(
//      color: Colors.white,
//      borderRadius: BorderRadius.circular(18),
//    ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [color1, color2])),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 45,
                      height: 45,
                      //color: Colors.green,
                      child: CircleAvatar(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.green,
                        backgroundImage: NetworkImage(USER_IMAGE),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const SizedBox(height: 5),
                        Text(name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        const SizedBox(height: 5),
                        Text(tasks, style: TextStyle(color: Colors.white.withOpacity(0.6)),),
                      ],
                    )
                  ]
              ),
              SizedBox(
                height: 8.0,
              ),
              Divider(
                color: Colors.grey[200],
                height: 3,
                thickness: 1,
              ),
              SizedBox(
                height: 8.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _iconBuilder(LineAwesomeIcons.check_circle, 'Check-in'),
                  _iconBuilder(LineAwesomeIcons.times_circle, 'Cancel'),
                  _iconBuilder(LineAwesomeIcons.compass, 'Directions'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Column _iconBuilder(icon, title) {
  return Column(
    children: <Widget>[
      Icon(
        icon,
        size: 28,
        color: Colors.white,
      ),
      SizedBox(
        height: 8.0,
      ),
      Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w300,
          color: Colors.white,
        ),
      ),
    ],
  );
}