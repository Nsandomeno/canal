import 'package:canal/widgets/responsive_info_panel.dart';
import 'package:canal/widgets/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:canal/localization/string_hardcoded.dart';
import 'package:canal/utils/async_value_ui.dart';
import 'package:canal/widgets/async_widget.dart';
import 'package:canal/widgets/user_app_bar.dart';
import 'package:canal/constants/sizes.dart';
import 'package:canal/widgets/responsive_text.dart';
import 'package:canal/features/account/domain/document.dart';
import 'package:canal/features/auth/presentation/home/document_upload_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// screen for uploading documents to be directly or later attached 
/// to a KYC process related to an account
class KycDocumentUploadScreen extends ConsumerWidget {
  const KycDocumentUploadScreen({super.key});

  @override 
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      appBar: UserAppBar(),
      body: KycDocumentUploadContents(),
    );
  }
}
/// stateful widget for uploading documents
/// state includes document type, file name, and file data prior to
/// submission
class KycDocumentUploadContents extends ConsumerStatefulWidget {
  const KycDocumentUploadContents({super.key});

  @override
  ConsumerState<KycDocumentUploadContents> createState() =>
    _KycDocumentUploadState();
}

class _KycDocumentUploadState extends ConsumerState<KycDocumentUploadContents> {
  /// * dropdown options
  late List<String> _dropDownOpts; /// = KycDocCategory.dropDownOpts();
  /// * dropdown value
  late String _dropdownValue;  ///= dropDownOpts.first;
  late KycDocCategory _docCategoryValue;

  List<DropdownMenuItem<String>> createDropDownMenuItems() {
    return _dropDownOpts.map((opt) => 
      DropdownMenuItem(
        value: opt,
        child: Text(opt),
      )).toList();
  }

  void dropdownOnChange(String? newVal) {
    /// * sets state on update of DropdownButton
    final newVariant = KycDocCategory.displayTextToVariant(newVal!);
    setState(() {
      _dropdownValue = newVal;
      _docCategoryValue = newVariant;
    });
  }

  @override
  void initState() {
    super.initState();
    /// TODO is there a better way to do this
    /// init dropdown
    _dropDownOpts = KycDocCategory.dropDownOpts();
    _dropdownValue = _dropDownOpts.first;
    /// variant for value
    _docCategoryValue = KycDocCategory.displayTextToVariant(_dropdownValue);
  }

  @override
  void dispose() {
    super.dispose();
    /// TODO dispose of dropdown value required ?
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            DropdownButton<String>(
              items: createDropDownMenuItems(), 
              value: _dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.teal),
              underline: Container(
                height: 2,
                color: Colors.teal,
              ),
              onChanged: (String? value) {
                dropdownOnChange(value);
              }
            ),
            gapH12,
            KycDocUpload(docCategory: _docCategoryValue),
          ],
        );
  }
}
/// dynamic panels for uploading documents, based on KycDocCategory
/// * docCategory == KycDocCategory.drivers --> there will be a front/back panel
/// * docCategory == KycDocCategory.passport --> there will be one single panel
class KycDocUpload extends StatelessWidget {
  const KycDocUpload({super.key, required this.docCategory});

  final KycDocCategory docCategory;

  Widget uploadCol() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ResponsiveText(text: "Select from camera roll or capture"),
        StyledButton(text: "Select"),
        StyledButton(text: "Take Photo")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    /// determine the upload requirements expressed in terms of KycDocType variants
    /// * example:
    /// *        docCategory == KycDocCategory.drivers
    /// *
    /// *         then, categoryRequirements will evaluate to 
    /// *               [KycDocType.driversFront, KycDocType.driversBack]
    final categoryRequirements = KycDocCategory.getKycDocCategoryRequirements(
      docCategory
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
       const ResponsiveText(text: "Upload the front of your document here."),
        Card(
          child: uploadCol(),
        ),
        gapH8,
        if (categoryRequirements.length > 1) ... [
            const ResponsiveText(text: "Upload the back of your document here."),
            Card(
              child: uploadCol(),
            ),
        ]
      ],
    );
  }
}
