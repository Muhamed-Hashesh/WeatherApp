import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:my_weather_app/widgets/custom_sliver_appbar.dart';

class SearchScreenPage extends StatelessWidget {
  const SearchScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        slivers: [
          const CustomSliverAppBar(
            title: 'Search City',
            region: 'Enter correct city name',
            isShown: false,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onSubmitted: (value) async{
                  var getWeatherCubit =
                      BlocProvider.of<GetWeatherCubit>(context);
                  getWeatherCubit.getWeather(cityName: value);

                  Navigator.pop(context);
                },
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
                cursorColor: const Color(0xff2E3358), // Color of the cursor
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
                  hintText: 'Enter city name', // Placeholder text
                  hintStyle: const TextStyle(
                    color: Colors.grey,
                  ),
                  labelText: 'City Name', // Label text
                  labelStyle: const TextStyle(
                    color: Color(0xff2E3358),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xff2E3358),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xff2E3358),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xff2E3358),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(24.0),
                  ),

                  suffixIcon: const Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(
                      Iconsax.search_normal,
                      color: Color(0xff2E3358),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
