
import 'dart:convert';

import 'package:flutter/material.dart';

class ViewPage extends StatefulWidget {
  const ViewPage({super.key});

  @override
  State<ViewPage> createState() => _ViewPageState();
}

class _ViewPageState extends State<ViewPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Práctica 12 - Leer JSON'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: FutureBuilder(
          future: DefaultAssetBundle.of(context).loadString('assets/pokedex.json'),
          initialData: const [],
          builder: (context, snapshot) {
            var showData = json.decode(snapshot.data.toString());
            return ListView.builder(
              itemCount: showData.length,
              itemBuilder:(context, index) {
                return ListTile(
                  leading: const Icon(Icons.catching_pokemon, size: 32, color: Colors.black,),
                  title: Text(showData[index]['name']['english']),
                  subtitle: Text(showData[index]['type'].toString()),
                );
              },
            );
          },
        ),
      ),
    );
  }
}