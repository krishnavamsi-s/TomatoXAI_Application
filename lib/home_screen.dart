import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  File? _image;
  Uint8List? gradcam;
  String prediction = "";
  bool isLoading = false;

  final picker = ImagePicker();

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: Duration(milliseconds: 600))
      ..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 10).animate(_controller);
  }

  Future pickImage(ImageSource source) async {
    final img = await picker.pickImage(source: source);
    if (img != null) {
      setState(() {
        _image = File(img.path);
        prediction = "";
        gradcam = null;
      });
    }
  }

  Future predictImage() async {
    setState(() {
      isLoading = true;
    });

    await Future.delayed(Duration(seconds: 3));

    setState(() {
      isLoading = false;
      prediction = "Early Blight (Demo)";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFFC5E8B7), Color(0xFFD0ECC5)],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            AnimatedBuilder(
              animation: _animation,
              builder: (_, child) {
                return Transform.translate(
                  offset: Offset(0, _animation.value),
                  child: Text("🍅 Tomato Buddy 🍅",
                      style:
                      TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                );
              },
            ),

            SizedBox(height: 20),

            Container(
              height: 200,
              width: 250,
              color: Colors.white,
              child: _image == null
                  ? Center(child: Text("No Image"))
                  : Image.file(_image!, fit: BoxFit.cover),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () => pickImage(ImageSource.camera),
                    child: Text("Camera")),
                SizedBox(width: 10),
                ElevatedButton(
                    onPressed: () => pickImage(ImageSource.gallery),
                    child: Text("Gallery")),
              ],
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: predictImage,
              child: isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text("Scan"),
            ),

            if (prediction.isNotEmpty)
              Column(
                children: [
                  SizedBox(height: 20),
                  Text(prediction),
                ],
              ),
          ],
        ),
      ),
    );
  }
}