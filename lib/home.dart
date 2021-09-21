import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalkulator_sederhana/about_me.dart';
import 'package:kalkulator_sederhana/kalkulator_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController _firstInputInput = TextEditingController();
  TextEditingController _secondInputInput = TextEditingController();

  List<Widget> _listPrima = [];

  _listPrimaItem(List<int> listData){
    _listPrima.clear();

    for(int i in listData){
      _listPrima.add(Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.deepOrange,
          borderRadius: BorderRadius.circular(40)
        ),
        child: FittedBox(
          child: Text(
            '$i',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ));
    }
    print(_listPrima.length);
  }


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _firstInputInput.dispose();
    _secondInputInput.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          physics: ClampingScrollPhysics(),
          child: Consumer<KalkulatorProvider>(
            builder: (context, data, _){
              _listPrimaItem(data.listPrima);

              return Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: MediaQuery.of(context).size.height * 0.2, bottom: 50),

                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Perhitungan bilangan prima dari 2 input bilangan',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30,),
                    Form(
                      key: _formKey ,
                      child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: _firstInputInput,
                              validator: (val){
                                if(val!.isEmpty){
                                  return 'Bilangan pertama tidak boleh kosong';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0)),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepOrangeAccent),
                                    borderRadius: BorderRadius.circular(13.0)),
                                hintText: 'Bilangan pertama',
                              ),
                            ),
                            SizedBox(height: 20.0,),
                            TextFormField(
                              controller: _secondInputInput,
                              validator: (val){
                                if(val!.isEmpty){
                                  return 'Bilangan kedua tidak boleh kosong';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.phone,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(13.0)),
                                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepOrangeAccent),
                                    borderRadius: BorderRadius.circular(13.0)),
                                hintText: 'Bilangan kedua',
                              ),
                            ),
                          ]
                      ),
                    ),
                    ///hitung
                    SizedBox(height: 20,),
                    ElevatedButton(
                      child: Text('Hitung', style: TextStyle(fontSize: 16, color: Colors.white),),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(300, 40),
                          primary: Colors.deepOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                          )
                      ),
                      onPressed: () {
                        if(_formKey.currentState!.validate()){

                          Provider.of<KalkulatorProvider>(context, listen: false)
                              .hitungBilanganPrima(nilaiAwal: int.parse(_firstInputInput.text), nilaiAkhir: int.parse(_secondInputInput.text));

                        }

                      },
                    ),

                    ///about me
                    SizedBox(height: 5,),
                    ElevatedButton(
                      child: Text('About Me', style: TextStyle(fontSize: 16, color: Colors.deepOrange),),
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(300, 40),
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            side: BorderSide(color: Colors.deepOrange)
                          )
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AboutMe()));

                      },
                    ),

                    SizedBox(height: 50,),

                    (_listPrima.isNotEmpty) ?
                    Text(
                      'Bilangan prima dari ${_firstInputInput.text} hingga ${_secondInputInput.text} adalah :',
                      style: TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ) : SizedBox(),
                    SizedBox(height: 20,),
                    Wrap(
                      children: _listPrima,
                      spacing: 5,
                      runSpacing: 5,
                    )
                  ],
                ),
              );
            },
          ),
        )
    );
  }

}