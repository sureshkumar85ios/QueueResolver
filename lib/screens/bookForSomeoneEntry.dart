import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/screens/bookedAssistanceQueues.dart';


class bookForSomeoneEntry extends StatefulWidget {

  @override
  _bookForSomeoneEntryState createState() => _bookForSomeoneEntryState();
}

var color1 = Color(0xFFa572c0);
var color2 = Color(0xFF6559d4);

class _bookForSomeoneEntryState extends State<bookForSomeoneEntry> {

  List<String> _slot = <String>['', 'red', 'green', 'blue', 'orange'];
  String _color = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Book Queue For someone'),

      ),
      backgroundColor: Colors.white,
      body: new SafeArea(
          top: false,
          bottom: false,
          child: new Form(
              autovalidate: true,
              child: new ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                children: <Widget>[
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Enter customer first and last name',
                      labelText: 'Customer Name',
                    ),
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.calendar_today),
                      hintText: 'Enter your booking time',
                      labelText: 'Time',
                    ),
                    keyboardType: TextInputType.datetime,
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.phone),
                      hintText: 'Enter a phone number',
                      labelText: 'Phone',
                    ),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [
                      WhitelistingTextInputFormatter.digitsOnly,
                    ],
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.email),
                      hintText: 'Enter a email address',
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
//                  new FormField(
//                    builder: (FormFieldState state) {
//                      return InputDecorator(
//                        decoration: InputDecoration(
//                          icon: const Icon(Icons.color_lens),
//                          labelText: 'Color',
//                        ),
//                        isEmpty: _color == '',
//                        child: new DropdownButtonHideUnderline(
//                          child: new DropdownButton(
//                            value: _color,
//                            isDense: true,
//                            onChanged: (String newValue) {
//                              setState(() {
//                                //newContact.name = newValue;
//                                _color = newValue;
//                                state.didChange(newValue);
//                              });
//                            },
//                            items: _slot.map((String value) {
//                              return new DropdownMenuItem(
//                                value: value,
//                                child: new Text(value),
//                              );
//                            }).toList(),
//                          ),
//                        ),
//                      );
//                    },
//                  ),
                  new Container(
                      padding: const EdgeInsets.only(left: 40.0, top: 20.0),
                      child: MaterialButton(
                        height: 40.0,
                        minWidth: 70.0,
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: new Text("Book Queue"),
                        onPressed: () => {},
                        splashColor: Colors.redAccent,
                      )),
                ],
              ))),
    );
  }
}


class newContact {
  String name;
  String age;
  String time;
  String preference;

  newContact({this.name, this.age, this.time, this.preference});
}
