import 'package:app1/songs.dart';
import 'package:app1/song.dart';
//import '../Abia.dart';
//import '../songs.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  DatabaseHelper._init();

  Future<List<Abia>> getAllsongs() async {
    return songs;
  }

  Future<List<Abia>> searchsongs(String query) async {
    query = query.toLowerCase();
    return songs
        .where((Abia) =>
            Abia.number.toString() == query ||
            Abia.title.toLowerCase().contains(query) ||
            Abia.content.toLowerCase().contains(query))
        .toList();
  }

  Future<Abia?> getAbiaBynumber(int number) async {
    try {
      return songs.firstWhere((Abia) => Abia.number == number);
    } catch (e) {
      return null;
    }
  }
}
