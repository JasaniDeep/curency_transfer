
// import 'dart:js';

import 'dart:convert';

import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: frist(),
  ));
}

class frist extends StatefulWidget {
  const frist({Key? key}) : super(key: key);

  @override
  State<frist> createState() => _fristState();
}

class _fristState extends State<frist> {
  String first="USD";
  final buttonHeight = 60.0;
  String second="INR";
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100,
              margin: EdgeInsets.fromLTRB(20, 60, 0, 0),
              child: Text(
                "Currency Converter",textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              height: 450,
              width: double.infinity,
              margin: EdgeInsets.only(left: 10,right: 10),

              child: Column(
                children: [
                  Container(
                    height: 225,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Color(0xffec5100),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                    ),
                    child: Column(
                      children: [
                        Container(
                            height: 80,
                            width: double.infinity,
                            margin: EdgeInsets.only(left: 10,right: 10),
                            child: InkWell(
                              onTap:() {
                                showCurrencyPicker(
                                  context: context,
                                  showFlag: true,
                                  showCurrencyName: true,
                                  showCurrencyCode: true,
                                  onSelect: (Currency currency) {
                                    print('Select currency: ${currency.name}');
                                    setState((){
                                      first=currency.code;
                                    });
                                  },
                                );
                              },
                              child: Row(
                                children: [
                                  Container(
                                    height: double.infinity,
                                    width: 60,

                                    decoration: BoxDecoration(
                                        color: Colors.deepPurple,
                                        border: Border.all(width: 3,color: Color(0xffdedede))
                                    ),
                                    margin: EdgeInsets.fromLTRB(10, 15, 0, 0),
                                  ),
                                  Expanded(child: Container(
                                    height: double.infinity,
                                    width: double.infinity,
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(top: 15),
                                    // color: Colors.white60,
                                    child: Text("$first",style: TextStyle(fontSize: 20),textAlign: TextAlign.center),
                                  )),
                                  Container(
                                    height: double.infinity,
                                    width: 50,
                                    margin: EdgeInsets.only(top: 15),
                                    decoration: BoxDecoration(
                                        color: Colors.deepPurple,
                                        border: Border.all(width: 3,color: Color(0xffdedede))
                                    ),
                                    child: Icon(Icons.arrow_drop_down,size: 30,),
                                  )
                                ],
                              ),
                            )
                        ),
                        Expanded(child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
                          color: Color(0xffec5100),
                          child: TextField(
                              controller: t1,
                              decoration:InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                  disabledBorder: InputBorder.none
                              )
                          ),
                        ))
                      ],
                    ),
                  ),

                  Stack(
                    children: [
                      // Use same background color like the second container
                      Container(
                        height: 225,
                        // color: Color(0xffdedede)
                        decoration: BoxDecoration(
                            color: Color(0xffdedede),
                            //   color: Colors.black,
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30))
                        ),
                        child: Column(
                          children: [
                            Expanded(child: Container(
                                height: double.infinity,
                                width: double.infinity,
                                color:Color(0xffdedede),
                                margin: EdgeInsets.fromLTRB(20, 60, 20, 0),
                                child: TextField(
                                  controller: t2,
                                  decoration:InputDecoration(
                                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                      disabledBorder: InputBorder.none
                                  ) ,
                                )),
                            ),
                            Container(
                                height: 80,
                                width: double.infinity,
                                margin: EdgeInsets.only(left: 10,right: 10),
                                child: InkWell(
                                  onTap:() {
                                    showCurrencyPicker(
                                      context: context,
                                      showFlag: true,
                                      showCurrencyName: true,
                                      showCurrencyCode: true,
                                      onSelect: (Currency currency) {
                                        print('Select currency: ${currency.name}');
                                        setState((){second=currency.code;});
                                      },
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: double.infinity,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.deepPurple,
                                            border: Border.all(width: 3,color: Color(0xffec5100))
                                        ),
                                        margin: EdgeInsets.fromLTRB(10, 0, 0, 15),
                                      ),
                                      Expanded(child: Container(
                                        height: double.infinity,
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(bottom: 10),
                                        // color: Colors.white60,
                                        child: Text("$second",style: TextStyle(fontSize: 20),textAlign: TextAlign.center),
                                      )),
                                      Container(
                                        height: double.infinity,
                                        width: 50,
                                        margin: EdgeInsets.only(bottom: 15),
                                        decoration: BoxDecoration(
                                            color: Colors.deepPurple,
                                            border: Border.all(width: 3,color: Color(0xffec5100))
                                        ),
                                        child: Icon(Icons.arrow_drop_down,size: 30,),
                                      )
                                    ],
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                      // / Translate the button
                      Transform.translate(
                        offset: Offset(0.0, -buttonHeight / 2.0),
                        child: Center(
                          child: GestureDetector(
                            onTap: () { /* do stuff */ },
                            child: Container(
                              height: buttonHeight,
                              decoration: BoxDecoration(
                                color: Colors.orange[400],
                                borderRadius: BorderRadius.circular(buttonHeight / 2.0),
                                border: Border.all(width: 5,color: Colors.white),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 16.0,
                                    offset: Offset(0.0, 6.0),
                                    color: Colors.black.withOpacity(0.16),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.fromLTRB(24.0, 3.0, 24.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.cached_rounded,
                                    size: 40,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ElevatedButton(onPressed: () async {

              var url = Uri.parse('https://jdflutter.000webhostapp.com/currency.php');
              var response = await http.post(url, body: {'to': '$second', 'from': '$first','amount':'${t1.text}'});
              print('Response status: ${response.statusCode}');
              print('Response body: ${response.body}');
              Map m=jsonDecode(response.body);
              String amo=m['result'].toString();
              t2.text=amo;
            }, child: Text("Convert"))
          ],
        ),
      )
    );
  }
}


// php code
// <?php
//
// $to=$_POST['to'];
// $from=$_POST['from'];
// $amount=$_POST['amount'];
// $curl = curl_init();
//
// curl_setopt_array($curl, array(
// CURLOPT_URL => "https://api.apilayer.com/currency_data/convert?to=$to&from=$from&amount=$amount",
// CURLOPT_HTTPHEADER => array(
// "Content-Type: text/plain",
// "apikey: vUqgBNVkTlUcDxavnaYBFXKAVCKlNYFE"
// ),
// CURLOPT_RETURNTRANSFER => true,
// CURLOPT_ENCODING => "",
// CURLOPT_MAXREDIRS => 10,
// CURLOPT_TIMEOUT => 0,
// CURLOPT_FOLLOWLOCATION => true,
// CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
// CURLOPT_CUSTOMREQUEST => "GET"
// ));
//
// $response = curl_exec($curl);
//
// curl_close($curl);
// echo $response;
//
// ?>