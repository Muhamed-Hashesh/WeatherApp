import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_weather_app/widgets/custom_sliver_appbar.dart';

class NoWeatherScreen extends StatelessWidget {
  const NoWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomSliverAppBar(
            title: 'No Data', region: 'click search button to start', isShown: true,),
        SliverFillRemaining(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'There is no weather 😖 start searching now 🔎',
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
