import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:wedding/widgets/details_section.dart';
import 'package:wedding/widgets/schedule_slider.dart';
import '../constants/app_constants.dart';
import '../widgets/about_section.dart';
import '../widgets/dress_code_section.dart';
import '../widgets/flipp_clock.dart';
import '../widgets/location_section.dart';
import '../widgets/rsvp_section.dart';
import '../widgets/schedule_section.dart';
import '../widgets/story_section.dart';
import '../widgets/scroll_indicator.dart';
import '../widgets/wedding_decorations.dart';
import '../widgets/welcome_section.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final locationKey = GlobalKey();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppConstants.heroBackgroundImage),
                  fit: BoxFit.cover,
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.5),
                  ],
                ),
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min, // ← Важно для Align!
                    children: [
                      Text(
                        AppConstants.groomName,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 48,
                          color: Colors.white70,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w400,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      )
                          .animate()
                          .fadeIn(duration: const Duration(milliseconds: 1000))
                          .slideY(begin: 0.3, end: 0),
                      Text(
                        '&',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 36,
                          color: Colors.white70,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w300,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      )
                          .animate()
                          .fadeIn(duration: const Duration(milliseconds: 1000))
                          .slideY(begin: 0.3, end: 0),
                      Text(
                        AppConstants.brideName,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 48,
                          color: Colors.white70,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w400,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      )
                          .animate()
                          .fadeIn(duration: const Duration(milliseconds: 1000))
                          .slideY(begin: 0.3, end: 0),
                      const SizedBox(height: 40),
                      Text(
                        AppConstants.weddingDateString,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 24,
                          color: Colors.white70,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w300,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: const Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                      )
                          .animate()
                          .fadeIn(duration: const Duration(milliseconds: 1000))
                          .slideY(begin: 0.3, end: 0),
                      const SizedBox(height: 40),
                      const FlippClock(),
                      const SizedBox(height: 40),
                      const ScrollIndicator(),
                    ],
                  ),
                ),
              ),
            ),
            const WelcomeSection(),
            ScheduleSlider(locationKey: locationKey),
            const DetailsSection(),
            // const DressCodeSection(),
            LocationSection(key: locationKey),
            const RSVPSection(),
          ],
        ),
      ),
    );
  }
}
