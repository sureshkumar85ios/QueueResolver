import 'package:date_format/date_format.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:my_app/data/network_util.dart';
import 'package:my_app/login_rest_ds.dart';
import 'package:my_app/models/VendorDashboard.dart';
import 'package:my_app/models/api_response.dart';
import 'package:my_app/screens/QRScan.dart';

class customerDashboard extends StatefulWidget {
  @override
  _customerDashboardState createState() => _customerDashboardState();
}

var color1 = Color(0xFFa572c0);
var color2 = Color(0xFF6559d4);
var profileImage = NetworkImage(
    'https://logos-download.com/wp-content/uploads/2016/06/Spar_logo_white_background.png?format=1000w');
bool _isLoading = false;

APIResponse<List<VendorDashboard>> _apiResponse;
Services get service => GetIt.I<Services>();

class _customerDashboardState extends State<customerDashboard> {
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
    _apiResponse = await service.getDashboardQueueDetails();
    //print(_apiResponse.data.length);

    setState(() {
      _isLoading = false;
    });
  }

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
  Future<void> _pullRefresh() async {

    // _apiResponse = await service.getNotesList(); //this is for start the Queue
//    setState(() async {
//      _apiResponse = await service.getBookedQueueList();
//      print(_apiResponse.data);
//    });
  }

  String date(DateTime tm) {
    DateTime today = new DateTime.now();
    Duration oneDay = new Duration(days: 1);
    Duration twoDay = new Duration(days: 2);
    Duration oneWeek = new Duration(days: 7);
    String month;
    switch (tm.month) {
      case 1:
        month = "january";
        break;
      case 2:
        month = "february";
        break;
      case 3:
        month = "march";
        break;
      case 4:
        month = "april";
        break;
      case 5:
        month = "may";
        break;
      case 6:
        month = "june";
        break;
      case 7:
        month = "july";
        break;
      case 8:
        month = "august";
        break;
      case 9:
        month = "september";
        break;
      case 10:
        month = "october";
        break;
      case 11:
        month = "november";
        break;
      case 12:
        month = "december";
        break;
    }

    Duration difference = today.difference(tm);

    if (difference.compareTo(oneDay) < 1) {
      return "today";
    } else if (difference.compareTo(twoDay) < 1) {
      return "yesterday";
    } else if (difference.compareTo(oneWeek) < 1) {
      switch (tm.weekday) {
        case 1:
          return "monday";
        case 2:
          return "tuesday";
        case 3:
          return "wednesday";
        case 4:
          return "thurdsday";
        case 5:
          return "friday";
        case 6:
          return "saturday";
        case 7:
          return "sunday";
      }
    } else if (tm.year == today.year) {
      return '${tm.day} $month';
    } else {
      return '${tm.day} $month ${tm.year}';
    }
    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: <Widget>[
          Divider(height: 8.0,),
          ListTile(
            title: Text("Today's status"),
            subtitle: Text('31 queue completed in 5 hours'),
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
              child: RefreshIndicator(
                  onRefresh: _pullRefresh,
                  child:ListView.separated(
                    //padding: const EdgeInsets.only(bottom:30),
                    //itemCount:_apiResponse == null?1:_apiResponse.data.length,
                      itemCount:1,
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
//                      final todayDate = _apiResponse.data[index].queueDate;
//                      print(formatDate(todayDate, [yyyy, mm, dd]));
//                      final DateTime now = DateTime(_apiResponse.data[index].queueDate.toString());
//                      print(date(now));
                      return ItemCard(
                          Icons.closed_caption, 'Total in Queue' , _apiResponse.data[_apiResponse.data.length - 1].totalInQueue.toString());

//                      return ItemCard(
//                        _apiResponse.data[index].companyName,
//                        'Your Queue No is'+_apiResponse.data[index].queueNumber,
//                        _apiResponse.data[index].companylogo,
//                      );

                    },
                  )
              ),
            ),
//            child: Container(
//              height: 350.0,
//              child: ListView(
//                padding: EdgeInsets.all(0.0),
//                scrollDirection: Axis.vertical,
//                children: <Widget>[
//                  ItemCard(Icons.closed_caption, 'Total in Queue', _apiResponse.data[_apiResponse.data.length-1].totalInQueue.toString()),
//                  SizedBox(height: 8.0,),
//                 // ItemCard(Icons.queue, 'Current Queue', '1' ),
//                  SizedBox(height: 8.0,),
//               //   ItemCard(Icons.queue, 'time interval per queue', '5 mins'),
//                  SizedBox(height: 8.0,),
//                ],
//              ),
//            ),
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
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    if (_apiResponse.error) {
      return Center(child: Text(_apiResponse.errorMessage));
    }
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
//              CircleAvatar(
//                radius: 50.0,
//                backgroundImage: NetworkImage(_apiResponse.data[0].logo),
//              ),
              CircleAvatar(
                radius: 40,
                child: ClipOval(
                  child: Image.network(
                    _apiResponse.data[0].logo,
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                _apiResponse.data[0].companyName,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              SizedBox(
                height: 9.0,
              ),
              Text(
                '71 Grant Ave, Norwood, Johannesburg',
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
