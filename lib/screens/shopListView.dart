import 'package:flutter/material.dart';
import 'package:my_app/data/ShopList.dart';
import 'package:my_app/models/Users.dart';
import 'dart:async';
import '../models/Users.dart';
import '../data/network_util.dart';

class shopListView extends StatefulWidget {
  shopListView() : super();

  final String title = "Filter List Demo";

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
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(15.0),
              hintText: 'Filter by name or email',
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
              padding: EdgeInsets.all(10.0),
              itemCount: filteredShopsArray.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          filteredShopsArray[index].companyName,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          filteredShopsArray[index].address.city,
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
