import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_app/data/bookSomeoneRequest.dart';
import 'package:my_app/data/bookSomeoneResponse.dart';
import 'package:my_app/data/signupModel.dart';
import 'package:my_app/login_rest_ds.dart';
import 'package:my_app/models/api_response.dart';
import 'package:my_app/screens/bookedAssistanceQueues.dart';
import 'package:my_app/utilities/AlertUtil.dart';
import 'package:my_app/utilities/StorageUtil.dart';


class bookForSomeoneEntry extends StatefulWidget {

  @override
  _bookForSomeoneEntryState createState() => _bookForSomeoneEntryState();
}

var color1 = Color(0xFFa572c0);
var color2 = Color(0xFF6559d4);
bool _isLoading = false;
final _customerNameController =TextEditingController();
final _surnameController =TextEditingController();
final _phoneController =TextEditingController();
final _emailController =TextEditingController();

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
                      hintText: 'Enter customer first',
                      labelText: 'Customer Name',
                    ),
                    controller: _customerNameController,
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.person),
                      hintText: 'Enter your Surname',
                      labelText: 'Surname',
                    ),
                    controller: _surnameController,
                  ),
                  new TextFormField(
                    decoration: const InputDecoration(
                      icon: const Icon(Icons.phone),
                      hintText: 'Enter a phone number',
                      labelText: 'Phone',
                    ),
                    keyboardType: TextInputType.phone,
                    controller: _phoneController,
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
                    controller: _emailController,
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


                        onPressed:  () async {
                          await StorageUtil.getInstance();
//                          setState(() {
//                            _isLoading = true;
//                          });
                          final _companyId = StorageUtil.getString('companyId');
                          final note = bookSomeoneRequest(
                            cellphoneNumber: _phoneController.text,
                            emailAddress: _emailController.text,
                            surname: _surnameController.text,
                            name: _customerNameController.text,
                            companyId: int.parse(_companyId),
                          );
                          //print(note.password+note.username+note.emailAddress+note.surname+note.type+note.cellphoneNumber+note.locationPin+note.postalCode+note.type);
                          final  APIResponse<bookSomeoneResponse> result = await createQueueForSomeone(note);

//                          setState(() {
//                            _isLoading = false;
//                          });
                          final title = result.error ?'Info' : 'Done';
                          final text = result.error ? 'An active queue setup already exists for the day' : 'Queue has been booked,the queue id is'+result.data.queueId.toString();
//                          final title = 'Done';
//                          final text = result.error ? (result.errorMessage ?? 'An error occurred') : 'Queue has been book,the queue id is'+result.data.queueId.toString();
                          showAlertDialog(this.context, title, text);
//                          showDialog(
//                              context: context,
//                              builder: (_) => AlertDialog(
//                                title: Text(title),
//                                content: Text(text),
//                                actions: <Widget>[
//                                  FlatButton(
//                                    child: Text('Ok'),
//                                    onPressed: () {
////                                      Navigator.push(
////                                        context,
////                                        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
////                                      );
//                                      // Navigator.of(context).pop( Navigator.of(context).pop());
//                                      //Navigator.of(context, rootNavigator: true).pop(context);
//                                    },
//                                  )
//                                ],
//                              )
//                          )
//                              .then((data) {
//                            if (result.data) {
//                              Navigator.of(context).pop();
//                            }
//                          }
                          //),
                        }
                       // splashColor: Colors.redAccent,
                      )),
                ],
              ))),
    );
  }
}
//
//
//class newContact {
//  String name;
//  String age;
//  String time;
//  String preference;
//
//  newContact({this.name, this.age, this.time, this.preference});
//}
