import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutterapppraytime/list_jadwal.dart';
import 'package:http/http.dart' as http;

import 'header_content.dart';
import 'model/response_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Jadwal Shalat',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomeScreern());
  }
}

class MyHomeScreern extends StatefulWidget {
  @override
  _MyHomeScreernState createState() => _MyHomeScreernState();
}

class _MyHomeScreernState extends State<MyHomeScreern> {
  //controller text
  TextEditingController _locationController = TextEditingController();

  //request data
  Future<ResponseModel> getJadwal({String location}) async {
    String url =
        'https://api.pray.zone/v2/times/today.json?city=$location&school=9';
    final response = await http.get(url);
    final jsonResponse = json.decode(response.body);
    return ResponseModel.fromJsonMap(jsonResponse);
  }

  @override
  void initState() {
    if (_locationController.text.isEmpty || _locationController.text == null) {
      _locationController.text = "Purwokerto";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final header = Stack(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 6.0,
                      offset: Offset(0.0, 2.0),
                      color: Colors.black26)
                ],
                image: DecorationImage(
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5), BlendMode.luminosity),
                    image: AssetImage("images/mosque.jpg"))),
            child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: new Container(
                decoration:
                    new BoxDecoration(color: Colors.white.withOpacity(0.0)),
              ),
            )),
        Padding(
          padding: const EdgeInsets.only(top: 14.0, right: 14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Tooltip(
                message: 'Ubah Lokasi',
                child: IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.gps_fixed),
                    onPressed: () {
                      _showDialogLocation(context);
                    }),
              )
            ],
          ),
        ),
        FutureBuilder(
            future: getJadwal(
                location: _locationController.text.toLowerCase().toString()),
            builder: (context, AsyncSnapshot snapShot) {
              if (snapShot.hasData) {
                print(snapShot.data.toString());

                return HeaderContent(snapShot.data);
              } else if (snapShot.hasError) {
                print(snapShot.error);
                return Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'data tidak tersedia',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              }
              return Positioned.fill(
                  child: Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator()));
            }),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 40.0,
            width: 250.0,
            color: Colors.orange,
            margin: EdgeInsets.all(20.0),
            child: Align(
                child: Text(
              "FIND NEARBY MOSQUE",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
          ),
        )
      ],
    );
    return SafeArea(child: Scaffold(body: header));
  }

  _showDialogLocation(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Ubah lokasi'),
            content: TextField(
              controller: _locationController,
              decoration: InputDecoration(hintText: 'Masukan lokasi'),
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("CANCEL")),
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context, () {
                      setState(() {
                        getJadwal(
                            location: _locationController.text
                                .toLowerCase()
                                .toString());
                      });
                    });
                  },
                  child: Text("OK")),
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
          );
        });
  }
}
