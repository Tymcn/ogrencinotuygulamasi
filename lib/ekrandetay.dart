import 'package:flutter/material.dart';

class Ekrandetay extends StatefulWidget {
  const Ekrandetay({super.key});

  @override
  State<Ekrandetay> createState() => _EkrandetayState();
}

class _EkrandetayState extends State<Ekrandetay> {
  @override
  Widget build(BuildContext context) {
    var ekranbilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranbilgisi.size.height;
    final double ekranGenisligi = ekranbilgisi.size.width;
    print("ekran yüksekliği:${ekranYuksekligi}");
    print("ekran genişliği:${ekranGenisligi}");

    return Scaffold(
        backgroundColor: Colors.cyan,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("images/guvercin.jpg"),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text("Beğen"),
                      onPressed: () {},
                    ),


                  ),
                ],
              ),
              Image.asset("images/guvercin.jpg"),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: Text("Beğen"),
                      onPressed: () {},
                    ),


                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
