import 'package:flutter/material.dart';
import 'package:flutter_crud/common/constants.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(ThemeConstants.themePadding),
      child: SingleChildScrollView(
        physics: ThemeConstants.themeScrollViewPhysics,
        child: SizedBox(
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'register',
                style: themeData.textTheme.headline5,
              ),
              const _Separator(
                height: 15,
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'First Name'),
              ),
              const _Separator(
                height: 12,
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Last Name'),
              ),
              const _Separator(
                height: 12,
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Phone Number'),
              ),
              const _Separator(
                height: 12,
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'E-mail'),
              ),
              const _Separator(
                height: 12,
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Bank Account Number'),
              ),
              const _Separator(
                height: 25,
              ),
              Flex(
                direction: Axis.horizontal,
                children:const [
                   Flexible(
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Year'),
                    ),
                  ),
                   SizedBox(
                    width: ThemeConstants.themePadding,
                  ),
                   Flexible(
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Month'),
                    ),
                  ),
                   SizedBox(
                    width: ThemeConstants.themePadding,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Day'),
                    ),
                  ),
                ],
              ),
              const _Separator(height: 22),
              Container(
                decoration: BoxDecoration(
                  color: themeData.colorScheme.primary,
                  borderRadius:
                      BorderRadius.circular(ThemeConstants.themeBorderRadius),
                ),
                width: size.width,
                height: 50,
                child: Center(
                  child: Text(
                    'register',
                    style: TextStyle(
                      color: themeData.colorScheme.onPrimary,
                    ),
                  ),
                ),
              ),
              const _Separator(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('have account ?'),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    'login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: themeData.colorScheme.primary,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Separator extends StatelessWidget {
  final double height;
  const _Separator({
    Key? key,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}