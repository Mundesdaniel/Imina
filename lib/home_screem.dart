import 'package:flutter/material.dart';
import '../help_database.dart';
import '../song.dart';
import 'Song_detail.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Abia> _songs = [];
  List<Abia> _filteredsongs = [];

  @override
  void initState() {
    super.initState();
    _loadsongs();
  }

  void _loadsongs() async {
    final songs = await DatabaseHelper.instance.getAllsongs();
    setState(() {
      _songs = songs.cast<Abia>();
      _filteredsongs = songs.cast<Abia>();
    });
  }

  void _performSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredsongs = _songs;
      } else {
        _filteredsongs = _songs
            .where((Abia) =>
                Abia.title.toLowerCase().contains(query.toLowerCase()) ||
                Abia.content.toLowerCase().contains(query.toLowerCase()) ||
                Abia.number.toString() == query)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Zia zia Abia Na kitabu Kpe',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search songs',
                suffixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: _performSearch,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredsongs.length,
              itemBuilder: (context, index) {
                final Abia = _filteredsongs[index];
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: ListTile(
                    title: Text(
                      Abia.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      'kpe Waraga: ${Abia.number}',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AbiaDetailScreen(AbiaNumber: Abia.number),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
