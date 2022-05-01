import 'package:fets_mobile/services/size_config.dart';
import 'package:fets_mobile/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset('assets/images/handshake.jpg'),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign up',
                  style: Theme.of(context)
                      .textTheme
                      .headline3!
                      .copyWith(fontSize: 30),
                ),
                verticalSpacing(20),
                CustomInputField(
                  placeHolder: 'full name',
                  prefixIcon: CupertinoIcons.rectangle,
                  editingController: nameController,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    Key? key,
    required this.placeHolder,
    required this.prefixIcon,
    required this.editingController,
  }) : super(key: key);
  final String placeHolder;
  final IconData prefixIcon;
  final TextEditingController editingController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: textfieldBackground,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: editingController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: lightTextColor,
          ),
          hintText: placeHolder,
          hintStyle: Theme.of(context).textTheme.headline5!.copyWith(
                color: lightTextColor,
              ),
        ),
      ),
    );
  }
}
