import 'package:assist_teacher/colors.dart';
import 'package:assist_teacher/subjects_data/screens/auto_test_screen.dart';
import 'package:flutter/material.dart';

// not in use for now
class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('Select Test Type'),
            automaticallyImplyLeading: false,
            backgroundColor: MyColors.myOrange,
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Full/Selected Length Auto',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(AutoTestScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Full Length Custom',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              // Navigator.of(context)
              //     .pushReplacementNamed(OrdersScreen.routeName);
              // Navigator.of(context).pushReplacement(
              //   CustomRoute(
              //     builder: (ctx) => const OrdersScreen(),
              //   ),
              // );
            },
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Selected Marks Custom',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              // Navigator.of(context).pop();
              // Navigator.of(context).pushReplacementNamed('/');
              // Navigator.of(context)
              //     .pushReplacementNamed(UserProductsScreen.routeName);
              // Provider.of<Auth>(context, listen: false).logout();
            },
          ),
        ],
      ),
    );
  }
}
