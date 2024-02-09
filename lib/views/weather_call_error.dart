import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_weather_app/widgets/custom_sliver_appbar.dart';

class WeatherCallError extends StatelessWidget {
  const WeatherCallError({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomSliverAppBar(
            title: 'not Found',
            region: 'This city or country name is invalid',
            isShown: true),
        SliverFillRemaining(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Image(
                  image: AssetImage('assets/images/sighting_3d.png'),
                  width: 180,
                ),
                Text(
                  'There is no weather search again with valid country name 🔎',
                  style: GoogleFonts.poppins(
                    textStyle:
                        const TextStyle(fontSize: 28, color: Colors.white),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
