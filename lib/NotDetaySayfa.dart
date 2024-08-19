import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notlar/Notlar.dart';

class NotDetaySayfa extends StatefulWidget {
  const NotDetaySayfa({super.key});

  @override
  State<NotDetaySayfa> createState() => _NotDetaySayfaState();
}

class _NotDetaySayfaState extends State<NotDetaySayfa> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("DETAY SAYFASI"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[],
        ),
      ),
    );
  }
}
