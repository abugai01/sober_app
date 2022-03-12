import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sober_app/cubits/main_page_cubit.dart';
import 'package:sober_app/cubits/states/main_page_state.dart';
import 'package:sober_app/helpers/ui_messages.dart';
import 'package:sober_app/pages/main/widgets/streak_counter_wrapper.dart';
import 'package:sober_app/widgets/bottom_bar.dart';

//todo: remove bottom bar!

//todo: maybe this could be the main page?

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomBar(0),
      body: BlocProvider<MainPageCubit>(
        create: (context) => MainPageCubit(),
        //todo: possible to turn off lazy instantiation  and put builder lower?

        child: BlocBuilder<MainPageCubit, MainPageState>(
            builder: (context, state) {
          if (state is MainPageGenericState) {
            return Stack(fit: StackFit.expand, children: <Widget>[
              Positioned(
                  top: 32,
                  right: 4, //todo: handle safe area!
                  child: IconButton(
                    icon: const Icon(Icons.threesixty, size: 28),
                    onPressed: () => context.read<MainPageCubit>().updatePage(),
                  )),
              Align(
                alignment: Alignment.center,
                child: StreakCounterWrapper(version: state.version),
              ),
            ]);
          } else {
            return const Center(
                child: Text(ErrorMessages.errorGeneric)); //todo: widget
          }
        }),
      ),
    );
  }
}
