import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/widgets.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  void initState() {
    super.initState();
    getAllSongs();
  }

  void getAllSongs() {
    final database = FirebaseDatabase.instance;
    var _songRef = database.ref('songs');
    _songRef.once().then((snapshot) {
      print(snapshot);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
