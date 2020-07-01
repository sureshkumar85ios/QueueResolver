import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:my_app/data/fetchPersonBookedQueues.dart';
import 'package:my_app/data/fetchQueueList.dart';
import 'package:my_app/data/network_util.dart';
import 'package:my_app/models/api_response.dart';
import 'package:my_app/utilities/StorageUtil.dart';

class personalCustomerDashboard extends StatefulWidget {
  @override
  _personalCustomerDashboardState createState() => _personalCustomerDashboardState();
}

var username = StorageUtil.getString("username");
bool _isLoading = false;

var color1 = Color(0xFFa572c0);
var color2 = Color(0xFF6559d4);
var profileImage = NetworkImage(
    'https://static1.squarespace.com/static/55f45174e4b0fb5d95b07f39/t/5aec4511aa4a991e53e6c044/1525433627644/Alexandra+Agoston+archives.jpg?format=1000w');

APIResponse<List<fetchPersonBookedQueues>> _apiResponse;

class _personalCustomerDashboardState extends State<personalCustomerDashboard> {
  Services get service => GetIt.I<Services>();


  @override
  void initState() {
    _fetchNotes();
    super.initState();
  }
  _fetchNotes() async {
    setState(() {
      _isLoading = true;
    });
   // _apiResponse = await service.getNotesList(); //this is for start the Queue
    _apiResponse = await service.getBookedQueueList();
    print(_apiResponse.data);

    setState(() {
      _isLoading = false;
    });
  }
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
              height: 450.0,

                child:ListView.separated(
                  //padding: const EdgeInsets.only(bottom:30),
                  itemCount:_apiResponse == null?1:_apiResponse.data.length,
                  separatorBuilder: (BuildContext context, int index) => Divider(),
                  //physics: BouncingScrollPhysics(),
                  //padding: EdgeInsets.all(0),
                  itemBuilder: (context, index){
                    if (_isLoading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (_apiResponse.error) {
                      return Center(child: Text(_apiResponse.errorMessage));
                    }
                    return ItemCard(
                      _apiResponse.data[index].companyName,
                      'Your Queue No is'+_apiResponse.data[index].queueNumber,
                      _apiResponse.data[index].companylogo,
                    );

                  },
                )
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
      padding: const EdgeInsets.only(right: 18.0),
      child: new Container(
            //padding: EdgeInsets.symmetric(vertical: 14.0, bo: 18.0),
        padding: new EdgeInsets.all(18.0),
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
                        backgroundImage: NetworkImage(image),
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
                StorageUtil.getString("username"),
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
