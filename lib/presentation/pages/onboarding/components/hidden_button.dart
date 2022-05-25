import 'package:fets_mobile/presentation/pages/pages.dart';
import 'package:flutter/material.dart';

class HiddenButton extends StatelessWidget {
  const HiddenButton({
    Key? key,
    this.isVisible = false,
  }) : super(key: key);

  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          ),
        ),
        onPressed: () {
          Navigator.popAndPushNamed(context, SignUpScreen.route);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 10,
          ),
          child: Text(
            'Get Started',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      replacement: SizedBox.shrink(),
    );
  }
}
