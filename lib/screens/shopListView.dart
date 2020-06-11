import 'package:flutter/material.dart';
import 'package:line_awesome_icons/line_awesome_icons.dart';
import 'package:my_app/data/ShopList.dart';
import 'package:my_app/screens/bookingConfirmation.dart';
import 'package:my_app/utilities/styles.dart';
import 'dart:async';
import '../data/network_util.dart';

class shopListView extends StatefulWidget {
  shopListView() : super();

  final String title = 'Near by shops';

  @override
  shopListViewState createState() => shopListViewState();
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class shopListViewState extends State<shopListView> {
  //
  final _debouncer = Debouncer(milliseconds: 500);
  List<ShopList> shopListArray = List();
  List<ShopList> filteredShopsArray = List();
  List<ShopList> selectedArray;

  var color1 = Color(0xFFa572c0);
  var color2 = Color(0xFF6559d4);

  @override
  void initState() {
    super.initState();
    Services.getShopList().then((usersFromServer) {
      setState(() {
        shopListArray = usersFromServer.cast<ShopList>();
        filteredShopsArray = shopListArray;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(25.0),
              hintText: 'Filter by name or address',
            ),
            onChanged: (string) {
              _debouncer.run(() {
                setState(() {
                  filteredShopsArray = shopListArray
                      .where((u) => (u.companyName
                      .toLowerCase()
                      .contains(string.toLowerCase()) ||
                      u.address.city.toLowerCase().contains(string.toLowerCase())))
                      .toList();
                });
              });
            },
          ),
          Expanded(
            child: ListView.builder(
             // padding: EdgeInsets.all(10.0),
              itemCount: filteredShopsArray.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child:InkWell(
                    onTap: () {
                      // Function is executed on tap.
                      setState(() {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => bookingConfirmation(),
                            settings: RouteSettings(
                              arguments: filteredShopsArray[index],
                            )
                          ),
                        );
                      });
                    },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
//                  margin: EdgeInsets.only(
//                    bottom: 20.0,
//                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0),
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [color1, color2]),
                ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            child: Image.network(
                              filteredShopsArray[index].logo,
                              width: 60,
                              height: 60,
                              fit: BoxFit.contain,
                            ),
                          ),
//                          CircleAvatar(
//                            backgroundColor: Color(0xFFD9D9D9),
//                            backgroundImage: NetworkImage(filteredShopsArray[index].logo),
//                            radius: 36.0,
//                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  text: 'Retail\n',
                                  style: TextStyle(
                                    color: Colors.greenAccent,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    height: 1.3,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: filteredShopsArray[index].companyName,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '\n',
                                      style: TextStyle(
                                        color: Colors.white54,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                      ),
                                    ),
                                    TextSpan(
                                      text: filteredShopsArray[index].address.city,
                                      style: TextStyle(
                                        color: Colors.white54,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 6.0,
                              ),
                              RaisedButton(
                                onPressed: () {},
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(80.0)),
                                padding: const EdgeInsets.all(0.0),
                                child: Ink(
                                  decoration: const BoxDecoration(
                                    gradient: roundedGradient,
                                    borderRadius: BorderRadius.all(Radius.circular(80.0)),
                                  ),
                                  child: Container(
                                    constraints: const BoxConstraints(
                                        minWidth: 88.0,
                                        minHeight: 36.0), // min sizes for Material buttons
                                    alignment: Alignment.center,
                                    child: const Text(
                                      'Book Queue',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          fontSize: 13,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(
                        LineAwesomeIcons.heart,
                        color: Colors.white70,
                        size: 36,
                      ),
                    ],
                  ),
//                )
//                  );
//              //  child: Container(
//                height: 80.0,
//                width: 60.0,
//                decoration: BoxDecoration(
//                gradient: LinearGradient(
//                begin: Alignment.topRight,
//                end: Alignment.bottomLeft,
//                colors: [color1, color2])),
//                child: Padding(
//                    padding: EdgeInsets.all(10.0),
//                    child: Column(
//                      mainAxisAlignment: MainAxisAlignment.start,
//                      crossAxisAlignment: CrossAxisAlignment.start,
//                      children: <Widget>[
//                        Text(
//                          filteredShopsArray[index].companyName,
//                          style: TextStyle(
//                            fontSize: 16.0,
//                            color: Colors.white,
//                          ),
//                        ),
//
//                        SizedBox(
//                          height: 5.0,
//                        ),
//                        Text(
//                          filteredShopsArray[index].address.city,
//                          style: TextStyle(
//                            fontSize: 14.0,
//                            color: Colors.white54,
//                          ),
//                        ),
//                      ],
//                    ),
//                  ),
//                ),
                  ),
                )
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
