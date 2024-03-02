import 'package:city_eye/src/presentation/blocs/main_city_eye/main_city_eye_bloc.dart';
import 'package:city_eye/src/presentation/screens/city_eye_home/home_screen.dart';
import 'package:city_eye/src/presentation/screens/city_eye_more/city_eye_more_screen.dart';
import 'package:city_eye/src/presentation/screens/main_city_eye/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainCityEyeScreen extends StatefulWidget {
  const MainCityEyeScreen({super.key});

  @override
  State<MainCityEyeScreen> createState() => _MainCityEyeScreenState();
}

class _MainCityEyeScreenState extends State<MainCityEyeScreen> {
  int _currentIndex = 0;
  MainCityEyeBloc get _bloc => BlocProvider.of<MainCityEyeBloc>(context);
  List<Widget> _screens = [];
  @override
  initState() {
    super.initState();
    _screens = [
      const CityEyeHomeScreen(),
      const Center(child: Text("Support")),
      const Center(child: Text("Wall")),
      const Center(child: Text("Services")),
      const CityEyeMoreScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCityEyeBloc, MainCityEyeState>(
        listener: (context, state) {
      if (state is MainCityEyeChangeNavigationState) {
        _currentIndex = state.index;
      }
    }, builder: (context, state) {
      return Scaffold(
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBarWidget(
          onTap: (index) {
            _bloc.add(MainCityEyeChangeNavigationEvent(index));
          },
          currentIndex: _currentIndex,
        ),
      );
    });
  }
}
