import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:io';
import 'dart:async';

class QRDetailWidget extends StatefulWidget  {

  String _filePath;
  QRDetailWidget(this._filePath);

  @override
  State<StatefulWidget> createState() {
    return _DetailState();
  }

}

class _DetailState extends State<QRDetailWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Detail'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {

                final channel = const MethodChannel('channel:me.alfian.share/share');
                channel.invokeMethod('shareFile', 'image.png');

              },
            )

          ],
        ),
        body: Container(
          child: SizedBox(
            height: 500.0,
            child: new Center(
                child: widget._filePath == null
                    ? Text('No Image')
                    : Container(
                    child: Image.file(File(widget._filePath), fit: BoxFit.fitWidth))
            ),
          ),
        )
    );

  }

}