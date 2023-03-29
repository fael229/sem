import '/auth/auth_util.dart';
import '/auth/firebase_user_provider.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/card_pro_widget.dart';
import '/components/detail_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/upload_media.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class RestauDetailModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  String currentPageLink = '';
  bool isMediaUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isMediaUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  // State field(s) for searchField232 widget.
  TextEditingController? searchField232Controller;
  String? Function(BuildContext, String?)? searchField232ControllerValidator;
  // Algolia Search Results from action on searchField232
  List<ProduitsRecord>? algoliaSearchResults = [];
  bool isMediaUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  bool isMediaUploading4 = false;
  FFUploadedFile uploadedLocalFile4 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl4 = '';

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    searchField232Controller?.dispose();
  }

  /// Additional helper methods are added here.

}
