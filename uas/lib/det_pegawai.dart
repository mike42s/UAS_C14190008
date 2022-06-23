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
                  "\ncpubdate : " +
                  widget.isiDataFinal[widget.index].cpubdate +
                  "\ncdesc : " +
                  widget.isiDataFinal[widget.index].cdesc +
                  "\ncthumbnail : " +
                  widget.isiDataFinal[widget.index].cthumbnail +
                  "\nlink : " +
                  widget.isiDataFinal[widget.index].link),
              Image.network(widget.isiDataFinal[widget.index].cthumbnail),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                    final dtLike = pegawai(
                      link: widget.isiDataFinal[widget.index].link.toString(),
                      ctitle:
                          widget.isiDataFinal[widget.index].ctitle.toString(),
                      cpubdate:
                          widget.isiDataFinal[widget.index].cpubdate.toString(),
                      cdesc: widget.isiDataFinal[widget.index].cdesc.toString(),
                      cthumbnail: widget.isiDataFinal[widget.index].cthumbnail
                          .toString(),
                    );
                    print(dtLike);
                    Database.tambahData(KTM: dtLike);
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => detData()));
                  },
                  child: Text("Like"))
            ],
          ),
        ),
      ),
    );
  }
}
