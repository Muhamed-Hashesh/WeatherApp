class MainState {}

class NoWeatherState extends MainState {}

class WeatherAddedState extends MainState {
  WeatherAddedState(
      // WeatherModel weatherModel, List<WeatherCardModel> weatherCardModel
      );
}

class FailureScreenState extends MainState {}
