import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMe extends StatefulWidget {

  @override
  _AboutMe createState() => _AboutMe();
}

class _AboutMe extends State<AboutMe>{

  void _launchURL(String url) async {
    await canLaunch(url) ?
    await launch(url) :
    throw 'Could not launch $url';
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('About Me'),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.chevron_left),
        ),
      ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child:
                    Image.asset(
                      'assets/foto.jpeg',
                      fit: BoxFit.cover,
                    )
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'Hafiz Zafar Ahmad',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 3,),
              Text(
                'hafizzafarahmad@gmail.com',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      _launchURL("https://github.com/hafizzafarahmad/calculator_sederhana");
                    },
                    child: Text(
                      'GitHub',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                        color: Colors.lightBlueAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(width: 20,),
                  GestureDetector(
                    onTap: (){
                      _launchURL("https://www.linkedin.com/in/hafiz-zafar-ahmad-422111180/");
                    },
                    child: Text(
                      'Linkedin',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 14,
                        color: Colors.lightBlueAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )
            ],
          )
        ),
    );

  }
}