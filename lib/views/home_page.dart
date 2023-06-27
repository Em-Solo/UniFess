import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unifess/providers/firebase_auth_providers.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // final user =

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer(
            builder: (context, ref, child) {
              return IconButton(
                onPressed: () {
                  ref.read(logOutProvider);
                },
                icon: const Icon(Icons.logout),
              );
            },
          ),
        ],
      ),
      body: const Center(child: Text("LOGGED IN")),
    );
  }
}
