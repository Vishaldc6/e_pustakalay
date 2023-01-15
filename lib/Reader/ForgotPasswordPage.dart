import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 50,),
              Image.asset('assets/images/book.png',height: 60,width: 60,),
              SizedBox(height: 10.0,),
              Text(
                'E-Pustakalay',
                style: GoogleFonts.josefinSans(
                  textStyle:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Text(
                'Forgot Password',
                style: GoogleFonts.josefinSans(
                  textStyle:TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(
                        style: GoogleFonts.josefinSans(
                            textStyle: TextStyle(
                                fontSize: 15.0
                            )
                        ),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.alternate_email_outlined),
                            hintText: "Enter E-mail",
                            labelText: "E-mail",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0)
                            )
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      TextFormField(
                        style: GoogleFonts.josefinSans(
                            textStyle: TextStyle(
                                fontSize: 15.0
                            )
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            hintText: "Enter New Password",
                            labelText: "New Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0)
                            )
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      TextFormField(
                        style: GoogleFonts.josefinSans(
                            textStyle: TextStyle(
                                fontSize: 15.0
                            )
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock_outline),
                            hintText: "Re-enter New Password",
                            labelText: "Confirm New Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(40.0)
                            )
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      RaisedButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        color: Colors.red[700],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Text("Login",
                          style: GoogleFonts.josefinSans(
                            fontWeight: FontWeight.w500,
                            textStyle:TextStyle(
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                      Column(
                        children: [
                          Text(
                            "Remember Your Password ?",
                            style: GoogleFonts.josefinSans(
                              fontWeight: FontWeight.w500,
                              textStyle:TextStyle(
                                  fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0,),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Go Back",
                              style: GoogleFonts.josefinSans(
                                textStyle:TextStyle(
                                    fontSize: 15,
                                    decoration:TextDecoration.underline,
                                    color: Colors.blue
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,)
                    ],
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
