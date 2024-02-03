import 'package:flutter/material.dart';

import '../domain/app_error.dart';

class ErrorIndicator extends StatelessWidget {
  const ErrorIndicator({super.key, required this.error});

  final AppError error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          error.getErrorMessage(),
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}
