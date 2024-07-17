import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Screen'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Get.toNamed('/second');
          },
          child: SizedBox(
            height: 400,
            width: 450,
            child: Image.network('https://mfg.fhstp.ac.at/cms/wp-content/uploads/2022/05/flutter-dash.png',fit: BoxFit.cover,),
          ),
        ),
      ),
    );
  }
}


class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Screen'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: SizedBox(
            height: 300,
            width: 400,
            child: Image.network('https://storage.googleapis.com/cms-storage-bucket/d83012c34a8f88a64e2b.jpg',fit: BoxFit.fitHeight,),
          ),
        ),
      ),
    );
  }
}
