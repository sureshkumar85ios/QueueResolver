import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/screens/QRScan.dart';

class customerDashboard extends StatefulWidget {
  @override
  _customerDashboardState createState() => _customerDashboardState();
}

var color1 = Color(0xFFa572c0);
var color2 = Color(0xFF6559d4);
var profileImage = NetworkImage(
    'https://static1.squarespace.com/static/55f45174e4b0fb5d95b07f39/t/5aec4511aa4a991e53e6c044/1525433627644/Alexandra+Agoston+archives.jpg?format=1000w');

class _customerDashboardState extends State<customerDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: SingleChildScrollView(
      child: Column(
          children: <Widget>[
            UpperSection(),
            SizedBox(height: 4.0,),
            MiddleSection(),
          ],
        )
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
      height: 50.0,
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
          Divider(height: 9.0,),
          ListTile(
            title: Text("Today's status"),
            subtitle: Text('250 completed in 5 hours'),
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
          SizedBox(height: 7.0,),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Container(
              height: 270.0,
              child: ListView(
                padding: EdgeInsets.all(0.0),
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  ItemCard(Icons.closed_caption, 'Completed', '250'),
                  SizedBox(height: 7.0,),
                  ItemCard(Icons.queue, 'Current in Queue', '50' ),
                  SizedBox(height: 7.0,),
                  ItemCard(Icons.queue, 'Time interval set per customre', '5 mins'),
                  SizedBox(height: 7.0,),
                  ItemCard(Icons.queue, 'Time Slot set in mins', '20'),
                  SizedBox(height: 7.0,),
                  ItemCard(Icons.queue, 'Max number number allowed outside in queue', '5'),
                  SizedBox(height: 7.0,),
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
        height: 80.0,
        width: 60.0,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [color1, color2])),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            //  Icon(icon, color: Colors.white,),
            //  Spacer(),
              Text(name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
              SizedBox(height: 4.0,),
              Text(tasks, style: TextStyle(color: Colors.white.withOpacity(0.6)),),
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
        Padding(
          padding: EdgeInsets.all(20.0),
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
                radius: 80.0,
                backgroundImage: AssetImage('assets/images/Spar_palm_court.png'),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'SUPERSPAR',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              SizedBox(
                height: 9.0,
              ),
              Text(
                'Palm Court Superspar',
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
