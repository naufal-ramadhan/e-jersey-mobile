import 'package:e_jersey/screens/detail_jersey.dart';
import 'package:flutter/material.dart';
import 'package:e_jersey/models/jersey_entry.dart';
import 'package:e_jersey/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class JerseyEntryPage extends StatefulWidget {
  const JerseyEntryPage({super.key});

  @override
  State<JerseyEntryPage> createState() => _JerseyEntryPageState();
}

class _JerseyEntryPageState extends State<JerseyEntryPage> {
  Future<List<JerseyEntry>> fetchMood(CookieRequest request) async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    final response = await request.get('http://localhost:8000/json/');
    
    // Melakukan decode response menjadi bentuk json
    var data = response;
    
    // Melakukan konversi data json menjadi object MoodEntry
    List<JerseyEntry> listJersey = [];
    for (var d in data) {
      if (d != null) {
        listJersey.add(JerseyEntry.fromJson(d));
      }
    }
    return listJersey;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jersey Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchMood(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'Belum ada data Jersey pada E-Jersey.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) =>  Container(
                  color: Colors.yellow,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${snapshot.data![index].fields.name}",
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.price}"),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.description}"),
                      const SizedBox(height: 10),
                      Text("${snapshot.data![index].fields.type}"),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailJerseyPage(jerseyEntry: snapshot.data![index]),
                            ),
                          );
                        },
                        child: const Text('View Details'),
                      ),
                    ],
                  ),
                ),
              );
            }
          }
        },
      ),
    );
  }
}