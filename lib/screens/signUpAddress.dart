import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/data/network_util.dart';
import 'package:my_app/data/signupModel.dart';
import 'package:my_app/login_rest_ds.dart';
import 'package:my_app/models/api_response.dart';
import 'package:my_app/screens/login.dart';
import 'package:my_app/utilities/StorageUtil.dart';
import 'package:my_app/utilities/styles.dart';
import 'package:my_app/data/service/Fieldvalidation_services.dart';


class SignupAddressScreen extends StatefulWidget {

  final String password;
  final String mobileNumber;
  final String userName;
  final String email;

  SignupAddressScreen(this.password, this.mobileNumber, this.userName, this.email);

  @override
  _SignupAddressScreenState createState() => _SignupAddressScreenState();
}
GlobalKey<FormState>_key=new GlobalKey();

class _SignupAddressScreenState extends State<SignupAddressScreen> {

  static const String _title = 'Sign Up';
  bool _isLoading = false;
  final _addressController =TextEditingController();
  final _pincodeController =TextEditingController();
  final _firstNameController =TextEditingController();
  final _lastNameController =TextEditingController();
  //final _userType = 'GENERAL_USER';



  // receive data from the FirstScreen as a parameter




  Widget _buildAddressTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Address',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
              keyboardType: TextInputType.phone,
              controller: _addressController,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.mobile_screen_share,
                  color: Colors.white,
                ),
                hintText: 'Enter your Address',
                hintStyle: kHintTextStyle,
              ),
              validator :Commanvalidator.validate
          ),
        ),
      ],
    );
  }
  Widget _buildPinCodeTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Pincode',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
              controller: _pincodeController,
              keyboardType: TextInputType.phone,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.mobile_screen_share,
                color: Colors.white,
              ),
              hintText: 'Enter your Postal Code',
              hintStyle: kHintTextStyle,
            ),
             validator :Commanvalidator.validate
          ),
        ),
      ],
    );
  }
  Widget _buildFirstNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'First Name',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
              controller: _firstNameController,
              keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.white,
              ),
              hintText: 'Enter your First Name',
              hintStyle: kHintTextStyle,
            ),
             validator :Commanvalidator.validate
          ),
        ),
      ],
    );
  }

  Widget _buildLastNameTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Surname',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
              controller: _lastNameController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                hintText: 'Enter your Surname',
                hintStyle: kHintTextStyle,
              ),
              validator :Commanvalidator.validate
          ),
        ),
      ],
    );
  }

  Widget _buildNextBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed:  () async {
          await StorageUtil.getInstance();
          setState(() {
              _isLoading = true;
            });
            final _userType = StorageUtil.getString('userSelection');
            final note = signupModel(
                cellphoneNumber: widget.mobileNumber,
                emailAddress: widget.email,
                locationPin: _addressController.text,
                name: _firstNameController.text,
                password: widget.password,
                postalCode: _pincodeController.text,
                surname:_lastNameController.text,
                type:_userType,
                username:widget.userName,
            );
            print(note.password+note.username+note.emailAddress+note.surname+note.type+note.cellphoneNumber+note.locationPin+note.postalCode+note.type);
            final  APIResponse<bool> result = await createSignUpUser(note);

            setState(() {
              _isLoading = false;
            });

            final title = 'Done';
            final text = result.error ? (result.errorMessage ?? 'An error occurred') : 'User has been created';
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                  title: Text(title),
                  content: Text(text),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Ok'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
                        );
                       // Navigator.of(context).pop( Navigator.of(context).pop());
                        //Navigator.of(context, rootNavigator: true).pop(context);
                      },
                    )
                  ],
                )
            )
                .then((data) {
              if (result.data) {
                Navigator.of(context).pop();
              }
            });
          },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Submit',
          style: TextStyle(
            color: Color(0xFF527DAA),
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          '- OR -',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          'Sign in with',
          style: kLabelStyle,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(_title)),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child:  _isLoading ? Center(child: CircularProgressIndicator()) : Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF73AEF5),
                      Color(0xFF61A4F1),
                      Color(0xFF478DE0),
                      Color(0xFF398AE5),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 20.0,
                  ),
                  child: Form(key: _key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildAddressTF(),
                      const SizedBox(height: 30.0),
                      _buildPinCodeTF(),
                      const SizedBox(height: 30.0),
                      _buildFirstNameTF(),
                      const SizedBox(height: 30.0),
                      _buildLastNameTF(),
                      const SizedBox(height: 30.0),
                      _buildNextBtn(),
                    ],
                  ),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}