import 'package:flutter/material.dart';
import 'dart:math'; // for random numbers
import 'package:device_preview/device_preview.dart'; // for device preview

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        builder: DevicePreview.appBuilder,
        home: MiniCricketHome(),
      ),
    ),
  );
}

class MiniCricketApp extends StatelessWidget {
  const MiniCricketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MiniCricketHome(),
    );
  }
}

class MiniCricketHome extends StatefulWidget {
  const MiniCricketHome({super.key});

  @override
  State<MiniCricketHome> createState() => _MiniCricketHomeState();
}

class _MiniCricketHomeState extends State<MiniCricketHome> {
  int runs = 0;
  int balls = 6;

  Random random = Random();

  // Random run function
  void playShot() {
    if (balls > 0) {
      setState(() {
        int randomRun = [1, 2, 3, 4, 6][random.nextInt(5)];
        runs += randomRun; // add random runs
        balls--; // decrease ball
      });
    }
  }

  // Reset function
  void resetGame() {
    setState(() {
      runs = 0;
      balls = 6;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: const Text(
          "Mini Cricket",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo[900],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Images Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  color: Colors.white,
                  child: Image.asset(
                    "assets/images/cricketBat.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(width: 30),
                Container(
                  height: 120,
                  width: 120,
                  color: Colors.white,
                  child: Image.asset(
                    "assets/images/cricketBall.webp",
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Score Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text("Runs",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    const SizedBox(height: 5),
                    Text("$runs",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(width: 80),
                Column(
                  children: [
                    const Text("Balls",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                    const SizedBox(height: 5),
                    Text("$balls",
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Button
            ElevatedButton(
              onPressed: balls == 0 ? resetGame : playShot,
              style: ElevatedButton.styleFrom(
                backgroundColor: balls == 0
                    ? const Color.fromARGB(255, 183, 29, 52) // reset red
                    : Colors.blue, // bat blue
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                balls == 0 ? "Reset" : "Bat",
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
