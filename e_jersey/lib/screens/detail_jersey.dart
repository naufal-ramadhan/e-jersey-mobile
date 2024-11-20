import 'package:flutter/material.dart';
import 'package:e_jersey/models/jersey_entry.dart'; // Pastikan untuk mengimpor model JerseyEntry

class DetailJerseyPage extends StatelessWidget {
  final JerseyEntry jerseyEntry;


  const DetailJerseyPage({Key? key, required this.jerseyEntry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Jersey'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Model: ${jerseyEntry.model}', style: TextStyle(fontSize: 18)),
            Text('PK: ${jerseyEntry.pk}', style: TextStyle(fontSize: 18)),
            Text('User: ${jerseyEntry.fields.user}', style: TextStyle(fontSize: 18)),
            Text('Name: ${jerseyEntry.fields.name}', style: TextStyle(fontSize: 18)),
            Text('Price: ${jerseyEntry.fields.price}', style: TextStyle(fontSize: 18)),
            Text('Description: ${jerseyEntry.fields.description}', style: TextStyle(fontSize: 18)),
            Text('Type: ${jerseyEntry.fields.type}', style: TextStyle(fontSize: 18)),
            Text('Club: ${jerseyEntry.fields.club}', style: TextStyle(fontSize: 18)),
            Text('Slug: ${jerseyEntry.fields.slug}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}