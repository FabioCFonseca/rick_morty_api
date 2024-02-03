import 'package:flutter/material.dart';

class LoadingInidicator extends StatelessWidget {
  const LoadingInidicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.blue,
        strokeWidth: 5,
      ),
    );
  }
}
