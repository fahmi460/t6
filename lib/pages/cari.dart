import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import './kontak.dart';

class CariPage extends StatefulWidget {
  const CariPage({Key? key}) : super(key: key);

  @override
  State<CariPage> createState() => _CariPageState();
}

class _CariPageState extends State<CariPage> {
  String? kategoriDipilih;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> hasil = [];
    if (kategoriDipilih != null) {
      hasil = dataKontak
          .where((element) => element["kategori"] == kategoriDipilih)
          .toList();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("CARI"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: DropdownSearch<String>(
              items: (filter, loadProps) => daftarKategori,
              selectedItem: kategoriDipilih,
              popupProps: PopupProps.menu(
                showSearchBox: true,
              ),
              decoratorProps: DropDownDecoratorProps(
                decoration: InputDecoration(
                  labelText: "Kategori Kontak",
                  hintText: "Pilih kategori",
                  border: OutlineInputBorder(),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  kategoriDipilih = value;
                });
              },
            ),
          ),
          Expanded(
            child: kategoriDipilih == null
                ? Center(child: Text("Belum memilih kategori"))
                : ListView.builder(
              itemCount: hasil.length,
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  child: Text("${hasil[index]['nama'][0]}"),
                ),
                title: Text("${hasil[index]['nama']}"),
                subtitle: Text(
                    "${hasil[index]['telepon']}\nDitambahkan pada ${formatTanggal(hasil[index]['tanggal'])}"),
                isThreeLine: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
