import 'package:flutter/material.dart';
import 'package:uas/dbservices.dart';

import 'class.dart';

class detail_pegawai extends StatefulWidget {
  final List<pegawai> isiDataFinal;
  final index;
  const detail_pegawai(
      {Key? key, required this.isiDataFinal, required this.index})
      : super(key: key);
  @override
  State<detail_pegawai> createState() => _detail_pegawaiState();
}

class _detail_pegawaiState extends State<detail_pegawai> {
  //final List<pegawai> isiDataFinal2 = widget.isiDataFinal;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hasil Detail Data",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hasil Detail Data"),
        ),
        body: Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text("ctitle : " +
                  widget.isiDataFinal[widget.index].ctitle +
                  "cpubdate : " +
                  widget.isiDataFinal[widget.index].cpubdate +
                  "\cdesc : " +
                  widget.isiDataFinal[widget.index].cdesc +
                  "\cthumbnail : " +
                  widget.isiDataFinal[widget.index].cthumbnail +
                  "\link : " +
                  widget.isiDataFinal[widget.index].link),
              Image.network(widget.isiDataFinal[widget.index].cthumbnail),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      //Database.tambahData(KTM: KTM)
                    });
                  },
                  child: Text("Like"))
            ],
          ),
        ),
      ),
    );
  }
}
