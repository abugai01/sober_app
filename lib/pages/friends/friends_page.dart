import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sober_app/cubits/friends_cubit.dart';
import 'package:sober_app/cubits/states/friends_state.dart';
import 'package:sober_app/helpers/ui_messages.dart';
import 'package:sober_app/services/database.dart';
import 'package:sober_app/widgets/bottom_bar.dart';
import 'package:sober_app/widgets/custom_loading_indicator.dart';

class FriendsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends', style: TextStyle(color: Colors.white)),
        elevation: 0,
        automaticallyImplyLeading: false,
        //centerTitle: true,
      ),
      body: BlocProvider<FriendsCubit>(
        create: (context) => FriendsCubit(context.read<FirestoreDatabase>()),
        child:
            BlocBuilder<FriendsCubit, FriendsState>(builder: (context, state) {
          if (state is FriendsLoadedState) {
            int length = state.friends.length;

            if (length > 0) {
              return ListView.builder(
                  itemCount: state.friends.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.friends[index].name ?? 'Unknown'),
                      subtitle: Text(state.friends[index].username ??
                          ''), //todo: null safety
                      trailing: Text(state.friends[index].sobrietyStreakText),
                    );
                  });
            } else {
              return const Center(child: Text(UiMessages.noFriends));
            }
          } else if (state is FriendsLoadingState) {
            return CustomLoadingIndicator();
          } else {
            return const Center(child: Text(ErrorMessages.errorGeneric));
          }
        }),
      ),
      bottomNavigationBar: BottomBar(1),
    );
  }
}
