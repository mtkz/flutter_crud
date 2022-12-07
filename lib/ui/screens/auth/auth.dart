import 'package:flutter/material.dart';
import 'package:flutter_crud/common/constants.dart';
import 'package:flutter_crud/data/validator/form_validator.dart';
import 'package:flutter_crud/ui/screens/profile/profile.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

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
          child: Form(
            key: _formkey,
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
                TextFormField(
                  decoration: const InputDecoration(labelText: 'First Name'),
                  controller: _firstNameController,
                  validator: (text) =>
                      Validator.inputValidator(_firstNameController.text),
                ),
                const _Separator(
                  height: 12,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Last Name'),
                  controller: _lastNameController,
                  validator: (text) =>
                      Validator.inputValidator(_lastNameController.text),
                ),
                const _Separator(
                  height: 12,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  controller: _phoneNumberController,
                  validator: (text) => Validator.phoneNumberInputValidator(
                      _phoneNumberController.text),
                ),
                const _Separator(
                  height: 12,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'E-mail'),
                  controller: _emailController,
                  validator: (text) =>
                      Validator.emailInputValidator(_emailController.text),
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
                  children: const [
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
                InkWell(
                  onTap: () {
                    if (_formkey.currentState!.validate()) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: themeData.colorScheme.primary,
                      borderRadius: BorderRadius.circular(
                          ThemeConstants.themeBorderRadius),
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
