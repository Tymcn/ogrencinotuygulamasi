import 'dart:io';

import 'package:flutter/material.dart';
import 'package:notlar/NotDetaySayfa.dart';
import 'package:notlar/NotKayitSayfa.dart';
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
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Anasayfa());
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
  Future<bool> uygulamayiKapat()async{
    await exit(0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            uygulamayiKapat();
          },
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "NOTLAR UYGULAMASI",
              style: TextStyle(fontSize: 20),
            ),
            FutureBuilder<List<Notlar>>(
              future: tumNotlarGoster(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var notlarListesi = snapshot.data;
                  double ortalama = 0.0;
                  if (!notlarListesi!.isEmpty) {
                    double toplam = 0.0;

                    for (var n in notlarListesi) {
                      toplam = toplam + (n.not1 + n.not2) / 2;
                    }
                    ortalama = toplam / notlarListesi.length;
                  }
                  return Text("Ortalama: ${ortalama.toInt()}",style: TextStyle(color: Colors.white,fontSize: 14));
                } else {
                  return Text("Ortalama: 0",style: TextStyle(color: Colors.white,fontSize: 14),);
                }
              },
            ),
          ],
        ),
      ),
      body:WillPopScope(onWillPop: uygulamayiKapat,child:  FutureBuilder<List<Notlar>>(
        future: tumNotlarGoster(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var notlarListesi = snapshot.data;
            return ListView.builder(
              itemCount: notlarListesi!.length,
              itemBuilder: (context, indeks) {
                var not = notlarListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NotDetaySayfa(not: not,),
                        ));
                  },
                  child: Card(
                      child: SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(not.ders_adi,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(not.not1.toString()),
                        Text(not.not2.toString()),
                      ],
                    ),
                  )),
                );
              },
            );
          } else {
            return Center();
          }
        },
      ),),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NotKayitSayfa(),
              ));
        },
        tooltip: 'Not Ekle',
        child: Icon(Icons.add),
      ),
    );
  }
}
