// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:uas/class.dart';

// import 'package:flutter/material.dart';

// class Like extends StatefulWidget {
//   final pegawai CPegawai;
//   const Like({Key? key, required this.CPegawai}) : super(key: key);

//   @override
//   State<Like> createState() => _LikeState();
// }

// class _LikeState extends State<Like> {
//   @override
//   void dispose() {
//     //ctrsearch.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     //ctrsearch.addListener(onSearch);
//     super.initState();
//   }

//   Stream<QuerySnapshot<Object?>> onSearch() {
//     setState(() {});
//     //return Database.getData(ctrsearch.text);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: StreamBuilder<QuerySnapshot>(
//                 stream: onSearch(),
//                 builder: (context, snapshot) {
//                   if (snapshot.hasError) {
//                     return Text("Error");
//                   } else if (snapshot.hasData || snapshot.data != null) {
//                     return ListView.separated(
//                       itemBuilder: (BuildContext context, int index) {
//                         DocumentSnapshot datas = snapshot.data!.docs[index];
//                         String no = datas["Nomor"].toString();

//                         String Nama = datas["Nama"];
//                         String NRP = datas["NRP"];
//                         _jumlah = snapshot.data!.docs.length;
//                         return ListTile(
//                           onTap: () {
//                             final dtbaru = item_DaftarKTM(
//                                 itemNRP: NRP, itemNama: Nama, itemNomor: no);
//                             // Database.ubahData(KTM: dtbaru);
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => detData(
//                                   dataDet: dtbaru,
//                                 ),
//                               ),
//                             );
//                           },
//                           onLongPress: () {
//                             Database.DeleteData(Nama_KTM: no.toString());
//                           },
//                           title: Text(no.toString()),
//                           subtitle: Text(Nama),
//                         );
//                       },
//                       itemCount: snapshot.data!.docs.length,
//                       separatorBuilder: (BuildContext context, int index) =>
//                           SizedBox(
//                         height: 8.0,
//                       ),
//                     );
//                   }
//                   return Center(
//                     child: CircularProgressIndicator(
//                         valueColor: AlwaysStoppedAnimation<Color>(Colors.pink)),
//                   );
//                 },
//               ),,
//     );
//   }
// }
