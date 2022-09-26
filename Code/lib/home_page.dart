import 'package:flutter/material.dart';

import 'routes.dart';

class PluginInfo {
  const PluginInfo(
    title, {
    this.description = "", // Optional named argument with default value
    required this.buildRoute, // Required named argument
  }) : title = "Plugin:$title"; // List initializer, string interpolation
  final String title;
  final String description;
  final Route Function() buildRoute;
}

const plugins = [
  PluginInfo(
    'Camera',
    description: 'Take a photo with the camera!',
    buildRoute: cameraPageBuilder,
  ),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Widget to render a list of Plugins to demo.

  final String title = 'Flutter Plugins Demo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SizedBox.expand(
        child: ListView.builder(
          padding: const EdgeInsets.all(4.0),
          itemCount: plugins.length,
          itemBuilder: (context, i) {
            //TODO: Render route to new page.
            return const Text('ListTile');
          },
        ),
      ),
    );
  }
}
