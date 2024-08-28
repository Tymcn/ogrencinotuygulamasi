import 'dart:io';
import 'dart:typed_data'; // Doğru olan bu kütüphanedir
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeritabaniYardimcisi{
   static final String veritabaniAdi="notlar.db";

   static Future<Database> veritabaniErisim() async{
     String veritabaniYolu = join(await getDatabasesPath(), veritabaniAdi);
     print("Veritabanı Yolu: $veritabaniYolu");

     if (await databaseExists(veritabaniYolu)) {
       print("Veritabanı mevcut.");
     } else {
       print("Veritabanı mevcut değil, kopyalanıyor.");
       ByteData data = await rootBundle.load("veritabani/$veritabaniAdi");
       List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
       await File(veritabaniYolu).writeAsBytes(bytes, flush: true);
       print("Veritabanı kopyalandı.");
     }

     return openDatabase(veritabaniYolu);

   }

}