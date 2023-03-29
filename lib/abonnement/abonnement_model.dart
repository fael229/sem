import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/card_pro_widget.dart';
import '/components/choix_widget.dart';
import '/components/detail_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_place_picker.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/place.dart';
import 'dart:io';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AbonnementModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey2 = GlobalKey<FormState>();
  final formKey1 = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Create Document] action in Icon13 widget.
  PanierRecord? panlun2;
  // Stores action output result for [Backend Call - Create Document] action in Icon13 widget.
  PrecommandeRecord? lundi;
  // Stores action output result for [Backend Call - Create Document] action in Icon14 widget.
  PanierRecord? panlun3;
  // Stores action output result for [Backend Call - Create Document] action in Icon11 widget.
  PanierRecord? panmar2;
  // Stores action output result for [Backend Call - Create Document] action in Icon11 widget.
  PrecommandeRecord? mardi;
  // Stores action output result for [Backend Call - Create Document] action in Ico12 widget.
  PanierRecord? panmar3;
  // Stores action output result for [Backend Call - Create Document] action in Icon9 widget.
  PanierRecord? panmer2;
  // Stores action output result for [Backend Call - Create Document] action in Icon9 widget.
  PrecommandeRecord? mercredi;
  // Stores action output result for [Backend Call - Create Document] action in Icon10 widget.
  PanierRecord? panmer3;
  // Stores action output result for [Backend Call - Create Document] action in Icon7 widget.
  PanierRecord? panjeu2;
  // Stores action output result for [Backend Call - Create Document] action in Icon7 widget.
  PrecommandeRecord? jeudi;
  // Stores action output result for [Backend Call - Create Document] action in Icon8 widget.
  PanierRecord? panjeu3;
  // Stores action output result for [Backend Call - Create Document] action in Icon5 widget.
  PanierRecord? panven2;
  // Stores action output result for [Backend Call - Create Document] action in Icon5 widget.
  PrecommandeRecord? vendredi;
  // Stores action output result for [Backend Call - Create Document] action in Icon6 widget.
  PanierRecord? panven3;
  // Stores action output result for [Backend Call - Create Document] action in Icon3 widget.
  PanierRecord? pansam2;
  // Stores action output result for [Backend Call - Create Document] action in Icon3 widget.
  PrecommandeRecord? samedi;
  // Stores action output result for [Backend Call - Create Document] action in Icon4 widget.
  PanierRecord? pansam3;
  // Stores action output result for [Backend Call - Create Document] action in Icon2 widget.
  PanierRecord? pandim2;
  // Stores action output result for [Backend Call - Create Document] action in Icon2 widget.
  PrecommandeRecord? dimanche;
  // Stores action output result for [Backend Call - Create Document] action in Icon1 widget.
  PanierRecord? pandim3;
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  DateTime? datePicked1;
  // State field(s) for TextField widget.
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  String? _textController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownController1;
  // State field(s) for TextField widget.
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  String? _textController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for reseau widget.
  String? reseauValue;
  FormFieldController<String>? reseauController;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownController2;
  // State field(s) for TextField widget.
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  String? _textController3Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (transaction generer)] action in Button widget.
  ApiCallResponse? apiResulty73;
  // Stores action output result for [Backend Call - API (transactions token)] action in Button widget.
  ApiCallResponse? apiResultldm;
  // Stores action output result for [Backend Call - API (paiement sans redi)] action in Button widget.
  ApiCallResponse? apiResultyz8;
  // Stores action output result for [Backend Call - API (statut)] action in Button widget.
  ApiCallResponse? apiResult0fd;
  // State field(s) for searchField232 widget.
  TextEditingController? searchField232Controller;
  String? Function(BuildContext, String?)? searchField232ControllerValidator;
  // Algolia Search Results from action on searchField232
  List<ProduitsRecord>? algoliaSearchResults = [];
  // Stores action output result for [Backend Call - Create Document] action in Icon29 widget.
  PanierRecord? panlun;
  // Stores action output result for [Backend Call - Create Document] action in Icon29 widget.
  PrecommandeRecord? lundi11;
  // Stores action output result for [Backend Call - Create Document] action in Icon28 widget.
  PanierRecord? panlun1;
  // Stores action output result for [Backend Call - Create Document] action in Icon26 widget.
  PanierRecord? panmar;
  // Stores action output result for [Backend Call - Create Document] action in Icon26 widget.
  PrecommandeRecord? mardi1;
  // Stores action output result for [Backend Call - Create Document] action in Icon27 widget.
  PanierRecord? panmar1;
  // Stores action output result for [Backend Call - Create Document] action in Icon25 widget.
  PanierRecord? panmer;
  // Stores action output result for [Backend Call - Create Document] action in Icon25 widget.
  PrecommandeRecord? mercredi1;
  // Stores action output result for [Backend Call - Create Document] action in Icon24 widget.
  PanierRecord? panmer1;
  // Stores action output result for [Backend Call - Create Document] action in Icon22 widget.
  PanierRecord? panjeu;
  // Stores action output result for [Backend Call - Create Document] action in Icon22 widget.
  PrecommandeRecord? jeudi1;
  // Stores action output result for [Backend Call - Create Document] action in Icon23 widget.
  PanierRecord? panjeu1;
  // Stores action output result for [Backend Call - Create Document] action in Icon21 widget.
  PanierRecord? panven;
  // Stores action output result for [Backend Call - Create Document] action in Icon21 widget.
  PrecommandeRecord? vendredi1;
  // Stores action output result for [Backend Call - Create Document] action in Icon20 widget.
  PanierRecord? panven1;
  // Stores action output result for [Backend Call - Create Document] action in Icon18 widget.
  PanierRecord? pansam;
  // Stores action output result for [Backend Call - Create Document] action in Icon18 widget.
  PrecommandeRecord? samedi1;
  // Stores action output result for [Backend Call - Create Document] action in Icon19 widget.
  PanierRecord? pansam1;
  // Stores action output result for [Backend Call - Create Document] action in Icon17 widget.
  PanierRecord? pandim;
  // Stores action output result for [Backend Call - Create Document] action in Icon17 widget.
  PrecommandeRecord? dimanche1;
  // Stores action output result for [Backend Call - Create Document] action in Icon16 widget.
  PanierRecord? pandim1;
  // State field(s) for PlacePicker123 widget.
  var placePicker123Value = FFPlace();
  DateTime? datePicked2;
  // State field(s) for indic11 widget.
  TextEditingController? indic11Controller;
  String? Function(BuildContext, String?)? indic11ControllerValidator;
  String? _indic11ControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DropDown111 widget.
  String? dropDown111Value;
  FormFieldController<String>? dropDown111Controller;
  // State field(s) for momo111 widget.
  TextEditingController? momo111Controller;
  String? Function(BuildContext, String?)? momo111ControllerValidator;
  String? _momo111ControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for reseau12 widget.
  String? reseau12Value;
  FormFieldController<String>? reseau12Controller;
  // State field(s) for DropDown222 widget.
  String? dropDown222Value;
  FormFieldController<String>? dropDown222Controller;
  // State field(s) for joign widget.
  TextEditingController? joignController;
  String? Function(BuildContext, String?)? joignControllerValidator;
  String? _joignControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (transaction generer)] action in payemaintenant widget.
  ApiCallResponse? apiResulty733;
  // Stores action output result for [Backend Call - API (transactions token)] action in payemaintenant widget.
  ApiCallResponse? apiResultldm12;
  // Stores action output result for [Backend Call - API (paiement sans redi)] action in payemaintenant widget.
  ApiCallResponse? apiResultyz81;
  // Stores action output result for [Backend Call - API (statut)] action in payemaintenant widget.
  ApiCallResponse? apiResult0fd12;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textController1Validator = _textController1Validator;
    textController2Validator = _textController2Validator;
    textController3Validator = _textController3Validator;
    indic11ControllerValidator = _indic11ControllerValidator;
    momo111ControllerValidator = _momo111ControllerValidator;
    joignControllerValidator = _joignControllerValidator;
  }

  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    searchField232Controller?.dispose();
    indic11Controller?.dispose();
    momo111Controller?.dispose();
    joignController?.dispose();
  }

  /// Additional helper methods are added here.

}
