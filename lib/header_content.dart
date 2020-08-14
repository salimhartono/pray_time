import 'package:flutter/material.dart';
import 'package:flutterapppraytime/list_jadwal.dart';
import 'package:flutterapppraytime/text_style.dart';
import 'package:intl/intl.dart';

import 'model/response_model.dart';

class HeaderContent extends StatelessWidget {
  ResponseModel response;

  HeaderContent(this.response);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat().add_jm().format(now);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 50, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(response.results.location.city, style: styleCityHeader),
          Row(
            children: <Widget>[
              Icon(
                Icons.location_on,
                color: Colors.orange,
                size: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(response.results.location.country,
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 16.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                    softWrap: false),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(formattedDate,
                style: TextStyle(fontSize: 40.0, color: Colors.white70)),
          ),
          Expanded(child: ListJadwal(response))
        ],
      ),
    );
  }
}
