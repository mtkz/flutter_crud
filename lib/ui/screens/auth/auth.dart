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
              const _Separator(height: 15,),
              TextField(),
              const _Separator(height: 12,),
              TextField(),
              const _Separator(height: 12,),
              TextField(),
              const _Separator(height: 12,),
              TextField(),
              const _Separator(height: 12,),
              TextField(),
              const _Separator(height: 25,),
              Container(
                decoration: BoxDecoration(
                  color: themeData.colorScheme.primary,
                  borderRadius:
                      BorderRadius.circular(ThemeConstants.themeBorderRadius),
                ),
                width: size.width,
                height: 45,
                child: Center(
                  child: Text(
                    'register',
                    style: TextStyle(
                      color: themeData.colorScheme.onPrimary,
                    ),
                  ),
                ),
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
