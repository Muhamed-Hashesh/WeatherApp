import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_weather_app/views/search_screen_view.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar(
      {super.key, required this.title, required this.region, required this.isShown});
  final String title;
  final String region;
  final bool isShown;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 150,
      toolbarHeight: 70,
      centerTitle: true,
      forceMaterialTransparency: false,
      // surfaceTintColor: Colors.blue,
      pinned: true,
      floating: true,
      forceElevated: false,
      backgroundColor: const Color(0xff2E3358),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.all(0),
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              Text(
                region,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      fontSize: 14, color: Colors.white.withOpacity(0.6)),
                ),
              ),
            ],
          ),
        ),
        background: const Image(
          image: AssetImage('assets/images/bg.png'),
          fit: BoxFit.cover,
          alignment: Alignment.topCenter,
        ),
      ),
      actions:isShown ? [ 
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: IconButton(
            icon: const Icon(Iconsax.search_normal),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchScreenPage();
                  },
                ),
              );
            },
          ),
        )
      ]:null,
    );
  }
}
