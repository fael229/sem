import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/components/detail_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_media.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'editprofile_model.dart';
export 'editprofile_model.dart';

class EditprofileWidget extends StatefulWidget {
  const EditprofileWidget({Key? key}) : super(key: key);

  @override
  _EditprofileWidgetState createState() => _EditprofileWidgetState();
}

class _EditprofileWidgetState extends State<EditprofileWidget> {
  late EditprofileModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditprofileModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'editprofile'});
    _model.searchField232Controller ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              if (responsiveVisibility(
                context: context,
                desktop: false,
              ))
                StreamBuilder<UsersRecord>(
                  stream: UsersRecord.getDocument(currentUserReference!),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 20.0,
                          height: 20.0,
                          child: SpinKitPulse(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 20.0,
                          ),
                        ),
                      );
                    }
                    final columnUsersRecord = snapshot.data!;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 14.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 0.0, 0.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        borderWidth: 1.0,
                                        buttonSize: 50.0,
                                        icon: Icon(
                                          Icons.arrow_back_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 30.0,
                                        ),
                                        onPressed: () async {
                                          context.pop();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  'Editez votre Profile',
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'sf pro text',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 22.0,
                                        useGoogleFonts: false,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                color: Color(0xFFDBE2E7),
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    2.0, 2.0, 2.0, 2.0),
                                child: Container(
                                  width: 90.0,
                                  height: 90.0,
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: Image.network(
                                    columnUsersRecord.photoUrl!,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 12.0, 0.0, 16.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FFButtonWidget(
                                onPressed: () async {
                                  final selectedMedia = await selectMedia(
                                    mediaSource: MediaSource.photoGallery,
                                    multiImage: false,
                                  );
                                  if (selectedMedia != null &&
                                      selectedMedia.every((m) =>
                                          validateFileFormat(
                                              m.storagePath, context))) {
                                    setState(
                                        () => _model.isMediaUploading1 = true);
                                    var selectedUploadedFiles =
                                        <FFUploadedFile>[];
                                    var downloadUrls = <String>[];
                                    try {
                                      showUploadMessage(
                                        context,
                                        'Uploading file...',
                                        showLoading: true,
                                      );
                                      selectedUploadedFiles = selectedMedia
                                          .map((m) => FFUploadedFile(
                                                name: m.storagePath
                                                    .split('/')
                                                    .last,
                                                bytes: m.bytes,
                                                height: m.dimensions?.height,
                                                width: m.dimensions?.width,
                                              ))
                                          .toList();

                                      downloadUrls = (await Future.wait(
                                        selectedMedia.map(
                                          (m) async => await uploadData(
                                              m.storagePath, m.bytes),
                                        ),
                                      ))
                                          .where((u) => u != null)
                                          .map((u) => u!)
                                          .toList();
                                    } finally {
                                      ScaffoldMessenger.of(context)
                                          .hideCurrentSnackBar();
                                      _model.isMediaUploading1 = false;
                                    }
                                    if (selectedUploadedFiles.length ==
                                            selectedMedia.length &&
                                        downloadUrls.length ==
                                            selectedMedia.length) {
                                      setState(() {
                                        _model.uploadedLocalFile1 =
                                            selectedUploadedFiles.first;
                                        _model.uploadedFileUrl1 =
                                            downloadUrls.first;
                                      });
                                      showUploadMessage(context, 'Success!');
                                    } else {
                                      setState(() {});
                                      showUploadMessage(
                                          context, 'Failed to upload media');
                                      return;
                                    }
                                  }

                                  final usersUpdateData = createUsersRecordData(
                                    photoUrl: _model.uploadedFileUrl1,
                                  );
                                  await currentUserReference!
                                      .update(usersUpdateData);
                                },
                                text: 'Changer  Photo',
                                options: FFButtonOptions(
                                  width: 130.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  elevation: 1.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 16.0),
                          child: TextFormField(
                            controller: _model.yourNameController ??=
                                TextEditingController(
                              text: columnUsersRecord.displayName,
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Votre Nom et Preenom',
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodyText2,
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 24.0, 0.0, 24.0),
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                            validator: _model.yourNameControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 0.0, 20.0, 16.0),
                          child: TextFormField(
                            controller: _model.emailController ??=
                                TextEditingController(
                              text: columnUsersRecord.email,
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle:
                                  FlutterFlowTheme.of(context).bodyText2,
                              hintStyle: FlutterFlowTheme.of(context).bodyText2,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 24.0, 0.0, 24.0),
                            ),
                            style: FlutterFlowTheme.of(context).bodyText1,
                            validator: _model.emailControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.05),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 24.0, 0.0, 0.0),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final usersUpdateData = createUsersRecordData(
                                  displayName: _model.yourNameController.text,
                                  photoUrl: _model.uploadedFileUrl1,
                                  email: _model.emailController.text,
                                );
                                await columnUsersRecord.reference
                                    .update(usersUpdateData);
                                context.pop();
                              },
                              text: 'Sauvegarder',
                              options: FFButtonOptions(
                                width: 340.0,
                                height: 60.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                elevation: 2.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
                Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1.0,
                    height: MediaQuery.of(context).size.height * 1.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Visibility(
                      visible: responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                      ),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.19,
                                  height:
                                      MediaQuery.of(context).size.height * 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x00272B50),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 40.0, 0.0, 0.0),
                                        child: StreamBuilder<UsersRecord>(
                                          stream: UsersRecord.getDocument(
                                              currentUserReference!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 20.0,
                                                  height: 20.0,
                                                  child: SpinKitPulse(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    size: 20.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            final columnUsersRecord =
                                                snapshot.data!;
                                            return Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 60.0,
                                                  height: 60.0,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    columnUsersRecord.photoUrl!,
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 15.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      5.0,
                                                                      0.0),
                                                          child: SelectionArea(
                                                              child: Text(
                                                            columnUsersRecord
                                                                .displayName!,
                                                            textAlign: TextAlign
                                                                .center,
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'sf pro text',
                                                                  fontSize:
                                                                      12.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 50.0, 0.0, 0.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 15.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x00FC6A57),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.0),
                                                          ),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                  'Accueil');
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      50.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      30.0,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  icon: Icon(
                                                                    FFIcons
                                                                        .kfiRrHome,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 15.0,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        'IconButton pressed ...');
                                                                  },
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            context.pushNamed('Accueil');
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'Accueil',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'sf pro text',
                                                                                  fontSize: 12.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 15.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x00FC6A57),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.0),
                                                          ),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                  'favoris');
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      50.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      30.0,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  icon: Icon(
                                                                    FFIcons
                                                                        .kfiRrHeart,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 15.0,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        'IconButton pressed ...');
                                                                  },
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            context.pushNamed('favoris');
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'Favoris',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'sf pro text',
                                                                                  fontSize: 12.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 15.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x00FC6A57),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.0),
                                                          ),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                  'category');
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      50.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      30.0,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  icon: Icon(
                                                                    FFIcons
                                                                        .kfiRrApps,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 15.0,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        'IconButton pressed ...');
                                                                  },
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            context.pushNamed('category');
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'Catégories',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'sf pro text',
                                                                                  fontSize: 12.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 15.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x00FC6A57),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.0),
                                                          ),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                  'cart2');
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      50.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      30.0,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  icon: Icon(
                                                                    FFIcons
                                                                        .kfiRrShoppingBasket,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 15.0,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        'IconButton pressed ...');
                                                                  },
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            context.pushNamed('cart2');
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'Commandes',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'sf pro text',
                                                                                  fontSize: 12.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 15.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    10.0,
                                                                    0.0,
                                                                    10.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: 150.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                          ),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              context.pushNamed(
                                                                  'user');
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                FlutterFlowIconButton(
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderRadius:
                                                                      30.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      30.0,
                                                                  fillColor: Color(
                                                                      0xFFCC4433),
                                                                  icon: Icon(
                                                                    FFIcons
                                                                        .kfiRrUser,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 15.0,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    print(
                                                                        'IconButton pressed ...');
                                                                  },
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            8.0,
                                                                            0.0,
                                                                            8.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            context.pushNamed('user');
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'Profil',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'sf pro text',
                                                                                  color: Colors.white,
                                                                                  fontSize: 12.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 40.0, 0.0, 0.0),
                                                child: Image.asset(
                                                  'assets/images/zem_food-1.png',
                                                  width: 60.0,
                                                  height: 60.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    width: 100.0,
                                    height: MediaQuery.of(context).size.height *
                                        1.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x00272B50),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  30.0, 0.0, 30.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.55,
                                                decoration: BoxDecoration(
                                                  color: Color(0x00272B50),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 16.0,
                                                          20.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    4.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.25,
                                                          height: 40.0,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 500.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x00272B50),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        28.0),
                                                          ),
                                                          child: TextFormField(
                                                            controller: _model
                                                                .searchField232Controller,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.searchField232Controller',
                                                              Duration(
                                                                  milliseconds:
                                                                      200),
                                                              () async {
                                                                setState(() =>
                                                                    _model.algoliaSearchResults =
                                                                        null);
                                                                await ProduitsRecord
                                                                        .search(
                                                                  term: _model
                                                                      .searchField232Controller
                                                                      .text,
                                                                )
                                                                    .then((r) =>
                                                                        _model.algoliaSearchResults =
                                                                            r)
                                                                    .onError((_,
                                                                            __) =>
                                                                        _model.algoliaSearchResults =
                                                                            [])
                                                                    .whenComplete(() =>
                                                                        setState(
                                                                            () {}));
                                                              },
                                                            ),
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText2,
                                                              hintText:
                                                                  'Recherchez un plat ici',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Lexend Deca',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 0.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            29.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 0.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            29.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 0.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            29.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 0.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            29.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              contentPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          14.0,
                                                                          24.0,
                                                                          14.0,
                                                                          24.0),
                                                              prefixIcon: Icon(
                                                                FFIcons
                                                                    .ksearchFael,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                              ),
                                                              suffixIcon: _model
                                                                      .searchField232Controller!
                                                                      .text
                                                                      .isNotEmpty
                                                                  ? InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        _model
                                                                            .searchField232Controller
                                                                            ?.clear();
                                                                        setState(() =>
                                                                            _model.algoliaSearchResults =
                                                                                null);
                                                                        await ProduitsRecord
                                                                            .search(
                                                                          term: _model
                                                                              .searchField232Controller
                                                                              .text,
                                                                        ).then((r) => _model.algoliaSearchResults = r).onError((_, __) => _model.algoliaSearchResults = []).whenComplete(() =>
                                                                            setState(() {}));

                                                                        setState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .clear,
                                                                        color: Color(
                                                                            0xFF757575),
                                                                        size:
                                                                            22.0,
                                                                      ),
                                                                    )
                                                                  : null,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                            validator: _model
                                                                .searchField232ControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                      ),
                                                      if (_model.searchField232Controller
                                                                  .text !=
                                                              null &&
                                                          _model.searchField232Controller
                                                                  .text !=
                                                              '')
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      8.0,
                                                                      0.0,
                                                                      0.0),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.55,
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      1.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x00FFFFFF),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                  ),
                                                                  child: FutureBuilder<
                                                                      List<
                                                                          ProduitsRecord>>(
                                                                    future: ProduitsRecord
                                                                        .search(
                                                                      term: _model
                                                                          .searchField232Controller
                                                                          .text,
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                20.0,
                                                                            height:
                                                                                20.0,
                                                                            child:
                                                                                SpinKitPulse(
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              size: 20.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      List<ProduitsRecord>
                                                                          columnProduitsRecordList =
                                                                          snapshot
                                                                              .data!;
                                                                      // Customize what your widget looks like with no search results.
                                                                      if (snapshot
                                                                          .data!
                                                                          .isEmpty) {
                                                                        return Container(
                                                                          height:
                                                                              100,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Text('No results.'),
                                                                          ),
                                                                        );
                                                                      }
                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: List.generate(
                                                                            columnProduitsRecordList.length,
                                                                            (columnIndex) {
                                                                          final columnProduitsRecord =
                                                                              columnProduitsRecordList[columnIndex];
                                                                          return Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                4.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.of(context).size.width * 1.0,
                                                                              height: 130.0,
                                                                              constraints: BoxConstraints(
                                                                                maxWidth: 500.0,
                                                                              ),
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                              child: StreamBuilder<ProduitsRecord>(
                                                                                stream: ProduitsRecord.getDocument(columnProduitsRecord.reference),
                                                                                builder: (context, snapshot) {
                                                                                  // Customize what your widget looks like when it's loading.
                                                                                  if (!snapshot.hasData) {
                                                                                    return Center(
                                                                                      child: SizedBox(
                                                                                        width: 20.0,
                                                                                        height: 20.0,
                                                                                        child: SpinKitPulse(
                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                          size: 20.0,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                  final rowProduitsRecord = snapshot.data!;
                                                                                  return InkWell(
                                                                                    onTap: () async {
                                                                                      FFAppState().update(() {
                                                                                        FFAppState().prixDefaut = true;
                                                                                        FFAppState().refFav = null;
                                                                                      });
                                                                                      FFAppState().update(() {
                                                                                        FFAppState().qty = 1;
                                                                                      });

                                                                                      final produitsUpdateData = {
                                                                                        'vue': FieldValue.increment(1),
                                                                                      };
                                                                                      await rowProduitsRecord.reference.update(produitsUpdateData);
                                                                                      showModalBottomSheet(
                                                                                        isScrollControlled: true,
                                                                                        backgroundColor: Colors.transparent,
                                                                                        context: context,
                                                                                        builder: (context) {
                                                                                          return Padding(
                                                                                            padding: MediaQuery.of(context).viewInsets,
                                                                                            child: Container(
                                                                                              height: MediaQuery.of(context).size.height * 1.0,
                                                                                              child: DetailWidget(
                                                                                                prodRef: rowProduitsRecord.reference,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => setState(() {}));
                                                                                    },
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        ClipRRect(
                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                          child: Image.network(
                                                                                            rowProduitsRecord.image!,
                                                                                            width: 100.0,
                                                                                            height: 100.0,
                                                                                            fit: BoxFit.cover,
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: Container(
                                                                                            height: MediaQuery.of(context).size.height * 1.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0x00FFFFFF),
                                                                                            ),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                  child: Container(
                                                                                                    width: MediaQuery.of(context).size.width * 0.5,
                                                                                                    height: double.infinity,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Color(0x00FFFFFF),
                                                                                                    ),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Expanded(
                                                                                                              flex: 2,
                                                                                                              child: Text(
                                                                                                                rowProduitsRecord.nom!,
                                                                                                                maxLines: 2,
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                      fontSize: 16.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                '${dateTimeFormat(
                                                                                                                  'Hm',
                                                                                                                  rowProduitsRecord.ouv,
                                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                                )} - ${dateTimeFormat(
                                                                                                                  'Hm',
                                                                                                                  rowProduitsRecord.clo,
                                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                                )}',
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Expanded(
                                                                                                              child: Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  () {
                                                                                                                    if (rowProduitsRecord.multi == false) {
                                                                                                                      return '${functions.multippl(rowProduitsRecord.prix!, FFAppState().qty).toString()} FCFA';
                                                                                                                    } else if ((rowProduitsRecord.multi == true) && (FFAppState().prixDefaut == false)) {
                                                                                                                      return '${functions.multippl(rowProduitsRecord.prixComplet!, FFAppState().qty).toString()} FCFA';
                                                                                                                    } else {
                                                                                                                      return '${functions.multippl(rowProduitsRecord.prixDemi!, FFAppState().qty).toString()} FCFA';
                                                                                                                    }
                                                                                                                  }(),
                                                                                                                  textAlign: TextAlign.start,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                        fontFamily: 'sf pro text',
                                                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                        fontSize: 18.0,
                                                                                                                        fontWeight: FontWeight.bold,
                                                                                                                        useGoogleFonts: false,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 16.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 140.0,
                                                        height: 40.0,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 160.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary400,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                        ),
                                                        child: InkWell(
                                                          onTap: () async {
                                                            GoRouter.of(context)
                                                                .prepareAuthEvent();
                                                            await signOut();
                                                            GoRouter.of(context)
                                                                .clearRedirectLocation();

                                                            context.goNamedAuth(
                                                                'Onboarding1',
                                                                mounted);
                                                          },
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    50.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    40.0,
                                                                fillColor: Color(
                                                                    0xFF109C89),
                                                                icon: Icon(
                                                                  Icons.logout,
                                                                  color: Colors
                                                                      .white,
                                                                  size: 20.0,
                                                                ),
                                                                onPressed: () {
                                                                  print(
                                                                      'IconButton pressed ...');
                                                                },
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8.0,
                                                                          0.0,
                                                                          8.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Expanded(
                                                                        child:
                                                                            InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            GoRouter.of(context).prepareAuthEvent();
                                                                            await signOut();
                                                                            GoRouter.of(context).clearRedirectLocation();

                                                                            context.goNamedAuth('Onboarding1',
                                                                                mounted);
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'Déconnexion',
                                                                            textAlign:
                                                                                TextAlign.start,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'sf pro text',
                                                                                  color: Colors.white,
                                                                                  fontSize: 12.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 20.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  width: 100.0,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.97,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(0.0),
                                                      topLeft:
                                                          Radius.circular(60.0),
                                                      topRight:
                                                          Radius.circular(0.0),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 40.0,
                                                                0.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.55,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.97,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x00272B50),
                                                          ),
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          14.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          'Editez votre Profile',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .title2
                                                                              .override(
                                                                                fontFamily: 'sf pro text',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 17.0,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 300.0,
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth:
                                                                        500.0,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x00272B50),
                                                                  ),
                                                                  child: StreamBuilder<
                                                                      UsersRecord>(
                                                                    stream: UsersRecord
                                                                        .getDocument(
                                                                            currentUserReference!),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                20.0,
                                                                            height:
                                                                                20.0,
                                                                            child:
                                                                                SpinKitPulse(
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                              size: 20.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final columnUsersRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Container(
                                                                                width: 100.0,
                                                                                height: 100.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFDBE2E7),
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                  child: Container(
                                                                                    width: 90.0,
                                                                                    height: 90.0,
                                                                                    clipBehavior: Clip.antiAlias,
                                                                                    decoration: BoxDecoration(
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    child: Image.network(
                                                                                      columnUsersRecord.photoUrl!,
                                                                                      fit: BoxFit.fitWidth,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                12.0,
                                                                                0.0,
                                                                                16.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    final selectedMedia = await selectMedia(
                                                                                      mediaSource: MediaSource.photoGallery,
                                                                                      multiImage: false,
                                                                                    );
                                                                                    if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                      setState(() => _model.isMediaUploading2 = true);
                                                                                      var selectedUploadedFiles = <FFUploadedFile>[];
                                                                                      var downloadUrls = <String>[];
                                                                                      try {
                                                                                        showUploadMessage(
                                                                                          context,
                                                                                          'Uploading file...',
                                                                                          showLoading: true,
                                                                                        );
                                                                                        selectedUploadedFiles = selectedMedia
                                                                                            .map((m) => FFUploadedFile(
                                                                                                  name: m.storagePath.split('/').last,
                                                                                                  bytes: m.bytes,
                                                                                                  height: m.dimensions?.height,
                                                                                                  width: m.dimensions?.width,
                                                                                                ))
                                                                                            .toList();

                                                                                        downloadUrls = (await Future.wait(
                                                                                          selectedMedia.map(
                                                                                            (m) async => await uploadData(m.storagePath, m.bytes),
                                                                                          ),
                                                                                        ))
                                                                                            .where((u) => u != null)
                                                                                            .map((u) => u!)
                                                                                            .toList();
                                                                                      } finally {
                                                                                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                                                                                        _model.isMediaUploading2 = false;
                                                                                      }
                                                                                      if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                        setState(() {
                                                                                          _model.uploadedLocalFile2 = selectedUploadedFiles.first;
                                                                                          _model.uploadedFileUrl2 = downloadUrls.first;
                                                                                        });
                                                                                        showUploadMessage(context, 'Success!');
                                                                                      } else {
                                                                                        setState(() {});
                                                                                        showUploadMessage(context, 'Failed to upload media');
                                                                                        return;
                                                                                      }
                                                                                    }

                                                                                    final usersUpdateData = createUsersRecordData(
                                                                                      photoUrl: _model.uploadedFileUrl2,
                                                                                    );
                                                                                    await currentUserReference!.update(usersUpdateData);
                                                                                  },
                                                                                  text: 'Changer  Photo',
                                                                                  options: FFButtonOptions(
                                                                                    width: 130.0,
                                                                                    height: 40.0,
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Lexend Deca',
                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                          fontSize: 14.0,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                    elevation: 1.0,
                                                                                    borderSide: BorderSide(
                                                                                      color: Colors.transparent,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                20.0,
                                                                                0.0,
                                                                                20.0,
                                                                                16.0),
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.yourName123Controller ??= TextEditingController(
                                                                                text: columnUsersRecord.displayName,
                                                                              ),
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: 'Votre Nom et Preenom',
                                                                                labelStyle: FlutterFlowTheme.of(context).bodyText2,
                                                                                hintStyle: FlutterFlowTheme.of(context).bodyText2,
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    width: 2.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 2.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 2.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 2.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                              validator: _model.yourName123ControllerValidator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                20.0,
                                                                                0.0,
                                                                                20.0,
                                                                                16.0),
                                                                            child:
                                                                                TextFormField(
                                                                              controller: _model.email123Controller ??= TextEditingController(
                                                                                text: columnUsersRecord.email,
                                                                              ),
                                                                              obscureText: false,
                                                                              decoration: InputDecoration(
                                                                                labelText: 'Email',
                                                                                labelStyle: FlutterFlowTheme.of(context).bodyText2,
                                                                                hintStyle: FlutterFlowTheme.of(context).bodyText2,
                                                                                enabledBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                    width: 2.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                focusedBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 2.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                errorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 2.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                  borderSide: BorderSide(
                                                                                    color: Color(0x00000000),
                                                                                    width: 2.0,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                ),
                                                                                filled: true,
                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                contentPadding: EdgeInsetsDirectional.fromSTEB(20.0, 24.0, 0.0, 24.0),
                                                                              ),
                                                                              style: FlutterFlowTheme.of(context).bodyText1,
                                                                              validator: _model.email123ControllerValidator.asValidator(context),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.05),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                                                                              child: FFButtonWidget(
                                                                                onPressed: () async {
                                                                                  final usersUpdateData = createUsersRecordData(
                                                                                    displayName: _model.yourName123Controller.text,
                                                                                    photoUrl: _model.uploadedFileUrl2,
                                                                                    email: _model.email123Controller.text,
                                                                                  );
                                                                                  await columnUsersRecord.reference.update(usersUpdateData);
                                                                                  context.pop();
                                                                                },
                                                                                text: 'Sauvegarder',
                                                                                options: FFButtonOptions(
                                                                                  width: 230.0,
                                                                                  height: 40.0,
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                  textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                        fontFamily: 'Lexend Deca',
                                                                                        color: Colors.white,
                                                                                        fontSize: 16.0,
                                                                                        fontWeight: FontWeight.normal,
                                                                                      ),
                                                                                  elevation: 2.0,
                                                                                  borderSide: BorderSide(
                                                                                    color: Colors.transparent,
                                                                                    width: 1.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Container(
                                                            width: 100.0,
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.97,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0x00272B50),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            20.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        StreamBuilder<
                                                                            List<BanniereRecord>>(
                                                                          stream:
                                                                              queryBanniereRecord(
                                                                            queryBuilder: (banniereRecord) =>
                                                                                banniereRecord.orderBy('priorite', descending: true),
                                                                            singleRecord:
                                                                                true,
                                                                          ),
                                                                          builder:
                                                                              (context, snapshot) {
                                                                            // Customize what your widget looks like when it's loading.
                                                                            if (!snapshot.hasData) {
                                                                              return Center(
                                                                                child: SizedBox(
                                                                                  width: 20.0,
                                                                                  height: 20.0,
                                                                                  child: SpinKitPulse(
                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                    size: 20.0,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                            List<BanniereRecord>
                                                                                containerBanniereRecordList =
                                                                                snapshot.data!;
                                                                            // Return an empty Container when the item does not exist.
                                                                            if (snapshot.data!.isEmpty) {
                                                                              return Container();
                                                                            }
                                                                            final containerBanniereRecord = containerBanniereRecordList.isNotEmpty
                                                                                ? containerBanniereRecordList.first
                                                                                : null;
                                                                            return InkWell(
                                                                              onTap: () async {
                                                                                FFAppState().update(() {
                                                                                  FFAppState().prixDefaut = true;
                                                                                  FFAppState().complet = false;
                                                                                });
                                                                                FFAppState().update(() {
                                                                                  FFAppState().refFav = null;
                                                                                  FFAppState().qty = 1;
                                                                                });

                                                                                final produitsUpdateData = {
                                                                                  'vue': FieldValue.increment(1),
                                                                                };
                                                                                await containerBanniereRecord!.lien!.update(produitsUpdateData);
                                                                                await showModalBottomSheet(
                                                                                  isScrollControlled: true,
                                                                                  backgroundColor: Colors.transparent,
                                                                                  context: context,
                                                                                  builder: (context) {
                                                                                    return Padding(
                                                                                      padding: MediaQuery.of(context).viewInsets,
                                                                                      child: Container(
                                                                                        height: MediaQuery.of(context).size.height * 1.0,
                                                                                        child: DetailWidget(
                                                                                          prodRef: containerBanniereRecord!.lien,
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => setState(() {}));
                                                                              },
                                                                              child: Container(
                                                                                width: 180.0,
                                                                                height: 100.0,
                                                                                constraints: BoxConstraints(
                                                                                  maxWidth: 300.0,
                                                                                  maxHeight: 140.0,
                                                                                ),
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  image: DecorationImage(
                                                                                    fit: BoxFit.fill,
                                                                                    image: Image.network(
                                                                                      containerBanniereRecord!.img!,
                                                                                    ).image,
                                                                                  ),
                                                                                  borderRadius: BorderRadius.circular(20.0),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            30.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child: SelectionArea(
                                                                              child: Text(
                                                                            'Pour Vous',
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'sf pro text',
                                                                                  fontSize: 16.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          )),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          20.0,
                                                                          0.0,
                                                                          100.0),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              ProduitsRecord>>(
                                                                        stream:
                                                                            queryProduitsRecord(
                                                                          queryBuilder: (produitsRecord) => produitsRecord.orderBy(
                                                                              'vue',
                                                                              descending: true),
                                                                          limit:
                                                                              10,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Center(
                                                                              child: SizedBox(
                                                                                width: 20.0,
                                                                                height: 20.0,
                                                                                child: SpinKitPulse(
                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                  size: 20.0,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }
                                                                          List<ProduitsRecord>
                                                                              columnProduitsRecordList =
                                                                              snapshot.data!;
                                                                          return SingleChildScrollView(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: List.generate(columnProduitsRecordList.length, (columnIndex) {
                                                                                final columnProduitsRecord = columnProduitsRecordList[columnIndex];
                                                                                return Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 15.0),
                                                                                  child: StreamBuilder<ProduitsRecord>(
                                                                                    stream: ProduitsRecord.getDocument(columnProduitsRecord.reference),
                                                                                    builder: (context, snapshot) {
                                                                                      // Customize what your widget looks like when it's loading.
                                                                                      if (!snapshot.hasData) {
                                                                                        return Center(
                                                                                          child: SizedBox(
                                                                                            width: 20.0,
                                                                                            height: 20.0,
                                                                                            child: SpinKitPulse(
                                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                                              size: 20.0,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }
                                                                                      final containerProduitsRecord = snapshot.data!;
                                                                                      return Container(
                                                                                        width: 180.0,
                                                                                        height: 230.0,
                                                                                        constraints: BoxConstraints(
                                                                                          maxWidth: 300.0,
                                                                                          maxHeight: 300.0,
                                                                                        ),
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(9.0, 9.0, 9.0, 9.0),
                                                                                          child: InkWell(
                                                                                            onTap: () async {
                                                                                              FFAppState().update(() {
                                                                                                FFAppState().complet = false;
                                                                                                FFAppState().refFav = null;
                                                                                              });
                                                                                              FFAppState().update(() {
                                                                                                FFAppState().qty = 1;
                                                                                              });

                                                                                              final produitsUpdateData = {
                                                                                                'vue': FieldValue.increment(1),
                                                                                              };
                                                                                              await containerProduitsRecord.reference.update(produitsUpdateData);
                                                                                              await showModalBottomSheet(
                                                                                                isScrollControlled: true,
                                                                                                backgroundColor: Colors.transparent,
                                                                                                context: context,
                                                                                                builder: (context) {
                                                                                                  return Padding(
                                                                                                    padding: MediaQuery.of(context).viewInsets,
                                                                                                    child: Container(
                                                                                                      height: MediaQuery.of(context).size.height * 1.0,
                                                                                                      child: DetailWidget(
                                                                                                        prodRef: containerProduitsRecord.reference,
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                },
                                                                                              ).then((value) => setState(() {}));
                                                                                            },
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: double.infinity,
                                                                                                  height: MediaQuery.of(context).size.height * 0.18,
                                                                                                  constraints: BoxConstraints(
                                                                                                    maxHeight: 120.0,
                                                                                                  ),
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    image: DecorationImage(
                                                                                                      fit: BoxFit.cover,
                                                                                                      image: Image.network(
                                                                                                        containerProduitsRecord.image!,
                                                                                                      ).image,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(15.0),
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: Container(
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: Color(0x00FFFFFF),
                                                                                                            ),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Expanded(
                                                                                                                  flex: 2,
                                                                                                                  child: Text(
                                                                                                                    containerProduitsRecord.nom!,
                                                                                                                    maxLines: 2,
                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                          fontFamily: 'sf pro text',
                                                                                                                          fontSize: 14.0,
                                                                                                                          useGoogleFonts: false,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      '${dateTimeFormat(
                                                                                                        'Hm',
                                                                                                        containerProduitsRecord.ouv,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      )} - ${dateTimeFormat(
                                                                                                        'Hm',
                                                                                                        containerProduitsRecord.clo,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      )}',
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'sf pro text',
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          containerProduitsRecord.moyenne!.toString(),
                                                                                                          style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                        ),
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                                          child: Icon(
                                                                                                            Icons.star_rate,
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            size: 20.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Container(
                                                                                                      constraints: BoxConstraints(
                                                                                                        maxWidth: 140.0,
                                                                                                      ),
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 5.0, 5.0, 5.0),
                                                                                                        child: Text(
                                                                                                          () {
                                                                                                            if (containerProduitsRecord.multi == false) {
                                                                                                              return '${functions.multippl(containerProduitsRecord.prix!, FFAppState().qty).toString()} FCFA';
                                                                                                            } else if ((containerProduitsRecord.multi == true) && (FFAppState().prixDefaut == false)) {
                                                                                                              return '${functions.multippl(containerProduitsRecord.prixComplet!, FFAppState().qty).toString()} FCFA';
                                                                                                            } else {
                                                                                                              return '${functions.multippl(containerProduitsRecord.prixDemi!, FFAppState().qty).toString()} FCFA';
                                                                                                            }
                                                                                                          }(),
                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                fontFamily: 'sf pro text',
                                                                                                                color: Colors.white,
                                                                                                                useGoogleFonts: false,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                );
                                                                              }),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
