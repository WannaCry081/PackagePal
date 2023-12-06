import "package:flutter/material.dart";
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import "package:google_fonts/google_fonts.dart";

class CustomFormField extends StatefulWidget {
  final TextEditingController formData;
  final String? formHintText;
  final String? formLabelText;
  final bool formObsecure;

  const CustomFormField(
      {Key? key,
      required this.formData,
      this.formHintText,
      this.formLabelText,
      this.formObsecure = false})
      : super(key: key);

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool isObsecure = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 55,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withAlpha(20),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          controller: widget.formData,
          obscureText: (!isObsecure && widget.formObsecure),
          decoration: InputDecoration(
              labelStyle: GoogleFonts.poppins(
                fontSize : 14
              ),
              labelText: widget.formLabelText,
              hintText: widget.formHintText,
              suffixIcon: GestureDetector(
                onTap: () => setState(() {
                  isObsecure = !isObsecure;
                }),
                child: (widget.formObsecure)
                    ? (!isObsecure)
                        ? const Icon(FeatherIcons.eye)
                        : const Icon(FeatherIcons.eyeOff)
                    : const Icon(Icons.abc, size: 0),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade200)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade200)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red.shade300)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary))),
        ),
      ),
    );
  }
}
