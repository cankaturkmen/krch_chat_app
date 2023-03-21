import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputField extends StatelessWidget {
  InputField(
      {Key? key,
      required this.hintText,
      this.validator,
      this.controller,
      this.hintStyle,
      this.errorText = "",
      this.obsecureText = false,
      this.helperText = "",
      this.maxLines = null,
      this.enabled = true,
      this.initialValue,
      this.labelStyle,
      this.textInputType = TextInputType.text,
      this.prefixIcon,
      this.onChanged,
      this.readOnly = false,
      this.onTap,
      this.enableInteractiveSelection = false,
      this.textInputFormatter = const [],
      required this.icon})
      : super(key: key);
  final IconData icon;
  final String hintText;
  String errorText;
  String helperText;
  bool obsecureText;
  bool enableInteractiveSelection;
  bool enabled;
  bool readOnly;
  GestureTapCallback? onTap;
  Icon? prefixIcon;
  TextInputType textInputType;
  String? Function(String?)? validator;
  TextEditingController? controller;
  Function(String?)? onChanged;
  String? initialValue;
  int? maxLines;
  TextStyle? hintStyle;
  TextStyle? labelStyle;
  List<TextInputFormatter> textInputFormatter;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      readOnly: readOnly,
      onChanged: onChanged,
      onTap: onTap,
      enabled: enabled,
      maxLines: maxLines,
      enableInteractiveSelection: enableInteractiveSelection,
      controller: controller,
      inputFormatters: textInputFormatter,
      keyboardType: textInputType,
      obscureText: obsecureText,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        //todo focus color
        iconColor: Colors.blue,
        hoverColor: Colors.amber,
        focusColor: Colors.blueAccent,

        icon: Icon(icon),
        hintText: hintText,
        helperText: helperText,
        labelText: hintText,
        hintStyle: hintStyle,
        labelStyle: labelStyle,
        border: const OutlineInputBorder(),
      ),
      validator: validator,
    );
  }
}

// class InputField extends StatefulWidget {
//   InputField(
//       {Key? key,
//       required this.hintText,
//       required this.validator,
//       required this.controller,
//       this.errorText = "",
//       this.obsecureText = false,
//       this.helperText = "",
//       this.textInputType = TextInputType.text,
//       this.textInputFormatter = const [],
//       required this.icon})
//       : super(key: key);
//   final IconData icon;
//   final String hintText;
//   String errorText;
//   String helperText;
//   bool obsecureText;
//   TextInputType textInputType;
//   String? Function(String?)? validator;
//   TextEditingController? controller;
//   List<TextInputFormatter> textInputFormatter;
//   @override
//   State<InputField> createState() => _InputFieldState();
// }

// class _InputFieldState extends State<InputField> {
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: widget.controller,
//       inputFormatters: widget.textInputFormatter,
//       keyboardType: widget.textInputType,
//       obscureText: widget.obsecureText,
//       decoration: InputDecoration(
//         //todo focus color
//         iconColor: Colors.red,
//         hoverColor: Colors.amber,
//         focusColor: Colors.red,
//         icon: Icon(widget.icon),
//         hintText: widget.hintText,
//         helperText: widget.helperText,
//         labelText: widget.hintText,
//         border: const OutlineInputBorder(),
//       ),
//       validator: widget.validator,
//     );
//   }
// }
