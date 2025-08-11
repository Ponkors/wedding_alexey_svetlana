import 'package:flutter/material.dart';
import 'schedule_slider.dart';

class ScheduleSection extends StatelessWidget {
  final GlobalKey locationKey;
  
  const ScheduleSection({
    super.key,
    required this.locationKey,
  });

  @override
  Widget build(BuildContext context) {
    return ScheduleSlider(locationKey: locationKey);
  }
} 