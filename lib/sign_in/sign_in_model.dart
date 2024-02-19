import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'sign_in_widget.dart' show SignInWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignInModel extends FlutterFlowModel<SignInWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for Name widget.
  FocusNode? nameFocusNode;
  TextEditingController? nameController;
  String? Function(BuildContext, String?)? nameControllerValidator;
  // State field(s) for signupEmailAddress widget.
  FocusNode? signupEmailAddressFocusNode;
  TextEditingController? signupEmailAddressController;
  String? Function(BuildContext, String?)?
      signupEmailAddressControllerValidator;
  // State field(s) for signupPassword widget.
  FocusNode? signupPasswordFocusNode;
  TextEditingController? signupPasswordController;
  late bool signupPasswordVisibility;
  String? Function(BuildContext, String?)? signupPasswordControllerValidator;
  // State field(s) for confirmPassword widget.
  FocusNode? confirmPasswordFocusNode;
  TextEditingController? confirmPasswordController;
  late bool confirmPasswordVisibility;
  String? Function(BuildContext, String?)? confirmPasswordControllerValidator;
  // State field(s) for loginEmailAddress widget.
  FocusNode? loginEmailAddressFocusNode;
  TextEditingController? loginEmailAddressController;
  String? Function(BuildContext, String?)? loginEmailAddressControllerValidator;
  // State field(s) for loginPassword widget.
  FocusNode? loginPasswordFocusNode;
  TextEditingController? loginPasswordController;
  late bool loginPasswordVisibility;
  String? Function(BuildContext, String?)? loginPasswordControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    signupPasswordVisibility = false;
    confirmPasswordVisibility = false;
    loginPasswordVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    nameFocusNode?.dispose();
    nameController?.dispose();

    signupEmailAddressFocusNode?.dispose();
    signupEmailAddressController?.dispose();

    signupPasswordFocusNode?.dispose();
    signupPasswordController?.dispose();

    confirmPasswordFocusNode?.dispose();
    confirmPasswordController?.dispose();

    loginEmailAddressFocusNode?.dispose();
    loginEmailAddressController?.dispose();

    loginPasswordFocusNode?.dispose();
    loginPasswordController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
