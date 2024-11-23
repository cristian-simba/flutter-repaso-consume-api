import 'package:flutter/material.dart';
import 'package:repaso/services/Api_Gift.dart';
import 'package:repaso/models/Gift.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Gift>> _gifts;

  @override
  void initState() {
    super.initState();
    _gifts = ApiGift().fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Gift>>(
        future: _gifts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Muestra un indicador de carga mientras espera la respuesta
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // Muestra un mensaje de error si hay algún problema
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            // Muestra un mensaje si no hay datos
            return Center(child: Text('No GIFs available.'));
          } else {
            // Si la respuesta es exitosa, muestra la lista
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Gift gift = snapshot.data![index];
                return Column(
                  children: [
                    Image.network(gift.url, fit: BoxFit.fill,),
                    Text(gift.id),
                    Text(gift.username),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
