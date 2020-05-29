import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_app/screens/Signup.dart';
import 'package:my_app/screens/landingScreen.dart';
import 'package:my_app/screens/signupUserSelection.dart';
import 'package:my_app/utilities/styles.dart';
import 'package:my_app/data/service/Fieldvalidation_services.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  final _emailController =TextEditingController();
  final _passwordController =TextEditingController();
  String message ='';
  bool _validate =false;
  GlobalKey<FormState>_key=new GlobalKey();
  String errormessage ='';


   @override
   void dispose(){
     _emailController.dispose();
     _passwordController.dispose();
     super.dispose();
   }

  Widget _buildEmailTF() {
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
          child: TextFormField(
            controller: _emailController,
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
            validator : EmailValidator.validate,
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordTF() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextFormField(
            controller: _passwordController,
            obscureText: true,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'OpenSans',
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Password',
              hintStyle: kHintTextStyle,
            ),
            validator : PasswordValidator.validate,
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPasswordBtn() {
    return Container(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () => print('Forgot Password Button Pressed'),
        padding: EdgeInsets.only(right: 0.0),
        child: Text(
          'Forgot Password?',
          style: kLabelStyle,
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Container(
      height: 20.0,
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.green,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            'Remember me',
            style: kLabelStyle,
          ),
        ],
      ),
    );
  }
void _showAlertforsignin(){
  showDialog(context: context,
  barrierDismissible:false,
  builder: (BuildContext context)
  {
    return AlertDialog(
      
      title : new Text('Wrong user name and password'),
      content : new Text('Please provide correct username and try agian'),
      actions: <Widget>[
        new FlatButton(
          onPressed: () =>Navigator.of(context).pop(), 
        child: new Text('Try Again'
        ))
               
      ],


    );
  }
  );
  
  
}
  Widget _buildLoginBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
           if (_key.currentState.validate()  ){
           
            if(_emailController.text == "123" && _passwordController.text == "123"){
                print('Login Button Pressed');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => landingScreen()),
                );          
           }
           else 
           {
              _showAlertforsignin();
           }
           
        } return null;
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'LOGIN',
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
//              blurRadius: 6.0,
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

  Widget _buildSignupBtn() {
    return GestureDetector(
      onTap: (){
        print('Login Button Pressed');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => SignupUserSelectionScreen()),
        );
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                   child :new Form(key: _key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSans',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 30.0),
                      _buildEmailTF(),
                      SizedBox(
                        height: 30.0,
                      ),
                      _buildPasswordTF(),
                      _buildForgotPasswordBtn(),
                      _buildRememberMeCheckbox(),
                      _buildLoginBtn(),
                      //_buildSignInWithText(),
                     // _buildSocialBtnRow(),
                      _buildSignupBtn(),
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
