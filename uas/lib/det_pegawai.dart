import 'package:flutter/material.dart';
import 'package:uas/dbservices.dart';
import 'package:uas/like.dart';
import 'package:uas/main.dart';

import 'class.dart';
import 'navbar.dart';

class detail_pegawai extends StatefulWidget {
  final List<pegawai>? isiDataFinal;
  final index;
  const detail_pegawai({
    Key? key,
    this.isiDataFinal,
    this.index,
  }) : super(key: key);
  @override
  State<detail_pegawai> createState() => _detail_pegawaiState();
}

class _detail_pegawaiState extends State<detail_pegawai> {
  //final List<pegawai> isiDataFinal2 = widget.isiDataFinal;
  late final String slink;
  late final String sctitle;
  late final String scpubdate;
  late final String scdesc;
  late final String scthumbnail;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    slink = widget.isiDataFinal![widget.index].ctitle.toString();
    sctitle = widget.isiDataFinal![widget.index].ctitle.toString();
    scpubdate = widget.isiDataFinal![widget.index].ctitle.toString();
    scdesc = widget.isiDataFinal![widget.index].ctitle.toString();
    scthumbnail = widget.isiDataFinal![widget.index].ctitle.toString();
    super.initState();
  }

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
              Text(
                  "Link : $slink, title: $sctitle, pubDate : $scpubdate, description : $scdesc,  thumbnail : $scthumbnail"),
              Image.network(widget.isiDataFinal![widget.index].cthumbnail),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                    final dtLike = pegawai(
                      link: widget.isiDataFinal![widget.index].link.toString(),
                      ctitle:
                          widget.isiDataFinal![widget.index].ctitle.toString(),
                      cpubdate: widget.isiDataFinal![widget.index].cpubdate
                          .toString(),
                      cdesc:
                          widget.isiDataFinal![widget.index].cdesc.toString(),
                      cthumbnail: widget.isiDataFinal![widget.index].cthumbnail
                          .toString(),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('$sctitle berhasil ditambahkan'),
                      duration: const Duration(seconds: 1),
                      action: SnackBarAction(
                        label: 'Ke Halaman Like',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NavBar(
                                a: 1,
                              ),
                            ),
                          );
                        },
                      ),
                    ));
                    print(dtLike);
                    Database.tambahData(KTM: dtLike);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyApp(),
                        ));
                  },
                  child: Text("Like"))
            ],
          ),
        ),
      ),
    );
  }
}
