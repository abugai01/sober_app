import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sober_app/cubits/profile_cubit.dart';
import 'package:sober_app/pages/main/main_page.dart';
import 'package:sober_app/pages/sign_in/mvc/auth_service.dart';
import 'package:sober_app/pages/sign_in/sign_in_page.dart';
import 'package:sober_app/services/database.dart';
import 'package:sober_app/widgets/custom_loading_indicator.dart';

//todo: remove bottom bar!

//todo: maybe this could be the main page?

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);

    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          User? user = snapshot.data;

          if (user == null) {
            return SignInPage();
            //todo: on login error (wrong password, etc.)
          }

          context.read<FirestoreDatabase>().uid = user.uid;

          // Making sure a document is created in the 'users' collections when a new user signs up
          context.read<ProfileCubit>().createIfNew(
              email: user.email); //todo: is there a better solution?

          //todo: do not reload the page every time!!!!

          return MainPage();
        }
        return Scaffold(body: CustomLoadingIndicator());
      },
    );
  }
}
