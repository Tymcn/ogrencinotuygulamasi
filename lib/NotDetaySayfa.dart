import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notlar/Notlar.dart';
import 'package:notlar/main.dart';

class NotDetaySayfa extends StatefulWidget {
  Notlar not;


  NotDetaySayfa({required this.not});

  @override
  State<NotDetaySayfa> createState() => _NotDetaySayfaState();
}

class _NotDetaySayfaState extends State<NotDetaySayfa> {
  var tfDersAdi = TextEditingController();
  var tfnot1 = TextEditingController();
  var tfnot2 = TextEditingController();

  Future<void> sil( int notid) async {
    print("$notid silindi.");
    Navigator.push(context,MaterialPageRoute(builder: (context) => Anasayfa(),));
  }
  Future<void> guncelleme( int notid,String ders_adi, int not1, int not2) async {
    print("$ders_adi- $not1 - $not2 güncellendi.");
    Navigator.push(context,MaterialPageRoute(builder: (context) => Anasayfa(),));
  }


  @override
  void initState() {
    super.initState();
    var not=widget.not;
    tfDersAdi.text=not.ders_adi;
    tfnot1.text=not.not1.toString();
    tfnot2.text=not.not2.toString();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("DETAY SAYFASI"),
        actions: [
          TextButton(child: Text("Sil",style: TextStyle(color: Colors.white),),
            onPressed: (){
            sil(widget.not.not_id);
            }, ),
          TextButton(child: Text("Güncelle",style: TextStyle(color: Colors.white),),
            onPressed: (){
              guncelleme(widget.not.not_id,tfDersAdi.text, int.parse(tfnot1.text), int.parse(tfnot2.text));
            }, ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50,right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              TextField(
                controller: tfDersAdi,
                decoration: InputDecoration(hintText: "Ders Adı"),
              ),
              TextField(
                controller: tfnot1,
                decoration: InputDecoration(hintText: "1. Not"),
              ),
              TextField(
                controller: tfnot2,
                decoration: InputDecoration(hintText: "2. Not"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
