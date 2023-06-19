import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:unifess/providers/firebase_auth_providers.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final logOut = ref.read(logOutProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              logOut;
            },
            icon: const Icon(Icons.logout),
          )
        ],
      ),
      body: const Center(child: Text("LOGGED IN")),
    );
  }
}
