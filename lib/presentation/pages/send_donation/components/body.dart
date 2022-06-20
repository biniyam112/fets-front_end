import 'package:fets_mobile/features/authentication/authentication.dart';
import 'package:fets_mobile/features/fund_project/bloc/fund_project_bloc.dart';
import 'package:fets_mobile/features/fund_project/bloc/fund_project_event.dart';
import 'package:fets_mobile/features/fund_project/bloc/fund_project_state.dart';
import 'package:fets_mobile/features/models/donation.dart';
import 'package:fets_mobile/features/models/project.dart';
import 'package:fets_mobile/features/payment/bloc/payment_bloc.dart';
import 'package:fets_mobile/features/payment/bloc/payment_state.dart';
import 'package:fets_mobile/presentation/pages/pages.dart';
import 'package:fets_mobile/service_locator.dart';
import 'package:fets_mobile/services/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import '../../../../features/payment/bloc/payment_event.dart';
import '../../../../theme/theme.dart';
import '../../../components/components.dart';
import 'payment_method.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
    required this.project,
  }) : super(key: key);
  final Project project;

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
  String cardNumber = '',
      expDate = '',
      cvv = '',
      amount = '0',
      transferFee = '0';
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
                      inputFormatter: [
                        LengthLimitingTextInputFormatter(16),
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      onChanged: (value) {
                        setState(() {
                          cardNumber = value;
                        });

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
                                inputType: TextInputType.datetime,
                                inputFormatter: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(6)
                                ],
                                onChanged: (value) {
                                  if (value.isNotEmpty &&
                                      errors
                                          .contains(kExpirationDateNullError)) {
                                    setState(() {
                                      errors.remove(kExpirationDateNullError);
                                    });
                                  }
                                },
                                validator: (value) {
                                  if (value!.isEmpty &&
                                      !errors
                                          .contains(kExpirationDateNullError)) {
                                    setState(() {
                                      errors.add(kExpirationDateNullError);
                                    });
                                    return '';
                                  } else if (value.isEmpty &&
                                      errors
                                          .contains(kExpirationDateNullError)) {
                                    return '';
                                  }
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
                                inputFormatter: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(4),
                                ],
                                onChanged: (value) {
                                  if (value.isNotEmpty &&
                                      errors.contains(kcvvNullError)) {
                                    setState(() {
                                      errors.remove(kcvvNullError);
                                    });
                                  }
                                },
                                validator: (value) {
                                  if (value!.isEmpty &&
                                      !errors.contains(kcvvNullError)) {
                                    setState(() {
                                      errors.add(kcvvNullError);
                                    });
                                    return '';
                                  } else if (value.isEmpty &&
                                      errors.contains(kcvvNullError)) {
                                    return '';
                                  }
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
                      inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (value) {
                        setState(() {
                          amount = value;
                          (value.isNotEmpty)
                              ? transferFee = (double.parse(value) * 0.01)
                                  .toStringAsFixed(2)
                              : '0';
                        });
                        if (value.isNotEmpty &&
                            errors.contains(kDonationAmountNullError)) {
                          setState(() {
                            errors.remove(kDonationAmountNullError);
                          });
                        }
                        if (value.isNotEmpty &&
                            double.parse(value) >= 1000 &&
                            errors.contains(kMinimumDonationAmountError)) {
                          setState(() {
                            errors.remove(kMinimumDonationAmountError);
                          });
                        }
                      },
                      validator: (value) {
                        if (value!.isEmpty &&
                            !errors.contains(kDonationAmountNullError)) {
                          setState(() {
                            errors.add(kDonationAmountNullError);
                          });
                          return '';
                        } else if (double.parse(value) < 1000) {
                          setState(() {
                            errors.add(kMinimumDonationAmountError);
                          });
                          return '';
                        } else if (value.isEmpty &&
                            errors.contains(kDonationAmountNullError)) {
                          return '';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              verticalSpacing(16.sp),
              FormFieldErrors(errors: errors),
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
                        amountEditingController.text.isNotEmpty
                            ? amountEditingController.text
                            : '0.00',
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
                            ? transferFee
                            : '0.00',
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
                            ? (double.parse(amount) + double.parse(transferFee))
                                .toString()
                            : '0.00',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ],
                  ),
                ],
              ),
              verticalSpacing(30.sp),
              BlocListener<PaymentBloc, PaymentState>(
                listener: (context, state) {
                  if (state is PaymentCompleted) {
                    if (state.response!.containsKey('error')) {
                      if (state.response!['error']['code'] ==
                          'amount_too_large') {
                        displayPaymentSnackBar(
                          context,
                          message: 'Maximum credit card limit reached',
                          textColor: Colors.red[600]!,
                        );
                      } else {
                        displayPaymentSnackBar(
                          context,
                          message: 'Please enter payment amount',
                          textColor: Colors.red[600]!,
                        );
                      }
                    } else {
                      BlocProvider.of<FundProjectBloc>(context).add(
                        FundProject(
                          donation: Donation(
                            amount: BigInt.parse(amount),
                            donorUsername:
                                Hive.box<User>('users').get('user')!.userName ??
                                    'biniyam112',
                            projectId: widget.project.id,
                            donatedAt: BigInt.from(0),
                          ),
                        ),
                      );
                    }
                  }
                  if (state is PaymentFailed) {
                    displayPaymentSnackBar(
                      context,
                      message: 'payment failed! try again',
                      textColor: Colors.red[600]!,
                    );
                  }
                },
                child: BlocListener<FundProjectBloc, FundProjectState>(
                  listener: (context, state) {
                    if (state is FundingProject) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          content: SizedBox(
                            height: .16.sh,
                            width: .8.sw,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50.sp,
                                  width: 50.sp,
                                  child: const CircularProgressIndicator(
                                    color: primaryColor,
                                  ),
                                ),
                                verticalSpacing(20.sp),
                                Text(
                                  'Donation loading',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    if (state is ProjectFunded) {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  DashboardScreen.route,
                                );
                              },
                              child: Text(
                                'Dashboard',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.blue),
                              ),
                            ),
                          ],
                          content: SizedBox(
                            height: .16.sh,
                            width: .8.sw,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  CupertinoIcons.checkmark_alt_circle,
                                  size: 50,
                                  color: Colors.green[800],
                                ),
                                verticalSpacing(20.sp),
                                Text(
                                  'Project successfuly funded',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(
                                        color: Colors.green[800],
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    if (state is ProjectFundingFailed) {
                      displayPaymentSnackBar(
                        context,
                        message: state.errorMessage,
                        textColor: Colors.red[600]!,
                      );
                    }
                  },
                  child: SizedBox(
                    height: 50.sp,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formstate.currentState!.validate() &&
                            errors.isEmpty) {
                          BlocProvider.of<PaymentBloc>(context).add(
                            MakePayment(
                                amount: (double.parse(amount) +
                                        double.parse(transferFee))
                                    .toString(),
                                currency: "USD"),
                          );
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  displayPaymentSnackBar(BuildContext context,
      {required String message, required Color textColor}) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        dismissDirection: DismissDirection.horizontal,
        content: SizedBox(
          height: 50.sm,
          width: 1.sw,
          child: Center(
            child: Text(
              message,
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        duration: const Duration(seconds: 4),
      ),
    );
  }
}
