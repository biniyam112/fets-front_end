import 'package:fets_mobile/helper/payment_controller.dart';
import 'package:fets_mobile/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import '../../../../theme/theme.dart';
import '../../../components/components.dart';
import 'payment_method.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController cardEditingController = TextEditingController();
  TextEditingController expirationEditingController = TextEditingController();
  TextEditingController codeEditingController = TextEditingController();
  TextEditingController amountEditingController = TextEditingController();
  List<String> errors = [];
  final GlobalKey<FormState> _formstate = GlobalKey();
  String cardNumber = '', expDate = '', cvv = '', amount = '';
  PaymentController paymentController =
      PaymentController(client: http.Client());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.sh,
      width: 1.sw,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PaymentMethod(),
              Form(
                key: _formstate,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpacing(20.sp),
                    Text(
                      'Card number',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    verticalSpacing(8.sp),
                    CustomTextField(
                      placeHolder: 'XXXX-XXXX-XXXX-XXXX',
                      prefixIcon: const Icon(CupertinoIcons.creditcard_fill),
                      editingController: cardEditingController,
                      inputType: TextInputType.number,
                      onChanged: (value) {
                        if (value.isNotEmpty &&
                            errors.contains(kBankAddressNullError)) {
                          setState(() {
                            errors.remove(kBankAddressNullError);
                          });
                        }
                      },
                      validator: (value) {
                        if (value!.isEmpty &&
                            !errors.contains(kBankAddressNullError)) {
                          setState(() {
                            errors.add(kBankAddressNullError);
                          });
                          return '';
                        } else if (value.isEmpty &&
                            errors.contains(kBankAddressNullError)) {
                          return '';
                        }
                        return null;
                      },
                    ),
                    verticalSpacing(20.sp),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Expiration Date',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              verticalSpacing(8.sp),
                              CustomTextField(
                                placeHolder: 'mm-yyyy',
                                prefixIcon: const Icon(CupertinoIcons.calendar),
                                editingController: expirationEditingController,
                                inputType: TextInputType.text,
                                onChanged: (value) {},
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                        horizontalSpacing(16.sp),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Security Code',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              verticalSpacing(8.sp),
                              CustomTextField(
                                placeHolder: 'CVV',
                                contentPadding: const EdgeInsets.only(left: 12),
                                suffixIcon:
                                    const Icon(CupertinoIcons.creditcard),
                                editingController: codeEditingController,
                                inputType: TextInputType.number,
                                onChanged: (value) {},
                                validator: (value) {
                                  return null;
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    verticalSpacing(20.sp),
                    Text(
                      'Amount',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    verticalSpacing(8.sp),
                    CustomTextField(
                      placeHolder: 'amount',
                      prefixIcon: const Icon(CupertinoIcons.money_dollar),
                      editingController: amountEditingController,
                      inputType: TextInputType.number,
                      onChanged: (value) {},
                      validator: (value) {
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              verticalSpacing(40.sp),
              const Divider(
                thickness: 3,
                color: lightTextColor,
              ),
              verticalSpacing(30.sp),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Transfer amount',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const Spacer(),
                      Text(
                        amountEditingController.text,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Transfer fee',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const Spacer(),
                      Text(
                        amountEditingController.text.isNotEmpty
                            ? '${int.parse(amountEditingController.text) * 0.01}'
                            : '',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Total amount',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      const Spacer(),
                      Text(
                        amountEditingController.text.isNotEmpty
                            ? '${int.parse(amountEditingController.text) * 0.1 + int.parse(amountEditingController.text)}'
                            : '',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpacing(30.sp),
              SizedBox(
                height: 50.sp,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // if (_formstate.currentState!.validate() & errors.isEmpty) {
                    // Navigator.pushNamed(context, MyDonationsScreen.route);
                    paymentController.makePayment(
                      amount: '100',
                      currency: 'USD',
                    );
                    // }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                  ),
                  child: Text(
                    'Confirm Payment',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
