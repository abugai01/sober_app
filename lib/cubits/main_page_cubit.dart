import 'package:flutter_bloc/flutter_bloc.dart';

import 'states/main_page_state.dart';

class MainPageCubit extends Cubit<MainPageState> {
  late int version;

  MainPageCubit() : super(MainPageGenericState()) {
    version = 1; //todo: shared prefs saving
  }

  updatePage() {
    _incrementVersion();
    emit(MainPageGenericState(version: version));
  }

  _incrementVersion() {
    int maxVersion = 4;
    int minVersion = 1;

    if (version < maxVersion) {
      version += 1;
    } else {
      version = minVersion;
    }
  }
}
