import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uas/class.dart';

import 'package:flutter/material.dart';
import 'package:uas/det_pegawai.dart';
import 'package:uas/main.dart';

import 'dbservices.dart';
import 'navbar.dart';

class Like extends StatefulWidget {
  final pegawai? CPegawai;
  const Like({Key? key, this.CPegawai}) : super(key: key);

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  final ctrsearch = TextEditingController();
  @override
  void dispose() {
    ctrsearch.dispose();
    super.dispose();
  }

  @override
  void initState() {
    ctrsearch.addListener(onSearch);
    super.initState();
  }

  Stream<QuerySnapshot<Object?>> onSearch() {
    setState(() {
      print(ctrsearch.text);
    });
    return Database.getData(ctrsearch.text);
  }

  int _jumlah = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FIREBASE"),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              controller: ctrsearch,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black)),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: onSearch(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("Error");
                  } else if (snapshot.hasData || snapshot.data != null) {
                    return ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        DocumentSnapshot datas = snapshot.data!.docs[index];
                        String cLink = datas["link"].toString();
                        String cTitle = datas["title"].toString();
                        String cPubDate = datas["pubDate"].toString();
                        String cdesc = datas["description"].toString();
                        String cthumbnail = datas["thumbnail"].toString();
                        //_jumlah = snapshot.data!.docs.length;

                        return ListTile(
                          onTap: () {
                            final dtbaru = pegawai(
                                link: cLink,
                                ctitle: cTitle,
                                cpubdate: cPubDate,
                                cdesc: cdesc,
                                cthumbnail: cthumbnail);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    detData_Database(a: dtbaru),
                              ),
                            );
                          },
                          onLongPress: () {
                            Database.DeleteData(Nama_KTM: cTitle.toString());
                          },
                          title: Text(cTitle.toString()),
                          subtitle: Text(cPubDate.toString()),
                        );
                      },
                      itemCount: snapshot.data!.docs.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        height: 8.0,
                      ),
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.pink)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class detData_Database extends StatefulWidget {
  final pegawai a;
  const detData_Database({Key? key, required this.a}) : super(key: key);

  @override
  State<detData_Database> createState() => _detData_DatabaseState();
}

class _detData_DatabaseState extends State<detData_Database> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
      child: Column(
        children: [
          Image.network(widget.a.cthumbnail),
          Text("Link : ${widget.a.link}"),
          SizedBox(
            height: 10,
          ),
          Text("title: ${widget.a.ctitle}"),
          SizedBox(
            height: 10,
          ),
          Text("pubDate : ${widget.a.cpubdate}"),
          SizedBox(
            height: 10,
          ),
          Text("description : ${widget.a.cdesc}"),
          SizedBox(
            height: 10,
          ),
          Text("thumbnail : ${widget.a.cthumbnail}"),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Database.DeleteData(Nama_KTM: widget.a.ctitle);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Data berhasil dihapus'),
                  duration: const Duration(seconds: 1),
                  action: SnackBarAction(
                    label: 'Ke Halaman Home?',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NavBar(),
                        ),
                      );
                    },
                  ),
                ));
              },
              child: Text("Delete from Like"))
        ],
      ),
    ));
  }
}
