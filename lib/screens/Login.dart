import 'package:flutter/material.dart';
import 'package:predicoin/screens/Signup.dart';
import 'package:predicoin/screens/Landing.dart';
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SingleChildScrollView(
            child: Column(
                children: [
                  Image.asset("assets/logo/predicoin.png",width: 200.0, height: 200.0),
                  Padding(padding: const EdgeInsets.only(bottom: 2),
                    child: Text(
                      'Sign in',
                      style: TextStyle(fontFamily: 'Ruda', fontSize: 20),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(40),
                    child: ElevatedButton.icon(onPressed: (){

                    },style: ElevatedButton.styleFrom(primary: Colors.white),
                      icon: Icon(Icons.g_mobiledata, color: Colors.black,),
                        label: Text(
                      'Sign in with google',
                          style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.only(bottom: 40),
                    child: Text(
                      'Or',
                      style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold, fontFamily: 'Ruda', fontSize: 25),
                    ),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(40, 2, 40, 8),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.black, width: 3)
                        ),
                        labelText: 'Username',
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(40, 10, 40, 8),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.black, width: 3)
                        ),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  Align(
                    child: Container(
                      margin: const EdgeInsets.all(40),
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                          return LandingPage();
                        }),
                        );
                      },style: ButtonStyle(
                        // shape: MaterialStateProperty.all(
                        //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                        backgroundColor: MaterialStateProperty.all(Color(0xFF4262FF)),
                      ),
                        child: const Text('Sign in',style: TextStyle(color: Colors.white,
                          fontSize: 20,
                        ),),
                    ),
                  ),
                  ),
                  Padding(padding: const EdgeInsets.only(),
                    child: Text(
                      'Don’t have an account ?',
                      style: TextStyle(fontFamily: 'Ruda', fontSize: 20),
                    ),
                  ),
                  Align(
                    child: Container(
                      margin: const EdgeInsets.fromLTRB(40, 0 ,40, 40),
                      height: 55,
                      width: double.infinity,
                      child: ElevatedButton(onPressed: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                          return SignupPage();
                        }),
                        );
                      },style: ButtonStyle(
                        // shape: MaterialStateProperty.all(
                        //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                        backgroundColor: MaterialStateProperty.all(Color(0xFF4262FF)),
                      ),
                        child: const Text('Sign up',style: TextStyle(color: Colors.white,
                          fontSize: 20,
                        ),),
                      ),
                    ),
                  ),
                ],
            ),
          ),
      ),
    );
  }
}
