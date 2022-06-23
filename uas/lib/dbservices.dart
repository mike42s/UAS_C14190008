import 'package:cloud_firestore/cloud_firestore.dart';
import 'class.dart';
import 'dart:math';

CollectionReference tblLike = FirebaseFirestore.instance.collection("Like");

class Database {
  static Stream<QuerySnapshot> getData(String Nomor) {
    if (Nomor == "") {
      return tblLike.snapshots();
    } else {
      return tblLike
          .orderBy("Nomor")
          .startAt([Nomor]).endAt([Nomor + '\uf8ff']).snapshots();
      //return tblKTM.where("Nomor", isEqualTo: Nomor).snapshots();
    }
  }

  static Future<void> tambahData({required pegawai KTM}) async {
    DocumentReference docref = tblLike.doc(KTM.ctitle.toString());
    await docref
        .set(KTM.toJson())
        .whenComplete(() => print(
            "Data Berhasil di Input Ctitle : ${KTM.ctitle}, Desc : ${KTM.cdesc}, pubDate : ${KTM.cpubdate}, thumbnail : ${KTM.cthumbnail}, link : ${KTM.link}"))
        .catchError((e) => print("e"));
  }

  static Future<void> ubahData({required pegawai KTM}) async {
    DocumentReference docref = tblLike.doc(KTM.ctitle.toString());
    await docref
        .update(KTM.toJson())
        .whenComplete(() => print("Data Berhasil Di rubah"))
        .catchError((e) => print("e"));
  }

  static Future<void> DeleteData({required String Nama_KTM}) async {
    DocumentReference docref = tblLike.doc(Nama_KTM);
    await docref
        .delete()
        .whenComplete(() => print("Data Berhasil diapus"))
        .catchError((e) => print("e"));
  }
}
