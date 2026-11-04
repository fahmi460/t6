import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:intl/intl.dart';

var fakerKontak = new Faker();
List<String> daftarKategori = ["Keluarga", "Teman", "Kerja"];
List<Map<String, dynamic>> dataKontak = List.generate(20, (index) {
  return {
    "nama": fakerKontak.person.name(),
    "telepon":
    "08${fakerKontak.randomGenerator.integer(900000000, min: 100000000)}",
    "email": fakerKontak.internet.email(),
    "kategori": daftarKategori[index % 3],
    "tanggal": fakerKontak.date.dateTime(minYear: 2025, maxYear: 2026),
  };
});

String formatTanggal(DateTime tanggal) {
  return DateFormat("dd MMMM yyyy", "id_ID").format(tanggal);
}

class KontakPage extends StatelessWidget {
  const KontakPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KONTAK"),
      ),
      body: ListView.builder(
        itemCount: dataKontak.length,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[300],
            backgroundImage:
            NetworkImage("https://picsum.photos/id/${870 + index}/200/300"),
          ),
          title: Text("${dataKontak[index]['nama']}"),
          subtitle: Text(
              "${dataKontak[index]['telepon']}\n${dataKontak[index]['email']}\nDitambahkan pada ${formatTanggal(dataKontak[index]['tanggal'])}"),
          isThreeLine: true,
        ),
      ),
    );
  }
}
