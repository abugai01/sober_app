//todo: remove unncesessary imports
//todo: remove compulsory authorization
//todo: cupertino adaptation

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sober_app/cubits/profile_cubit.dart';
import 'package:sober_app/cubits/settings_cubit.dart';
import 'package:sober_app/pages/home_page.dart';
import 'package:sober_app/pages/sign_in/mvc/auth_service.dart';
import 'package:sober_app/services/database.dart';
import 'package:sober_app/services/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize SharedPrefs instance.
  await SharedPrefs.init();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

//todo: if 366 days then 1 year 1 day, also 35 days -> 1 month 4 days!
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<AuthBase>(
      create: (context) => Auth(),
      child: Provider<FirestoreDatabase>(
        create: (_) => FirestoreDatabase(),
        child: MultiBlocProvider(
          providers: [
            //todo: all of them needed here or not? think
            BlocProvider<ProfileCubit>(
                create: (context) =>
                    ProfileCubit(context.read<FirestoreDatabase>())),
            BlocProvider<SettingsCubit>(create: (context) => SettingsCubit()),
          ],
          child: MaterialApp(
            title: 'Sober App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme:
                  GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
              primarySwatch: Colors.grey,
            ),
            home: HomePage(),
          ),
        ),
      ),
    );
  }
}
