import 'package:flutter/material.dart';

class Hold extends StatelessWidget {
  Function handleStart;
  Hold(this.handleStart);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        onPressed: () => handleStart(),
        style: OutlinedButton.styleFrom(
            fixedSize: const Size(200, 200), shape: const CircleBorder()),
        child: const Text(
          'Get start!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
