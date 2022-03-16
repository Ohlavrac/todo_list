import 'package:flutter/material.dart';
import 'package:todo_list/shared/theme/text_styles.dart';

class InputText extends StatelessWidget {
  final String label;
  final void Function(String value) onChanged;
  final void Function(String value)? onSubmit;
  final String? Function(String?)? validator;
  
  const InputText({ Key? key, required this.label, required this.onChanged, this.onSubmit, this.validator }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      height: 100,
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        onFieldSubmitted: onSubmit,
        decoration: InputDecoration(
          label: Text(label, style: TextStyles.simpleText,)
        ),
        style: TextStyles.simpleText
      ),
    );
  }
}