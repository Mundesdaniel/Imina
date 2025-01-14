import 'package:flutter/material.dart';
import '../help_database.dart';
import '../song.dart';

class AbiaDetailScreen extends StatelessWidget {
  final int AbiaNumber;

  const AbiaDetailScreen({super.key, required this.AbiaNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Abia'),
      ),
      body: FutureBuilder<Abia?>(
        future: DatabaseHelper.instance.getAbiaBynumber(AbiaNumber)
            as Future<Abia?>?,
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
                  Center(
                    child: Text(
                      Abia.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline5?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: Text(
                      'Kpe waraga: ${Abia.number}',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ),
                  SizedBox(height: 16),
                  Center(
                    child: Text(
                      Abia.content,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontFamily: 'YourCustomFontFamily'),
                    ),
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

extension on TextTheme {
  get headline5 => null;

  get caption => null;
}
