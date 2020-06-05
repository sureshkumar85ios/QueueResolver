import 'package:flutter/material.dart';
import 'package:my_app/screens/QRScan.dart';
import 'package:my_app/screens/bookingConfirmation.dart';

class personalCustomerDashboard extends StatefulWidget {
  @override
  _personalCustomerDashboardState createState() => _personalCustomerDashboardState();
}

var color1 = Color(0xFFa572c0);
var color2 = Color(0xFF6559d4);
var profileImage = NetworkImage(
    'https://static1.squarespace.com/static/55f45174e4b0fb5d95b07f39/t/5aec4511aa4a991e53e6c044/1525433627644/Alexandra+Agoston+archives.jpg?format=1000w');

class _personalCustomerDashboardState extends State<personalCustomerDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
          children: <Widget>[
            SizedBox(height: 4.0,),
            UpperSection(),
            SizedBox(height: 4.0,),
            MiddleSection(),
          ],
        ),
      ),
    );
  }
}

class BottomSection extends StatelessWidget {
  const BottomSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(children: <Widget>[
              Text('Security & Data'),
              SizedBox(width: 16.0,),
              Text('Settings'),
            ],),
            Text('Help')
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
            subtitle: Text("it displays your today's booked queus with estimation time"),
            trailing: ClipOval(
              child: Container(
                  height: 40.0,
                  width: 40.0,
                  color: Colors.green.withOpacity(0.2),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.add),
                    color: Colors.green,
                  )),
            ),
          ),
          SizedBox(height: 8.0,),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Container(
              height: 250.0,
              child: ListView(
                padding: EdgeInsets.all(0.0),
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  ItemCard(Icons.closed_caption, 'Pick and Pay', '20 mins'),
                  SizedBox(height: 8.0,),
                  ItemCard(Icons.queue, 'Macro ', '60 mins' ),
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
  final icon;
  final name;
  final tasks;
  const ItemCard(

      this.icon,
      this.name,
      this.tasks
      );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
//        height: 80.0,
//        width: 80.0,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [color1, color2])),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                  Container(
                    width: 55,
                    height: 55,
                    color: Colors.green,
                    child: CircleAvatar(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.green,
                      backgroundImage: NetworkImage(
                          'https://static1.squarespace.com/static/55f45174e4b0fb5d95b07f39/t/5aec4511aa4a991e53e6c044/1525433627644/Alexandra+Agoston+archives.jpg?format=1000w'),
                      ),
                    ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      Text(tasks, style: TextStyle(color: Colors.white.withOpacity(0.6)),),
                    ],
                  )
                  ]
          ),
              Wrap(
                spacing: 5.0,
                runSpacing: 5.0,
                direction: Axis.vertical,
                children: <Widget>[
                   Container(
                    width: 130.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      //color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    alignment: Alignment.center,
                    child: FlatButton(
                      onPressed: () {
                        print('Login Button Pressed');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => bookingConfirmation()),
                        );
                      },
                      color: Colors.red[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      child: Text("Cancel", style: TextStyle(color: Colors.white)),
                    ),
                  )
                ],
              ),
//              Column(
//                //alignment: Alignment.topRight,
//                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//                C: FlatButton(
//                  onPressed: () {},
//                  color: Colors.red[200],
//                  shape: RoundedRectangleBorder(
//                    borderRadius: BorderRadius.circular(20.0),
//                  ),
//                  child: Text("Book Queue", style: TextStyle (color: Colors.white)),
//                ),
//              ),
          ],
              ),
    ),
    ),
    );
  }
}


class UpperSection extends StatelessWidget {
  const UpperSection({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 16.0,
        ),
        Padding(
          padding: EdgeInsets.all(32.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.eject,
                      //color: Colors.white,
                    ),
                    iconSize: 30,
                    tooltip: 'Logout application',
                    color: Colors.purple,
                    splashColor: Colors.purple,
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop(context);
                    },
                  ),
                  Icon(
                    Icons.mode_edit,
                    color: color1,
                  ),
                ],
              ),
              SizedBox(
                height: 8.0,
              ),
              CircleAvatar(
                radius: 50.0,
                backgroundImage: profileImage,
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'Arnold vosloo',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              SizedBox(
                height: 9.0,
              ),
              Text(
                'I am feeling good.',
                style: TextStyle(color: Colors.grey),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 32.0, right: 32),
          child: Container(
            height: 2.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [color1, color2])),
          ),
        ),
      ],
    );
  }
}
