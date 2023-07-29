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

```
ElevatedButton(
    onPressed: () => 
    showRewardPopup(
        context,
        Positioned.fill(
                child: Image.asset(
                'assets/elephant.jpg',
                fit: BoxFit.cover,
             ),
           ),
        ),
    child: const Text('Pop-up example one'),
),
```