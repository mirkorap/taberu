import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:stilo/stilo.dart';
import 'package:taberu/themes/app_input.dart';

class OrderNotesForm extends StatelessWidget {
  const OrderNotesForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'checkout.notes',
            style: Theme.of(context).textTheme.headline2,
          ).tr(),
          StiloSpacing.vert4,
          TextField(
            maxLines: 8,
            decoration: AppInput.inputTextField.copyWith(
              hintText: tr('checkout.notes_hint_text'),
            ),
          ),
        ],
      ),
    );
  }
}
