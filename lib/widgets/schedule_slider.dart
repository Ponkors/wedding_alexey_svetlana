import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wedding/widgets/section_title.dart';
import '../constants/app_constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

class ScheduleSlider extends StatefulWidget {
  final GlobalKey locationKey;

  const ScheduleSlider({
    super.key,
    required this.locationKey,
  });

  @override
  State<ScheduleSlider> createState() =>
      _ScheduleSliderState();
}

class _ScheduleSliderState extends State<ScheduleSlider> {
  int _currentIndex = 0;
  final List<Map<String, dynamic>> _schedules = [
    {
      'time': '12:20',
      'title': 'Регистрация союза',
      'location': 'ЗАГС',
      'address': 'г. Брест, наб.Франциска Скорины, 38',
      'image': 'assets/images/wedding_registration.jpg',
      'icon': Icons.people,
      'color': Colors.blue.shade100,
    },
    // {
    //   'time': '12:50',
    //   'title': 'Венчание',
    //   'location': AppConstants.churchName,
    //   'address': AppConstants.churchAddress,
    //   'image': AppConstants.churchImage,
    //   'icon': Icons.church,
    //   'color': Colors.blue.shade100,
    // },
    {
      'time': '13:30',
      'title': 'Сбор гостей',
      'location': 'ЗАГС',
      'address': 'г. Брест, наб.Франциска Скорины, 38',
      'image': 'assets/images/wedding_meet.jpg',
      'icon': Icons.people,
      'color': Colors.blue.shade100,
    },
    {
      'time': '15:00',
      'title': 'Банкет',
      'location': 'Усадьба Полховских',
      'address': 'д. Прилуки, ул. Береговая 15',
      'image': 'assets/images/wedding_place.jpg',
      'icon': Icons.people,
      'color': Colors.pink.shade100,
    },
  ];

  void _scrollToLocation() {
    final context = widget.locationKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: 500.ms,
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.grey.shade50,
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Расписание дня',
            style: GoogleFonts.playfairDisplay(
              fontSize: isSmallScreen ? 28 : 36,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Наши самые важные моменты',
            style: GoogleFonts.playfairDisplay(
              fontSize: isSmallScreen ? 18 : 32,
              fontWeight: FontWeight.w300,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 40),

          // Новый дизайн карусели
          SizedBox(
            height: isSmallScreen ? 500 : 600,
            child: PageView.builder(
              controller:
                  PageController(viewportFraction: isSmallScreen ? 0.85 : 0.7),
              onPageChanged: (index) => setState(() => _currentIndex = index),
              itemCount: _schedules.length,
              itemBuilder: (context, index) {
                final schedule = _schedules[index];
                return AnimatedScale(
                  duration: 300.ms,
                  scale: _currentIndex == index ? 1 : 0.9,
                  child: _buildTimelineCard(schedule, isSmallScreen),
                );
              },
            ),
          ),

          const SizedBox(height: 30),

          // Индикаторы с анимацией
          Wrap(
            spacing: 8,
            children: List.generate(_schedules.length, (index) {
              return AnimatedContainer(
                  duration: 300.ms,
                  width: _currentIndex == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentIndex == index
                        ? const Color(AppConstants.primaryColorValue)
                        : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ));
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineCard(Map<String, dynamic> schedule, bool isSmallScreen) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 30,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        children: [
          // Верхняя часть с изображением
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            child: Stack(
              children: [
                Image.asset(
                  schedule['image'],
                  height: isSmallScreen ? 180 : 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                // Positioned(
                //   top: 20,
                //   right: 20,
                //   child: Container(
                //     padding: const EdgeInsets.all(12),
                //     decoration: BoxDecoration(
                //       color: schedule['color'] as Color,
                //       shape: BoxShape.circle,
                //     ),
                //     child: Icon(
                //       schedule['icon'] as IconData,
                //       color: Colors.white,
                //       size: 24,
                //     ),
                //   ).animate().scale(delay: 200.ms),
                // ),
              ],
            ),
          ),

          // Нижняя часть с информацией
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(isSmallScreen ? 20 : 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Время
                  Text(
                    schedule['time'],
                    style: GoogleFonts.playfairDisplay(
                      fontSize: isSmallScreen ? 40 : 60,
                      fontWeight: FontWeight.w700,
                      color: schedule['color'] as Color,
                    ),
                  ).animate().fadeIn(delay: 100.ms),

                  // Разделитель
                  Container(
                    width: 60,
                    height: 3,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: schedule['color'] as Color,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ).animate().scaleX(begin: 0),

                  // Название события
                  Text(
                    schedule['title'],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: isSmallScreen ? 20 : 24,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ).animate().fadeIn(delay: 200.ms),

                  // Локация
                  Text(
                    schedule['location'],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: isSmallScreen ? 16 : 18,
                      color: Colors.grey.shade700,
                    ),
                  ).animate().fadeIn(delay: 300.ms),

                  // Адрес
                  Text(
                    schedule['address'],
                    textAlign: TextAlign.center,
                    style: GoogleFonts.playfairDisplay(
                      fontSize: isSmallScreen ? 14 : 16,
                      color: Colors.grey.shade600,
                    ),
                  ).animate().fadeIn(delay: 400.ms),

                  const SizedBox(height: 20),

                  // Кнопка (если нужно)
                  if (schedule['title'] == 'Фуршет')
                    OutlinedButton.icon(
                      icon: const Icon(Icons.map, size: 18),
                      label: const Text('Показать на карте'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor:
                            const Color(AppConstants.primaryColorValue),
                        side: BorderSide(
                            color: const Color(AppConstants.primaryColorValue)
                                .withOpacity(0.3)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                      onPressed: _scrollToLocation,
                    )
                        .animate()
                        .fadeIn(delay: 500.ms)
                        .shake(delay: 700.ms, hz: 3)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
