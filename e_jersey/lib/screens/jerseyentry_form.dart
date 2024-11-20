import 'dart:convert';

import 'package:e_jersey/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:e_jersey/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class DropdownItem {
  final String value;
  final String displayText;

  DropdownItem(this.value, this.displayText);
}

class JerseyEntryFormPage extends StatefulWidget {
  const JerseyEntryFormPage({super.key});

  @override
  State<JerseyEntryFormPage> createState() => _JerseyEntryFormPageState();
}


class _JerseyEntryFormPageState extends State<JerseyEntryFormPage> {
  final _formKey = GlobalKey<FormState>();
	String _name = "";
	String _description = "";
	int _price = 0;
  String _type = "";
  final List<DropdownItem> _dropdownItems = [
  DropdownItem('club', 'Club Jersey'),
  DropdownItem('national', 'National Jersey'),
];


  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Jersey Kesukaan Mu',
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama Jersey",
                    labelText: "Nama Jersey",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Nama Jersey tidak boleh kosong!";
                    }
                    return null;
                  },
                ), 
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Harga Jersey",
                    labelText: "Harga Jersey",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _price = int.tryParse(value!) ?? 0;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Harga Jersey tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Harga Jersey harus berupa angka!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Deskripsi",
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    hintText: "Pilih Tipe Jersey",
                    labelText: "Tipe Jersey",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  value: null,
                  items: _dropdownItems.map((DropdownItem item) {
                    return DropdownMenuItem<String>(
                      value: item.value,
                      child: Text(item.displayText),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _type = newValue!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Tipe Jersey tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      Theme.of(context).colorScheme.primary),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                        // Kirim ke Django dan tunggu respons
                        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                        final response = await request.postJson(
                            "http://localhost:8000/create-flutter/",
                            jsonEncode(<String, String>{
                                'name': _name,
                                'price': _price.toString(),
                                'description': _description,
                                'type' : _type,
                            // TODO: Sesuaikan field data sesuai dengan aplikasimu
                            }),
                        );
                        if (context.mounted) {
                            if (response['status'] == 'success') {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                content: Text("Mood baru berhasil disimpan!"),
                                ));
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => MyHomePage()),
                                );
                            } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                    content:
                                        Text("Terdapat kesalahan, silakan coba lagi."),
                                ));
                            }
                        }
                    }
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}