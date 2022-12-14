import 'package:flutter/material.dart';
import 'package:flutter_crud/common/constants.dart';
import 'package:flutter_crud/data/model/auth_info.dart';
import 'package:flutter_crud/data/model/user.dart';
import 'package:flutter_crud/data/repo/database_repository.dart';
import 'package:flutter_crud/ui/screens/auth/auth.dart';
import 'package:flutter_crud/ui/screens/root.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'profile',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: ValueListenableBuilder<AuthInfo?>(
        valueListenable: DataBaseRepository.authChangeNotifier,
        builder: (BuildContext context, value, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(ThemeConstants.themePadding),
            child: SizedBox(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  Text(value!.firstName,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .apply(fontWeightDelta: 3)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(value.email),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("${value.year} ${value.month} ${value.day}"),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  InkWell(
                    onTap: () async {
                      final repository =
                          Provider.of<DataBaseRepository<UserEntity>>(context,
                              listen: false);
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) {
                        return const RootScreen();
                      }));
                      repository.signout();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onPrimary,
                            borderRadius: BorderRadius.circular(
                                ThemeConstants.themeBorderRadius),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 6,
                                  color: Colors.black.withOpacity(.1))
                            ]),
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(
                            ThemeConstants.themePadding,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Logout',
                                style: TextStyle(color: Color(0xfff44336)),
                              ),
                              Icon(Icons.arrow_forward_ios_rounded)
                            ],
                          ),
                        )),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
