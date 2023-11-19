import 'package:flutter/material.dart';
import 'package:reward_popup/reward_popup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Reward Popup'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Press the button to show popup',
              style: TextStyle(color: Colors.white),
            ),
            ElevatedButton(
              onPressed: () => showRewardPopup(
                context,
                child: Positioned.fill(
                  child: Image.asset(
                    'assets/elephant.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              child: const Text('Pop-up example one'),
            ),
            ElevatedButton(
              onPressed: () => showRewardPopup(
                context,
                child: const Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Coupon Code'),
                      Text('Reach out to redeem'),
                      Text('abcd xyz'),
                    ],
                  ),
                ),
              ),
              child: const Text('Pop-up example two'),
            )
          ],
        ),
      ),
    );
  }
}
