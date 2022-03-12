import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sober_app/cubits/settings_cubit.dart';
import 'package:sober_app/models/streak.dart';
import 'package:sober_app/pages/main/widgets/streak_counter_v1.dart';
import 'package:sober_app/pages/main/widgets/streak_counter_v2.dart';
import 'package:sober_app/pages/main/widgets/streak_counter_v3.dart';
import 'package:sober_app/pages/main/widgets/streak_counter_v4.dart';

class StreakCounterWrapper extends StatelessWidget {
  final int version;

  const StreakCounterWrapper({required this.version, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Streak streak = context
        .read<SettingsCubit>()
        .streak; //todo: remove from here! or not, idk

    switch (version) {
      case 1:
        return StreakCounterV1(streak);
      case 2:
        return StreakCounterV2(streak);
      case 3:
        return StreakCounterV3(streak);
      case 4:
        return StreakCounterV4(streak);
      default:
        return StreakCounterV1(streak);
    }
  }
}
