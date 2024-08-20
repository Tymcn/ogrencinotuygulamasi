import 'dart:io';
import 'dart:typed_data'; // Doğru olan bu kütüphanedir

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeritabaniYardimcisi{
   static final String veritabaniAdi="notlar.db";

   static Future<Database> veritabaniErisim() async{
     String veritabaniYolu= join(await getDatabasesPath(),veritabaniAdi);

     if(await databaseExists(veritabaniYolu)){
       print("Veri tabanı var.");
     }else{
       ByteData data=await rootBundle.load("veritabanı: $veritabaniAdi");

       List<int> bytes=data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
       await File(veritabaniYolu).writeAsBytes(bytes,flush: true);
       print("Veri tabanı Kopyalandı");
     }
     return openDatabase(veritabaniYolu);
   }

}