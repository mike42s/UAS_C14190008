import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:uas/det_pegawai.dart';

import 'apiservices.dart';
import 'class.dart';
import 'firebase_options.dart';

Services services_api = Services();
late Future<List<pegawai>> list_pegawai = services_api.get_pegawai();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MaterialApp(
    title: "",
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list_pegawai = services_api.get_pegawai();
  }

  @override
  void dispose() async {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: FutureBuilder<List<pegawai>>(
        future: list_pegawai,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<pegawai> isiData = snapshot.data!;
            return ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(isiData[index].ctitle),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          isiData[index].cthumbnail,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return detail_pegawai(
                                isiDataFinal: isiData,
                                index: index,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
                itemCount: isiData.length);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              child: const CircularProgressIndicator());
        },
      )),
    );
  }
}
