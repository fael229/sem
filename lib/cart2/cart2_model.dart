import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/card_pro_widget.dart';
import '/components/detail_widget.dart';
import '/components/uuuiii_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Cart2Model extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  DateTime? datePicked1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PrecommandeRecord? precommande;
  // State field(s) for searchField232 widget.
  TextEditingController? searchField232Controller;
  String? Function(BuildContext, String?)? searchField232ControllerValidator;
  // Algolia Search Results from action on searchField232
  List<ProduitsRecord>? algoliaSearchResults = [];
  DateTime? datePicked2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  PrecommandeRecord? precommande2;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    searchField232Controller?.dispose();
  }

  /// Additional helper methods are added here.

}
