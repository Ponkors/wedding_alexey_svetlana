import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class DateUtils {
  static String formatDate(DateTime date) {
    final formatter = DateFormat('d MMMM yyyy', 'ru_RU');
    return formatter.format(date);
  }

  static String formatTime(DateTime date) {
    final formatter = DateFormat('HH:mm');
    return formatter.format(date);
  }

  static String getMonthName(DateTime date) {
    final formatter = DateFormat('MMMM', 'ru_RU');
    return formatter.format(date);
  }

  static String getDayName(DateTime date) {
    final formatter = DateFormat('EEEE', 'ru_RU');
    return formatter.format(date);
  }

  static String getFullDate(DateTime date) {
    final formatter = DateFormat('EEEE, d MMMM yyyy', 'ru_RU');
    return formatter.format(date);
  }

  static Duration _getTimeUntil(DateTime targetDate) {
    return targetDate.difference(DateTime.now());
  }

  static int getDaysUntil(DateTime targetDate) {
    return _getTimeUntil(targetDate).inDays;
  }

  static int getHoursUntil(DateTime targetDate) {
    return _getTimeUntil(targetDate).inHours % 24;
  }

  static int getMinutesUntil(DateTime targetDate) {
    return _getTimeUntil(targetDate).inMinutes % 60;
  }

  static int getSecondsUntil(DateTime targetDate) {
    return _getTimeUntil(targetDate).inSeconds % 60;
  }
} 