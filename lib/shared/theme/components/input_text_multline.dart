import 'package:flutter/material.dart';
import 'package:todo_list/shared/theme/text_styles.dart';

class InputTextMultline extends StatelessWidget {
  final String label;
  final void Function(String value) onChanged;
  final void Function(String value)? onSubmit;
  
  const InputTextMultline({ Key? key, required this.label, required this.onChanged, this.onSubmit }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      height: 100,
      child: TextFormField(
        onChanged: onChanged,
        onFieldSubmitted: onSubmit,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        decoration: InputDecoration(
          label: Text(label, style: TextStyles.simpleText,)
        ),
        style: TextStyles.simpleText
      ),
    );
  }
}