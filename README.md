# Reward Pop-Up

A flutter package to easily implement an attractive animated pop-up animation with gift and confetti animation. This package includes a custom non-opaque route, lottie animation and an animated mesh background.

## Demo

[![Video](https://img.youtube.com/vi/v8jhP1y07NY/maxresdefault.jpg)](https://www.youtube.com/watch?v=v8jhP1y07NY)

## Getting Started

Simply import the package 

```
import 'package:reward_pop_up/reward_pop_up.dart';
```

Add a reference to the showRewardPackage method

More examples in the example directory of the repository & example tab.

```
ElevatedButton(
              onPressed: () async {
                final answer = await showRewardPopup<String>(
                  context,
                  backgroundColor: Colors.black,
                  child: Positioned.fill(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pop(true);
                      },
                      child: Image.asset(
                        'assets/elephant.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
                //Use answer
              },
              child: const Text('Pop-up example one'),
            ),
```

*New: Customize the precursor animation by passing your own animation widget!

## Contributors
[<img src="https://github.com/srujanmhase.png" width="60px;"/><br /><sub><a href="https://github.com/srujanmhase">srujanmhase</a></sub>](https://github.com/srujanmhase/reward_popup/tree/main)

[<img src="https://github.com/bahadirarslan.png" width="60px;"/><br /><sub><a href="https://github.com/bahadirarslan">bahadirarslan</a></sub>](https://github.com/bahadirarslan/reward_popup/tree/main)