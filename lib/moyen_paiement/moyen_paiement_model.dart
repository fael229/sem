import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MoyenPaiementModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();
  // State field(s) for PlacePicker2222 widget.
  var placePicker2222Value = FFPlace();
  // State field(s) for TextField125 widget.
  TextEditingController? textField125Controller;
  String? Function(BuildContext, String?)? textField125ControllerValidator;
  String? _textField125ControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DropDown1111 widget.
  String? dropDown1111Value;
  FormFieldController<String>? dropDown1111Controller;
  // State field(s) for TextFieldmomo111 widget.
  TextEditingController? textFieldmomo111Controller;
  String? Function(BuildContext, String?)? textFieldmomo111ControllerValidator;
  String? _textFieldmomo111ControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for reseau2222 widget.
  String? reseau2222Value;
  FormFieldController<String>? reseau2222Controller;
  // State field(s) for DropDown22222 widget.
  String? dropDown22222Value;
  FormFieldController<String>? dropDown22222Controller;
  // State field(s) for TextFieldjoi222 widget.
  TextEditingController? textFieldjoi222Controller;
  String? Function(BuildContext, String?)? textFieldjoi222ControllerValidator;
  String? _textFieldjoi222ControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (transaction generer)] action in Button widget.
  ApiCallResponse? apiResulty733;
  // Stores action output result for [Backend Call - API (transactions token)] action in Button widget.
  ApiCallResponse? apiResultldm11;
  // Stores action output result for [Backend Call - API (paiement sans redi)] action in Button widget.
  ApiCallResponse? apiResultyz12;
  // Stores action output result for [Backend Call - API (statut)] action in Button widget.
  ApiCallResponse? apiResult0fd11;
  // State field(s) for searchField232 widget.
  TextEditingController? searchField232Controller;
  String? Function(BuildContext, String?)? searchField232ControllerValidator;
  // Algolia Search Results from action on searchField232
  List<ProduitsRecord>? algoliaSearchResults = [];
  // State field(s) for PlacePicker widget.
  var placePickerValue = FFPlace();
  // State field(s) for TextField widget.
  TextEditingController? textController5;
  String? Function(BuildContext, String?)? textController5Validator;
  String? _textController5Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownController1;
  // State field(s) for TextField widget.
  TextEditingController? textController6;
  String? Function(BuildContext, String?)? textController6Validator;
  String? _textController6Validator(BuildContext context, String? val) {
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
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  String? _textController7Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (transaction generer)] action in Button111 widget.
  ApiCallResponse? apiResulty73;
  // Stores action output result for [Backend Call - API (transactions token)] action in Button111 widget.
  ApiCallResponse? apiResultldm;
  // Stores action output result for [Backend Call - API (paiement sans redi)] action in Button111 widget.
  ApiCallResponse? apiResultyz8;
  // Stores action output result for [Backend Call - API (statut)] action in Button111 widget.
  ApiCallResponse? apiResult0fd;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    textField125ControllerValidator = _textField125ControllerValidator;
    textFieldmomo111ControllerValidator = _textFieldmomo111ControllerValidator;
    textFieldjoi222ControllerValidator = _textFieldjoi222ControllerValidator;
    textController5Validator = _textController5Validator;
    textController6Validator = _textController6Validator;
    textController7Validator = _textController7Validator;
  }

  void dispose() {
    textField125Controller?.dispose();
    textFieldmomo111Controller?.dispose();
    textFieldjoi222Controller?.dispose();
    searchField232Controller?.dispose();
    textController5?.dispose();
    textController6?.dispose();
    textController7?.dispose();
  }

  /// Additional helper methods are added here.

}
