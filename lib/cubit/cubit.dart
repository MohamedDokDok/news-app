import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/network_remote_dio/constant_end_piont.dart';
import '../modules/business/business_screen.dart';
import '../modules/science/science_screen.dart';
import '../modules/sports/sports_screen.dart';
import '../shared/local_storage_shared_pref/cache_helper.dart';
import '../shared/network_remote_dio/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavigationBarItem = [
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.business_center_outlined,
      ),
      label: 'business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'science',
    ),
    const BottomNavigationBarItem(
      icon: Icon(
        Icons.sports_baseball,
      ),
      label: 'sports',
    ),
  ];

  void changeIndex({
    required int index,
  }) {
    if (index == 1) getScience();
    if (index == 2) getSports();
    currentIndex = index;
    emit(NewsBottomNavState());
  }

  List<Widget> screens = [
    const BusinessScreen(),
    const ScienceScreen(),
    const SportsScreen(),
  ];

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper().getData(url: getDataUrl, query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': apiKey,
    }).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((onError) {
      print('Error occurred when get dat ${onError.toString()}');
      emit(NewsGetBusinessErrorState(onError));
    });
  }

  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.isEmpty) {
      DioHelper().getData(url: getDataUrl, query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': apiKey,
      }).then((value) {
        sports = value.data['articles'];
        //print(sports[0]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((onError) {
        print('Error occurred when get dat ${onError.toString()}');
        emit(NewsGetSportsErrorState(onError));
      });
    } else {
      emit(NewsGetSportsLoadingState());
    }
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.isEmpty) {
      DioHelper().getData(url: getDataUrl, query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': apiKey,
      }).then((value) {
        science = value.data['articles'];
        //print(science[0]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((onError) {
        print('Error occurred when get dat ${onError.toString()}');
        emit(NewsGetScienceErrorState(onError));
      });
    } else {
      emit(NewsGetScienceLoadingState());
    }
  }

  List<dynamic> search = [];
  void getSearch(String str) {
    emit(NewsGetSearchLoadingState());
    DioHelper().getData(url: getSearchDataUrl, query: {
      'q': str,
      'apiKey': '8d968ecd558f4834af244c8c6817ce14',
    }).then((value) {
      search = value.data['articles'];
      //print(search[0]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((onError) {
      print('Error occurred when get dat ${onError.toString()}');
      emit(NewsGetSearchErrorState(onError));
    });
  }

  bool isDark = false;
  void changeMode({bool? shared}) {
    if (shared != null) {
      isDark = shared;
      emit(NewsChangeAppModeState());
    } else {
      isDark = !isDark;
      CacheHelper.saveData(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeAppModeState());
      });
    }
  }
}
