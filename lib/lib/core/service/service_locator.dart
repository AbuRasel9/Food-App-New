import 'package:foodly_ui/lib/core/data/sharePrefs/share_prefs.dart';
import 'package:foodly_ui/lib/core/data/sharePrefs/share_prefs_impl.dart';
import 'package:foodly_ui/lib/core/network/api_client.dart';
import 'package:get_it/get_it.dart';

final GetIt di=GetIt.instance;

void diSetup(){
 di.registerLazySingleton<SharePrefs>(() => SharePrefsImpl(),);
 di.registerLazySingleton<ApiClient>(() => ApiClient(),);
}