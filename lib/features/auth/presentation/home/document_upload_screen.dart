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
  late List<String> _dropDownOpts; /// = KycDocType.dropDownOpts();
  /// * dropdown value
  late String _dropdownValue;  ///= dropDownOpts.first;

  List<DropdownMenuItem<String>> createDropDownMenuItems() {
    return _dropDownOpts.map((opt) => 
      DropdownMenuItem(
        value: opt,
        child: Text(opt),
      )).toList();
  }

  @override
  void initState() {
    super.initState();
    /// TODO is there a better way to do this
    /// init dropdown
    _dropDownOpts = KycDocType.dropDownOpts();
    _dropdownValue = _dropDownOpts.first;
  }

  @override
  void dispose() {
    super.dispose();
    /// TODO dispose of dropdown value required ?
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
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
                setState(() {
                  _dropdownValue = value!;
                });
              }
            )
          ],
        ),
      ),
    );
  }
}