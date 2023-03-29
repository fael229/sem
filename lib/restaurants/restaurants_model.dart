import '/auth/auth_util.dart';
import '/auth/firebase_user_provider.dart';
import '/backend/backend.dart';
import '/components/card_pro_widget.dart';
import '/components/detail_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RestaurantsModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchField widget.
  TextEditingController? searchFieldController;
  String? Function(BuildContext, String?)? searchFieldControllerValidator;
  // Algolia Search Results from action on searchField
  List<RestaurantsRecord>? algoliaSearchResults1 = [];
  // State field(s) for searchField232 widget.
  TextEditingController? searchField232Controller;
  String? Function(BuildContext, String?)? searchField232ControllerValidator;
  // Algolia Search Results from action on searchField232
  List<RestaurantsRecord>? algoliaSearchResults2 = [];

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    searchFieldController?.dispose();
    searchField232Controller?.dispose();
  }

  /// Additional helper methods are added here.

}
