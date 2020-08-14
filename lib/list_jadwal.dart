import 'package:flutter/material.dart';
import 'package:flutterapppraytime/model/response_model.dart';
import 'package:flutterapppraytime/text_style.dart';

class ListJadwal extends StatelessWidget {
  ResponseModel _responseModel;

  ListJadwal(this._responseModel);

  Widget containerWaktu(String waktu, String jam) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        height: 50,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white30),
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(waktu, style: styleTimeText),
            Text(jam, style: styleListText)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 25.0),
      children: <Widget>[
        containerWaktu("Subuh",
            _responseModel.results.datetime[0].times.Fajr.toUpperCase()),
        containerWaktu("Dzuhur",
            _responseModel.results.datetime[0].times.Dhuhr.toUpperCase()),
        containerWaktu("Ashar",
            _responseModel.results.datetime[0].times.Asr.toUpperCase()),
        containerWaktu("Magrib",
            _responseModel.results.datetime[0].times.Maghrib.toUpperCase()),
        containerWaktu("Isya",
            _responseModel.results.datetime[0].times.Isha.toUpperCase()),
      ],
    );
  }
}
