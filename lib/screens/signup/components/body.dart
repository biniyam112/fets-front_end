import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset('assets/images/handshake.jpg'),
        Text(
          'Sign up',
          style: Theme.of(context).textTheme.headline4,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Full name',
            hintStyle: Theme.of(context).textTheme.headline6,
          ),
        ),
      ],
    );
  }
}
