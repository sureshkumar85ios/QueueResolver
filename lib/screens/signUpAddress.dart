import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/Helper/genderSelection.dart';
import 'package:my_app/screens/signUpAddress.dart';
import 'package:my_app/utilities/styles.dart';

class SignupAddressScreen extends StatefulWidget {
  @override
  _SignupAddressScreenState createState() => _SignupAddressScreenState();
}

class _SignupAddressScreenState extends State<SignupAddressScreen> {

  static const String _title = 'Sign Up';

  Widget _buildPinCodeTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'MobileNo',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
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
              hintText: 'Enter your Mobile No',
              hintStyle: kHintTextStyle,
            ),
          ),
        ),
      ],
    );
  }
  Widget _buildAgeTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
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
              hintText: 'Enter your Email',
              hintStyle: kHintTextStyle,
            ),
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
        onPressed: () {
          print('next Button Pressed');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => SignupAddressScreen()),
          );
        },        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Next',
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




//  Widget _buildSocialBtn(Function onTap, AssetImage logo) {
//    return GestureDetector(
//      onTap: onTap,
//      child: Container(
//        height: 60.0,
//        width: 60.0,
//        decoration: BoxDecoration(
//          shape: BoxShape.circle,
//          color: Colors.white,
//          boxShadow: [
//            BoxShadow(
//              color: Colors.black26,
//              offset: Offset(0, 2),
//              blurRadius: 6.0,Ω
//            ),
//          ],
//          image: DecorationImage(
//            image: logo,
//          ),
//        ),
//      ),
//    );
//  }

//  Widget _buildSocialBtnRow() {
//    return Padding(
//      padding: EdgeInsets.symmetric(vertical: 30.0),
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        children: <Widget>[
//          _buildSocialBtn(
//                () => print('Login with Facebook'),
//            AssetImage(
//              'assets/image/facebook.jpg',
//            ),
//          ),
//          _buildSocialBtn(
//                () => print('Login with Google'),
//            AssetImage(
//              'assets/images/google.jpg',
//            ),
//          ),
//        ],
//      ),
//    );
//  }

  Widget _buildGenderOptionBtn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Choose your Gender',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        GenderSelection(
          maleText: "Male", //default Male
          femaleText: "Female", //default Female
          linearGradient: roundedGradient,
          selectedGenderIconBackgroundColor: Colors.indigo, // default red
          checkIconAlignment: Alignment.bottomCenter,   // default bottomRight
          selectedGenderCheckIcon: Icons.check, // default Icons.check
          onChanged: (Gender gender){
            print(gender);
          },
          equallyAligned: true,
          animationDuration: Duration(milliseconds: 400),
          isCircular: true, // default : true,
          isSelectedGenderIconCircular: true,
          opacityOfGradient: 0.6,
          padding: const EdgeInsets.all(3),
          size: 120, //default : 120
        )
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
          child: Stack(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      _buildPinCodeTF(),
                      const SizedBox(height: 30.0),
                      _buildAgeTF(),
                      const SizedBox(height: 30.0),
                      _buildGenderOptionBtn(),
                      const SizedBox(height: 30.0),
                      _buildNextBtn(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}