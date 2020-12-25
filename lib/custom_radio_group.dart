import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioGroup<T> extends FormField<T> {
  final Key key;
  final T initialValue;
  final FormFieldSetter<T> onSaved;
  final FormFieldValidator<T> validator;
  final List<RadioListTile<T>> radioButtons;
  final TextStyle errorTextStyle;

  RadioGroup(
      {this.key,
      this.initialValue,
      this.onSaved,
      this.validator,
      this.errorTextStyle,
      this.radioButtons})
      : super(
          key: key,
          initialValue: initialValue,
          autovalidateMode: AutovalidateMode.disabled,
          onSaved: onSaved,
          validator: validator,
          builder: (FormFieldState<T> field) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: radioButtons,
                ),
                if (field.errorText != null)
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      field.errorText,
                      style: errorTextStyle,
                    ),
                  ),
              ],
            );
          },
        );

  @override
  RadioGroupState<T> createState() => RadioGroupState<T>();
}

class RadioGroupState<T> extends FormFieldState<T> {
  @override
  RadioGroup<T> get widget => super.widget as RadioGroup;

  @override
  void didUpdateWidget(RadioGroup<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    final checkedRadioButton = widget.radioButtons.firstWhere(
      (element) => element.checked,
      orElse: () => null,
    );

    if (checkedRadioButton.groupValue != null)
      setValue(checkedRadioButton.groupValue);
  }
}
