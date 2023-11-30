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
              onPressed: () async {
                final answer = await showRewardPopup<String>(
                  context,
                  child: WillPopScope(
                    onWillPop: () {
                      Navigator.of(context).pop('ok');
                      return Future.value(true);
                    },
                    child: Positioned.fill(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Image.asset(
                          'assets/elephant.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
                print(answer);
              },
              child: const Text('Pop-up example one'),
            ),
            ElevatedButton(
              onPressed: () => showRewardPopup(
                context,
                enableDismissByTappingOutside: true,
                child: Positioned.fill(
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
            ),
            ElevatedButton(
              onPressed: () => showRewardPopup(
                context,
                enableDismissByTappingOutside: true,
                dismissButton: TextButton(child: Text("Close"), onPressed: () => Navigator.of(context).pop()),
                child: Positioned.fill(
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
              child: const Text('Pop-up example three with dismiss button'),
            ),
            ElevatedButton(
              onPressed: () async {
                await showRewardPopup(
                  context,
                  enableDismissByTappingOutside: true,
                  child: Positioned.fill(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Coupon Code'),
                        Text('Reach out to redeem'),
                        Text('abcd xyz'),
                      ],
                    ),
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Popup dismissed")));
              },
              child: const Text('Pop-up example four'),
            ),
            ElevatedButton(
              onPressed: () async {
                final answer = await showRewardPopup<String>(
                  context,
                  backgroundColor: Colors.teal,
                  child: WillPopScope(
                    onWillPop: () {
                      Navigator.of(context).pop('ok');
                      return Future.value(true);
                    },
                    child: Positioned.fill(
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop(true);
                        },
                        child: Image.asset(
                          'assets/elephant.png',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                );
                print(answer);
              },
              child: const Text('Pop-up example five with background cololor'),
            ),
          ],
        ),
      ),
    );
  }
}
