import 'package:flutter/material.dart';

/// Singleton to push the next widget.
///
/// * [context]
/// * [screen] - Widget that needs to be passed to the navigator.
///
void navigatePush(BuildContext context, dynamic screen) {
  Navigator.push(context, MaterialPageRoute(builder: (_) => screen()));
}
