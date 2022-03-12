import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sober_app/config/style.dart';
import 'package:sober_app/cubits/settings_cubit.dart';
import 'package:sober_app/cubits/states/settings_state.dart';
import 'package:sober_app/helpers/date_formatter.dart';
import 'package:sober_app/widgets/bottom_bar.dart';
import 'package:sober_app/widgets/custom_text.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: Colors.white)),
        elevation: 0,
        automaticallyImplyLeading: false,
        //centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            color: white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //todo: implement calendar
                //todo: widget!
                ListTile(
                  title: CustomText("I am sober since"),
                  enabled: false,
                  trailing: BlocBuilder<SettingsCubit, SettingsState>(
                      builder: (context, state) {
                    if (state is SettingsLoadedState) {
                      return GestureDetector(
                        onTap: () =>
                            context.read<SettingsCubit>().select(context),
                        child: Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(3)),
                            color: themeUltraLightGrey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: CustomText(
                                state.streak.dateOfLastDrinkText(
                                    fmt: DateFormats.MonDDYYYY),
                                color: Colors.blue),
                          ),
                        ),
                      );
                    } else {
                      //todo: think about error handling and display it!
                      return Text("Couldn't load");
                    }
                  }),
                ),
                ListTile(
                    title: CustomText("Reset", color: Colors.pinkAccent),
                    trailing: null,
                    onTap: () {
                      context.read<SettingsCubit>().reset();
                      HapticFeedback.vibrate();
                    }
                    //todo: refresh widget!
                    ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(3),
    );
  }
}
