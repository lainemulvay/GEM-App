import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'forgot_password01_widget.dart' show ForgotPassword01Widget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ForgotPassword01Model extends FlutterFlowModel<ForgotPassword01Widget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for forgotEmailAddress widget.
  FocusNode? forgotEmailAddressFocusNode;
  TextEditingController? forgotEmailAddressController;
  String? Function(BuildContext, String?)?
      forgotEmailAddressControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    forgotEmailAddressFocusNode?.dispose();
    forgotEmailAddressController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
