import 'package:bloc_full_learn/104-bloc-with-firebase/bloc/app_event.dart';
import 'package:bloc_full_learn/104-bloc-with-firebase/dialogs/delete_account_dialog.dart';
import 'package:bloc_full_learn/104-bloc-with-firebase/dialogs/logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/app_bloc.dart';

enum MenuAction { logout, deleteAccount }

class MainPopUpMenuButton extends StatelessWidget {
  const MainPopUpMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<MenuAction>(
      onSelected: (value) async {
        switch (value) {
          case MenuAction.logout:
            final shouldLogOut = await showLogOutDialog(context);
            if (shouldLogOut) {
              context.read<AppBloc>().add(
                    const AppEventLogOut(),
                  );
            }
            break;
          case MenuAction.deleteAccount:
            final shouldDeleteAccount = await showDeleteAccountDialog(context);
            if (shouldDeleteAccount) {
              context.read<AppBloc>().add(
                    const AppEventDeleteAccount(),
                  );
            }
            break;
        }
      },
      itemBuilder: (context) {
        return [
          const PopupMenuItem<MenuAction>(
            value: MenuAction.logout,
            child: Text('Log out'),
          ),
          const PopupMenuItem<MenuAction>(
            value: MenuAction.deleteAccount,
            child: Text('Delete account'),
          ),
        ];
      },
    );
  }
}
