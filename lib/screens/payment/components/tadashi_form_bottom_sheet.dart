import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:streamit_laravel/utils/colors.dart';
import 'package:streamit_laravel/utils/common_base.dart';

class TadashiFormResult {
  final String name;
  final String description;
  final File? proofFile;
  TadashiFormResult({required this.name, required this.description, required this.proofFile});
}

class TadashiFormBottomSheet extends StatefulWidget {
  final String guideText;
  const TadashiFormBottomSheet({super.key, required this.guideText});

  @override
  State<TadashiFormBottomSheet> createState() => _TadashiFormBottomSheetState();
}

class _TadashiFormBottomSheetState extends State<TadashiFormBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _desc = TextEditingController();
  File? _file;
  bool _loading = false;

  Future<void> _pickImage(ImageSource src) async {
    final XFile? picked = await ImagePicker().pickImage(source: src, maxWidth: 1800, maxHeight: 1800);
    if (picked != null) setState(() => _file = File(picked.path));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: btnColor,
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Elige un método de pago: Tadashi', style: primaryTextStyle(color: white, size: 16)),
              12.height,
              AppTextField(
                controller: _name,
                textFieldType: TextFieldType.NAME,
                decoration: inputDecoration(context, labelText: 'Nombre'),
                validator: (v) => v.validate().isEmpty ? 'Requerido' : null,
              ),
              12.height,
              AppTextField(
                controller: _desc,
                textFieldType: TextFieldType.MULTILINE,
                decoration: inputDecoration(context, labelText: 'Descripción'),
                minLines: 1,
                maxLines: 3,
              ),
              12.height,
              Container(
                padding: const EdgeInsets.all(12),
                decoration: boxDecorationDefault(color: canvasColor, borderRadius: radius(6)),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Guía de pago', style: primaryTextStyle(color: white)),
                  8.height,
                  Text(widget.guideText, style: secondaryTextStyle(color: white)),
                ]),
              ),
              12.height,
              Row(children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _pickImage(ImageSource.gallery),
                    child: const Text('Elegir archivo'),
                  ),
                ),
                12.width,
                if (_file != null) Expanded(child: Text(_file!.path.split('/').last, style: secondaryTextStyle(color: white))),
              ]),
              16.height,
              AppButton(
                color: appColorPrimary,
                text: _loading ? 'Enviando...' : 'Proceder al pago',
                onTap: () {
                  if (_loading) return;
                  if (_formKey.currentState?.validate() ?? false) {
                    Get.back(result: TadashiFormResult(name: _name.text.trim(), description: _desc.text.trim(), proofFile: _file));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}