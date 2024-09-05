import 'package:flutter/material.dart';
import 'package:spotify_app/core/widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        withLogo: true,
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        ),
      ),
      body: Container(),
    );
  }
}
