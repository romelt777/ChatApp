import 'dart:math';

import 'package:camera/camera.dart';
import 'package:chat_app/screens/camera_view.dart';
import 'package:chat_app/screens/video_view.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

//late = variable will be initialized before it is used.
late List<CameraDescription> cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void> cameraValue;
  bool _isRecording = false;
  String videoPath = "";
  bool _flash = false;
  bool _cameraFront = true;
  double transform = 0;

  @override
  void initState() {
    super.initState();
    //cameras[0] is the first camera
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_cameraController);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Positioned(
            bottom: 0.0,
            child: Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //BUTTOMS
                    children: [
                      //FLASH BUTTON
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _flash = !_flash;
                          });
                          _flash
                              ? _cameraController.setFlashMode(FlashMode.torch)
                              : _cameraController.setFlashMode(FlashMode.off);
                        },
                        icon: Icon(_flash ? Icons.flash_on : Icons.flash_off, color: Colors.white, size: 28),
                      ),
                      //CAMERA BUTTON
                      GestureDetector(
                        onLongPress: () async {
                          takeVideo();
                        },
                        onLongPressUp: () {
                          stopVideo(context);
                        },
                        onTap: () {
                          if (!_isRecording) {
                            takePhoto(context);
                          }
                        },
                        child:
                            _isRecording
                                ? Icon(Icons.radio_button_on, color: Colors.red, size: 80)
                                : Icon(Icons.panorama_fish_eye, color: Colors.white, size: 70),
                      ),
                      //SWITCH CAMERA BUTTON
                      IconButton(
                        onPressed: () async {
                          setState(() {
                            _cameraFront = !_cameraFront;
                            transform = transform + pi;
                          });
                          //check which camera is on
                          int cameraPosition = _cameraFront ? 0 : 1;
                          _cameraController = CameraController(cameras[cameraPosition], ResolutionPreset.high);
                          cameraValue = _cameraController.initialize();
                        },
                        //transform to rotate/flip camera icon
                        icon: Transform.rotate(
                          angle: transform,
                          child: Icon(Icons.flip_camera_ios, color: Colors.white, size: 28),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(
                    "Hold for Video, Tap for Photo",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void takePhoto(BuildContext context) async {
    final path = join((await getTemporaryDirectory()).path, "${DateTime.now()}.png");

    //take picture and save to temp path
    final XFile picture = await _cameraController.takePicture();
    // final File imageFile = File(picture.path);

    // copy to permanent path

    //sending to new screen
    if (context.mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (builder) => CameraView(path: picture.path)));
    }
  }

  void takeVideo() async {
    //create path
    final path = join((await getTemporaryDirectory()).path, "${DateTime.now()}.mp4");

    await _cameraController.startVideoRecording();

    setState(() {
      _isRecording = true;
      videoPath = path;
    });
  }

  void stopVideo(BuildContext context) async {
    final XFile video = await _cameraController.stopVideoRecording();
    setState(() {
      videoPath = video.path;
      _isRecording = false;
    });

    //sending to new screen
    if (context.mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (builder) => VideoView(path: videoPath)));
    }
  }
}
