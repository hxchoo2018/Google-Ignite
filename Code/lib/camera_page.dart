import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
//TODO: Import camera plugin.

// Page to display camera preview and take photos.
class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  final String title = 'Camera Demo';

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  bool _hasInitialized = false;
  final List<String> _images = [];
  late Future<void> _initializeControllerFuture;
  //TODO: Declare handle to camera controller.

  // Takes an image and saves it into temporary storage.
  Future<void> _captureImage() async {
    //TODO: Take a picture :)
    print('Taking a photo!');
  }

  // Initialize camera controller.
  Future<void> _setupCamera() async {
    //TODO: Get list of cameras.

    //TODO: Initialize camera.
    _initializeControllerFuture = Future.delayed(const Duration(seconds: 2));

    // Modify the state of this widget (triggers a rebuild).
    setState(() {
      _hasInitialized = true;
    });
  }

  @override
  void initState() {
    super.initState();

    // Call the function to asynchronously setup camera controller.
    unawaited(_setupCamera());
  }

  @override
  void dispose() {
    //TODO: Dispose of the controller when the widget is disposed.
    super.dispose();
  }

  // Builds the widget holding a preview of the camera.
  Widget _cameraPreviewBuilder() {
    if (!_hasInitialized) {
      return const Text('<camera preview placeholder>');
    }
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If the Future is complete, display the preview.
          //TODO: Render the camera preview.
          return const Text('Actual camera preview');
        } else {
          // Otherwise, display a loading indicator.
          return const Text('<camera preview placeholder>');
        }
      },
    );
  }

  // Attempts to read a given file path to display in Image widget.
  Widget _renderImageFromPath(String imageFilePath) {
    return Image.file(
      File(imageFilePath),
      // Error fallback when the image fails to load.
      errorBuilder: (_, error, __) {
        print(error);
        return const Icon(Icons.error_outline);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: _cameraPreviewBuilder(),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _images.length,
              itemBuilder: (context, i) {
                // Renders the file path and displays image thumbnail.
                return ListTile(
                  title: Text(_images[i]),
                  trailing: _renderImageFromPath(_images[i]),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _captureImage,
        tooltip: 'Take Photo',
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
