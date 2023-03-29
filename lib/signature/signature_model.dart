import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/detail_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';

class SignatureModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Signature1 widget.
  late SignatureController signature1Controller;
  String uploadedSignatureUrl1 = '';
  // State field(s) for searchField232 widget.
  TextEditingController? searchField232Controller;
  String? Function(BuildContext, String?)? searchField232ControllerValidator;
  // Algolia Search Results from action on searchField232
  List<ProduitsRecord>? algoliaSearchResults = [];
  // State field(s) for Signature122 widget.
  late SignatureController signature122Controller;
  String uploadedSignatureUrl2 = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    signature1Controller = SignatureController(
      penStrokeWidth: 2.0,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
    );
    signature122Controller = SignatureController(
      penStrokeWidth: 2.0,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
    );
  }

  void dispose() {
    signature1Controller.dispose();
    searchField232Controller?.dispose();
    signature122Controller.dispose();
  }

  /// Additional helper methods are added here.

}
