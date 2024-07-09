import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FeedbackModel {
  int note;
  IconData icon;
  Color color;
  bool active;

  FeedbackModel({
    required this.note,
    required this.icon,
    required this.active,
    required this.color,
  });
}
