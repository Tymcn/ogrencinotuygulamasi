import 'package:flutter/material.dart';
import 'package:notlar/Notlar.dart';
import 'package:notlar/ekrandetay.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Anasayfa()
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  Future<List<Notlar>> tumNotlarGoster() async {
    var notlarListesi = <Notlar>[];

    var n1 = Notlar(1, "Matematik", 100, 25);
    var n2 = Notlar(2, "Geometri", 100, 25);
    var n3 = Notlar(3, "Fizik", 100, 25);
    var n4 = Notlar(4, "Kimya", 100, 25);
    var n5 = Notlar(5, "Biyoloji", 100, 25);

    notlarListesi.add(n1);
    notlarListesi.add(n2);
    notlarListesi.add(n3);
    notlarListesi.add(n4);
    notlarListesi.add(n5);

    return notlarListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("NOTLAR UYGULAMASI"),
      ),
      body: FutureBuilder<List<Notlar>>(
        future: tumNotlarGoster(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var notlarListesi = snapshot.data;
            return ListView.builder(
              itemCount: notlarListesi!.length,
              itemBuilder: (context, indeks) {
                var not = notlarListesi[indeks];
                return Card(
                    child: SizedBox(height:50 ,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(not.ders_adi,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(not.not1.toString()),
                      Text(not.not2.toString()),
                    ],
                  ),
                ));
              },
            );
          } else {
            return Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Not Ekle',
        child: Icon(Icons.add),
      ),
    );
  }
}
