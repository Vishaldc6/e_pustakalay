import 'package:e_pustakalay/Model/api_response.dart';
import 'package:e_pustakalay/Reader/HomePage.dart';
import 'package:e_pustakalay/Reader/LoginPage.dart';
import 'package:e_pustakalay/Service/user_service.dart';
import 'package:e_pustakalay/constatnt.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({Key? key}) : super(key: key);

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {


  void _loadUserInfo() async{
    String token=await getToken();
    if(token==""){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);
    }else{
      ApiResponse response=await getuserDetail();
      if(response.error==null){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>HomePage()), (route) => false);
      }else if(response.error==unauthorized){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);
      }else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('${response.error}')));
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUserInfo();
  }

  @override
  Widget build(BuildContext context) {

    var h=MediaQuery.of(context).size.height;
    var w=MediaQuery.of(context).size.width;


    return Container(
      height: h,
      width: w,
      color: Colors.grey[300],
      child: Material(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
               Navigator.of(context).pushNamed("/login");
              },
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset("assets/images/read.png",height: h/6,),
                      SizedBox(height: 10.0,),
                      Text(
                        "Reader",
                        style: GoogleFonts.josefinSans(
                          textStyle: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold
                          )
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).pushNamed("/authorlogin");
              },
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset("assets/images/author.png",height: h/6,),
                      SizedBox(height: 10.0,),
                      Text(
                        "Author",
                        style: GoogleFonts.josefinSans(
                            textStyle: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold
                            )
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
