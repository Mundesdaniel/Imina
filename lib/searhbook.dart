import 'package:flutter/material.dart';
//import '../help_database.dart';
import '../Song.dart';
//import 'Abia_detail.dart';

class AbiaDetailScreen extends StatelessWidget {
  final int AbiaNumber;

  const AbiaDetailScreen({super.key, required this.AbiaNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Zia Zia Abia Na Kitabu Kpe',
        textAlign: TextAlign.center,
      )),
      body: FutureBuilder<Abia?>(
        future: DatabaseHelper.instance.getAbiaBynumber(AbiaNumber),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('Song not found'));
          } else {
            final Abia = snapshot.data!;
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Abia.title,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(height: 16),
                  Text(
                    Abia.content,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class DatabaseHelper {
  static var instance;
}
