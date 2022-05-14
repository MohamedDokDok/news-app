import 'package:flutter/material.dart';
import 'my_app/my_app.dart';
import 'shared/local_storage_shared_pref/cache_helper.dart';
import 'shared/network_remote_dio/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  runApp(MyApp(isDark));
}

