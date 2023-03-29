import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/card_pro_widget.dart';
import '/components/detail_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'tracking_model.dart';
export 'tracking_model.dart';

class TrackingWidget extends StatefulWidget {
  const TrackingWidget({
    Key? key,
    this.refTrack,
  }) : super(key: key);

  final DocumentReference? refTrack;

  @override
  _TrackingWidgetState createState() => _TrackingWidgetState();
}

class _TrackingWidgetState extends State<TrackingWidget> {
  late TrackingModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TrackingModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Tracking'});
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

    return StreamBuilder<PrecommandeRecord>(
      stream: PrecommandeRecord.getDocument(widget.refTrack!),
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
        final trackingPrecommandeRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Visibility(
                visible:
                    valueOrDefault<bool>(currentUserDocument?.client, false) ==
                        true,
                child: AuthUserStreamWidget(
                  builder: (context) => Stack(
                    children: [
                      if (responsiveVisibility(
                        context: context,
                        tabletLandscape: false,
                        desktop: false,
                      ))
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 60.0,
                                    icon: Icon(
                                      Icons.arrow_back_ios_sharp,
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      size: 30.0,
                                    ),
                                    onPressed: () async {
                                      context.pop();
                                    },
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        'Tracking Commande',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'sf pro text',
                                              fontSize: 18.0,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if ((valueOrDefault<bool>(
                                              currentUserDocument?.admin,
                                              false) ==
                                          true) ||
                                      (valueOrDefault<bool>(
                                              currentUserDocument?.livreur,
                                              false) ==
                                          true))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 1.0, 0.0, 0.0),
                                      child: StreamBuilder<PrecommandeRecord>(
                                        stream: PrecommandeRecord.getDocument(
                                            widget.refTrack!),
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
                                          final containerPrecommandeRecord =
                                              snapshot.data!;
                                          return Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 8.0, 16.0, 8.0),
                                              child: StreamBuilder<UsersRecord>(
                                                stream: UsersRecord.getDocument(
                                                    containerPrecommandeRecord
                                                        .refcli!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 20.0,
                                                        height: 20.0,
                                                        child: SpinKitPulse(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          size: 20.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final rowUsersRecord =
                                                      snapshot.data!;
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Card(
                                                        clipBehavior: Clip
                                                            .antiAliasWithSaveLayer,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                        elevation: 2.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      2.0,
                                                                      2.0,
                                                                      2.0,
                                                                      2.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40.0),
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl:
                                                                  rowUsersRecord
                                                                      .photoUrl!,
                                                              width: 60.0,
                                                              height: 60.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              rowUsersRecord
                                                                  .displayName!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title3,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                rowUsersRecord
                                                                    .email!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2,
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
                                          );
                                        },
                                      ),
                                    ),
                                  if ((trackingPrecommandeRecord.attribution ==
                                          true) &&
                                      (valueOrDefault<bool>(
                                              currentUserDocument?.client,
                                              false) ==
                                          true))
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 1.0, 0.0, 0.0),
                                      child: StreamBuilder<PrecommandeRecord>(
                                        stream: PrecommandeRecord.getDocument(
                                            widget.refTrack!),
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
                                          final containerPrecommandeRecord =
                                              snapshot.data!;
                                          return Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 8.0, 16.0, 8.0),
                                              child: StreamBuilder<UsersRecord>(
                                                stream: UsersRecord.getDocument(
                                                    containerPrecommandeRecord
                                                        .livreur!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 20.0,
                                                        height: 20.0,
                                                        child: SpinKitPulse(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          size: 20.0,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final rowUsersRecord =
                                                      snapshot.data!;
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Card(
                                                        clipBehavior: Clip
                                                            .antiAliasWithSaveLayer,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryColor,
                                                        elevation: 2.0,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      2.0,
                                                                      2.0,
                                                                      2.0,
                                                                      2.0),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        40.0),
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl:
                                                                  rowUsersRecord
                                                                      .photoUrl!,
                                                              width: 60.0,
                                                              height: 60.0,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              rowUsersRecord
                                                                  .displayName!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title3,
                                                            ),
                                                            Text(
                                                              rowUsersRecord
                                                                  .phoneNumber!,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .title3
                                                                  .override(
                                                                    fontFamily:
                                                                        'sf pro text',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Text(
                                                                rowUsersRecord
                                                                    .email!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2,
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
                                          );
                                        },
                                      ),
                                    ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 1.0, 0.0, 0.0),
                                      child: Container(
                                        width: 60.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00272B50),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 4.0,
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (trackingPrecommandeRecord
                                                        .e1 ==
                                                    true)
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 60.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryColor,
                                                    icon: Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                      size: 25.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 130.0,
                                        height: 120.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00272B50),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: SelectionArea(
                                                  child: Text(
                                                trackingPrecommandeRecord
                                                            .aboLivre ==
                                                        true
                                                    ? '${trackingPrecommandeRecord.jour}  ${dateTimeFormat(
                                                        'Hm',
                                                        trackingPrecommandeRecord
                                                            .date,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      )}'
                                                    : dateTimeFormat(
                                                        'd/M H:mm',
                                                        trackingPrecommandeRecord
                                                            .date!,
                                                        locale:
                                                            FFLocalizations.of(
                                                                    context)
                                                                .languageCode,
                                                      ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'sf pro text',
                                                          fontSize: 24.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              )),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x00272B50),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SelectionArea(
                                                            child: Text(
                                                          'Commande Payée',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'sf pro text',
                                                                fontSize: 16.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        )),
                                                        SelectionArea(
                                                            child: Text(
                                                          'Votre commande à été payée',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'sf pro text',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        )),
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
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 1.0, 0.0, 0.0),
                                      child: Container(
                                        width: 60.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00272B50),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 4.0,
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (trackingPrecommandeRecord
                                                        .e2 ==
                                                    true)
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 60.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryColor,
                                                    icon: Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                      size: 25.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                if (trackingPrecommandeRecord
                                                        .e2 ==
                                                    false)
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 60.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    icon: Icon(
                                                      Icons.check,
                                                      color: Color(0xFF545456),
                                                      size: 25.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Container(
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x00272B50),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SelectionArea(
                                                        child: Text(
                                                      'Commande  Attribué',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'sf pro text',
                                                                fontSize: 16.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    )),
                                                    SelectionArea(
                                                        child: Text(
                                                      'Votre commande à été attribué à un livreur',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'sf pro text',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    )),
                                                  ],
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
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 0.0, 10.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 1.0, 0.0, 0.0),
                                      child: Container(
                                        width: 60.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00272B50),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 4.0,
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (trackingPrecommandeRecord
                                                        .e3 ==
                                                    true)
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 60.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryColor,
                                                    icon: Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                      size: 25.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                if (trackingPrecommandeRecord
                                                        .e3 ==
                                                    false)
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 60.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    icon: Icon(
                                                      Icons.check,
                                                      color: Color(0xFF545456),
                                                      size: 25.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 0.0, 0.0),
                                        child: Container(
                                          height: 60.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x00272B50),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        SelectionArea(
                                                            child: Text(
                                                          'Livraison  en court',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'sf pro text',
                                                                fontSize: 16.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        )),
                                                        SelectionArea(
                                                            child: Text(
                                                          'Votre commande est en court de livraison',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'sf pro text',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                        )),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    if ((trackingPrecommandeRecord.e3 ==
                                            false) &&
                                        (valueOrDefault<bool>(
                                                currentUserDocument?.livreur,
                                                false) ==
                                            true) &&
                                        (trackingPrecommandeRecord.e2 == true))
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 30.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        icon: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 12.0,
                                        ),
                                        onPressed: () async {
                                          final precommandeUpdateData =
                                              createPrecommandeRecordData(
                                            e3: true,
                                          );
                                          await trackingPrecommandeRecord
                                              .reference
                                              .update(precommandeUpdateData);
                                        },
                                      ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    25.0, 0.0, 10.0, 30.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 1.0, 0.0, 0.0),
                                      child: Container(
                                        width: 60.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00272B50),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              width: 4.0,
                                              height: 60.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (trackingPrecommandeRecord
                                                        .e4 ==
                                                    true)
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 60.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primaryColor,
                                                    icon: Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                      size: 25.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                if (trackingPrecommandeRecord
                                                        .e4 ==
                                                    false)
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 20.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 60.0,
                                                    fillColor:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .secondaryText,
                                                    icon: Icon(
                                                      Icons.check,
                                                      color: Color(0xFF545456),
                                                      size: 25.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 100.0,
                                        height: 110.0,
                                        decoration: BoxDecoration(
                                          color: Color(0x00272B50),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SelectionArea(
                                                child: Text(
                                              valueOrDefault<String>(
                                                dateTimeFormat(
                                                  'd/M H:mm',
                                                  trackingPrecommandeRecord
                                                      .heurelivre,
                                                  locale: FFLocalizations.of(
                                                          context)
                                                      .languageCode,
                                                ),
                                                'Pas encore livré',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'sf pro text',
                                                        fontSize: 22.0,
                                                        useGoogleFonts: false,
                                                      ),
                                            )),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 0.0, 0.0),
                                              child: Container(
                                                height: 60.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x00272B50),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SelectionArea(
                                                              child: Text(
                                                            'Commande Livrée',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'sf pro text',
                                                                  fontSize:
                                                                      16.0,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                          )),
                                                        ],
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
                                    if ((trackingPrecommandeRecord.e4 ==
                                            false) &&
                                        (valueOrDefault<bool>(
                                                currentUserDocument?.livreur,
                                                false) ==
                                            true) &&
                                        (trackingPrecommandeRecord.e3 ==
                                            true) &&
                                        (trackingPrecommandeRecord.e2 == true))
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 20.0,
                                        borderWidth: 1.0,
                                        buttonSize: 30.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                        icon: Icon(
                                          Icons.check,
                                          color: Colors.white,
                                          size: 12.0,
                                        ),
                                        onPressed: () async {
                                          final precommandeUpdateData =
                                              createPrecommandeRecordData(
                                            e4: true,
                                          );
                                          await trackingPrecommandeRecord
                                              .reference
                                              .update(precommandeUpdateData);

                                          context.pushNamed(
                                            'Signature',
                                            queryParams: {
                                              'refTrack': serializeParam(
                                                trackingPrecommandeRecord
                                                    .reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        },
                                      ),
                                  ],
                                ),
                              ),
                              if ((valueOrDefault<bool>(
                                          currentUserDocument?.admin, false) ==
                                      true) &&
                                  (valueOrDefault<bool>(
                                          currentUserDocument?.livreur,
                                          false) ==
                                      true))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 30.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 0.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            SelectionArea(
                                                child: Text(
                                              'Indication:',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'sf pro text',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryColor,
                                                    fontSize: 18.0,
                                                    useGoogleFonts: false,
                                                  ),
                                            )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 15.0, 10.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: SelectionArea(
                                                  child: Text(
                                                trackingPrecommandeRecord
                                                    .indication!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'sf pro text',
                                                          fontSize: 18.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ],
                          ),
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
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.19,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              1.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x00272B50),
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 40.0, 0.0, 0.0),
                                                child:
                                                    StreamBuilder<UsersRecord>(
                                                  stream:
                                                      UsersRecord.getDocument(
                                                          currentUserReference!),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 20.0,
                                                          height: 20.0,
                                                          child: SpinKitPulse(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    final columnUsersRecord =
                                                        snapshot.data!;
                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Container(
                                                          width: 60.0,
                                                          height: 60.0,
                                                          clipBehavior:
                                                              Clip.antiAlias,
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: Image.network(
                                                            columnUsersRecord
                                                                .photoUrl!,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      15.0,
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
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child:
                                                                      SelectionArea(
                                                                          child:
                                                                              Text(
                                                                    columnUsersRecord
                                                                        .displayName!,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    maxLines: 1,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 50.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    15.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  height: 30.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x00FC6A57),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50.0),
                                                                  ),
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        () async {
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
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              50.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              30.0,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          icon:
                                                                              Icon(
                                                                            FFIcons.kfiRrHome,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                15.0,
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            print('IconButton pressed ...');
                                                                          },
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                InkWell(
                                                                                  onTap: () async {
                                                                                    context.pushNamed('Accueil');
                                                                                  },
                                                                                  child: Text(
                                                                                    'Accueil',
                                                                                    textAlign: TextAlign.start,
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
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    15.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  height: 30.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x00FC6A57),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50.0),
                                                                  ),
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        () async {
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
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              50.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              30.0,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          icon:
                                                                              Icon(
                                                                            FFIcons.kfiRrHeart,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                15.0,
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            print('IconButton pressed ...');
                                                                          },
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                InkWell(
                                                                                  onTap: () async {
                                                                                    context.pushNamed('favoris');
                                                                                  },
                                                                                  child: Text(
                                                                                    'Favoris',
                                                                                    textAlign: TextAlign.start,
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
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    15.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  height: 30.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x00FC6A57),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50.0),
                                                                  ),
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        () async {
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
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              50.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              30.0,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          icon:
                                                                              Icon(
                                                                            FFIcons.kfiRrApps,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                15.0,
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            print('IconButton pressed ...');
                                                                          },
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                InkWell(
                                                                                  onTap: () async {
                                                                                    context.pushNamed('category');
                                                                                  },
                                                                                  child: Text(
                                                                                    'Catégories',
                                                                                    textAlign: TextAlign.start,
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
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    15.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: 150.0,
                                                                  height: 30.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50.0),
                                                                    shape: BoxShape
                                                                        .rectangle,
                                                                  ),
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        () async {
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
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              30.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              30.0,
                                                                          fillColor:
                                                                              Color(0xFFCC4433),
                                                                          icon:
                                                                              Icon(
                                                                            Icons.shopping_basket_outlined,
                                                                            color:
                                                                                Colors.white,
                                                                            size:
                                                                                15.0,
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            print('IconButton pressed ...');
                                                                          },
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                InkWell(
                                                                                  onTap: () async {
                                                                                    context.pushNamed('cart2');
                                                                                  },
                                                                                  child: Text(
                                                                                    'Commandes',
                                                                                    textAlign: TextAlign.start,
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
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    15.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  height: 30.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x00FC6A57),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50.0),
                                                                  ),
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        () async {
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
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              50.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              30.0,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          icon:
                                                                              Icon(
                                                                            FFIcons.kfiRrUser,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                15.0,
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            print('IconButton pressed ...');
                                                                          },
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                InkWell(
                                                                                  onTap: () async {
                                                                                    context.pushNamed('user');
                                                                                  },
                                                                                  child: Text(
                                                                                    'Profil',
                                                                                    textAlign: TextAlign.start,
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
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    15.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  width: 100.0,
                                                                  height: 30.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x00FC6A57),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50.0),
                                                                  ),
                                                                  child:
                                                                      InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      context.pushNamed(
                                                                          'restaurants');
                                                                    },
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              50.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              30.0,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          icon:
                                                                              Icon(
                                                                            FFIcons.kfiRrShop,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                15.0,
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            print('IconButton pressed ...');
                                                                          },
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                8.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                InkWell(
                                                                                  onTap: () async {
                                                                                    context.pushNamed('restaurants');
                                                                                  },
                                                                                  child: Text(
                                                                                    'Restaurants',
                                                                                    textAlign: TextAlign.start,
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
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    40.0,
                                                                    0.0,
                                                                    0.0),
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
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color: Color(0x00272B50),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          30.0, 0.0, 30.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.55,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0x00272B50),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      20.0,
                                                                      16.0,
                                                                      20.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                child:
                                                                    Container(
                                                                  width: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width *
                                                                      0.25,
                                                                  height: 40.0,
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxWidth:
                                                                        500.0,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x00272B50),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            28.0),
                                                                  ),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        _model
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
                                                                        ).then((r) => _model.algoliaSearchResults = r).onError((_, __) => _model.algoliaSearchResults = []).whenComplete(() =>
                                                                            setState(() {}));
                                                                      },
                                                                    ),
                                                                    obscureText:
                                                                        false,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      labelStyle:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyText2,
                                                                      hintText:
                                                                          'Recherchez un plat ici',
                                                                      hintStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Lexend Deca',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                12.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              0.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(29.0),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              0.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(29.0),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              0.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(29.0),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Color(0x00000000),
                                                                          width:
                                                                              0.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(29.0),
                                                                      ),
                                                                      filled:
                                                                          true,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryBackground,
                                                                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                                                                          14.0,
                                                                          24.0,
                                                                          14.0,
                                                                          24.0),
                                                                      prefixIcon:
                                                                          Icon(
                                                                        FFIcons
                                                                            .ksearchFael,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                      ),
                                                                      suffixIcon: _model
                                                                              .searchField232Controller!
                                                                              .text
                                                                              .isNotEmpty
                                                                          ? InkWell(
                                                                              onTap: () async {
                                                                                _model.searchField232Controller?.clear();
                                                                                setState(() => _model.algoliaSearchResults = null);
                                                                                await ProduitsRecord.search(
                                                                                  term: _model.searchField232Controller.text,
                                                                                ).then((r) => _model.algoliaSearchResults = r).onError((_, __) => _model.algoliaSearchResults = []).whenComplete(() => setState(() {}));

                                                                                setState(() {});
                                                                              },
                                                                              child: Icon(
                                                                                Icons.clear,
                                                                                color: Color(0xFF757575),
                                                                                size: 22.0,
                                                                              ),
                                                                            )
                                                                          : null,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
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
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          8.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 0.55,
                                                                          height:
                                                                              MediaQuery.of(context).size.height * 1.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Color(0x00FFFFFF),
                                                                            borderRadius:
                                                                                BorderRadius.circular(15.0),
                                                                          ),
                                                                          child:
                                                                              FutureBuilder<List<ProduitsRecord>>(
                                                                            future:
                                                                                ProduitsRecord.search(
                                                                              term: _model.searchField232Controller.text,
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
                                                                              List<ProduitsRecord> columnProduitsRecordList = snapshot.data!;
                                                                              // Customize what your widget looks like with no search results.
                                                                              if (snapshot.data!.isEmpty) {
                                                                                return Container(
                                                                                  height: 100,
                                                                                  child: Center(
                                                                                    child: Text('No results.'),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              return Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: List.generate(columnProduitsRecordList.length, (columnIndex) {
                                                                                  final columnProduitsRecord = columnProduitsRecordList[columnIndex];
                                                                                  return Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                    child: Container(
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
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
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
                                                                  maxWidth:
                                                                      160.0,
                                                                ),
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary400,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50.0),
                                                                ),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    GoRouter.of(
                                                                            context)
                                                                        .prepareAuthEvent();
                                                                    await signOut();
                                                                    GoRouter.of(
                                                                            context)
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
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            50.0,
                                                                        borderWidth:
                                                                            1.0,
                                                                        buttonSize:
                                                                            40.0,
                                                                        fillColor:
                                                                            Color(0xFF109C89),
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .logout,
                                                                          color:
                                                                              Colors.white,
                                                                          size:
                                                                              20.0,
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
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              8.0,
                                                                              0.0,
                                                                              8.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: InkWell(
                                                                                  onTap: () async {
                                                                                    GoRouter.of(context).prepareAuthEvent();
                                                                                    await signOut();
                                                                                    GoRouter.of(context).clearRedirectLocation();

                                                                                    context.goNamedAuth('Onboarding1', mounted);
                                                                                  },
                                                                                  child: Text(
                                                                                    'Déconnexion',
                                                                                    textAlign: TextAlign.start,
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      0.0),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          0.0),
                                                              topLeft: Radius
                                                                  .circular(
                                                                      60.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      0.0),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        40.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
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
                                                                      0.97,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x00272B50),
                                                                  ),
                                                                  child:
                                                                      SingleChildScrollView(
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Tracking Commande',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'sf pro text',
                                                                                            fontSize: 16.0,
                                                                                            useGoogleFonts: false,
                                                                                          ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        if (trackingPrecommandeRecord.jour != null && trackingPrecommandeRecord.jour != '')
                                                                                          Text(
                                                                                            trackingPrecommandeRecord.jour!,
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'sf pro text',
                                                                                                  fontSize: 16.0,
                                                                                                  useGoogleFonts: false,
                                                                                                ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  if ((valueOrDefault<bool>(currentUserDocument?.admin, false) == true) || (valueOrDefault<bool>(currentUserDocument?.livreur, false) == true))
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                                      child: StreamBuilder<PrecommandeRecord>(
                                                                                        stream: PrecommandeRecord.getDocument(widget.refTrack!),
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
                                                                                          final containerPrecommandeRecord = snapshot.data!;
                                                                                          return Container(
                                                                                            width: double.infinity,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                                                                              child: StreamBuilder<UsersRecord>(
                                                                                                stream: UsersRecord.getDocument(containerPrecommandeRecord.refcli!),
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
                                                                                                  final rowUsersRecord = snapshot.data!;
                                                                                                  return Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Card(
                                                                                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                                        color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                        elevation: 2.0,
                                                                                                        shape: RoundedRectangleBorder(
                                                                                                          borderRadius: BorderRadius.circular(50.0),
                                                                                                        ),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                                          child: ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(40.0),
                                                                                                            child: CachedNetworkImage(
                                                                                                              imageUrl: rowUsersRecord.photoUrl!,
                                                                                                              width: 60.0,
                                                                                                              height: 60.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              rowUsersRecord.displayName!,
                                                                                                              style: FlutterFlowTheme.of(context).title3,
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                rowUsersRecord.email!,
                                                                                                                style: FlutterFlowTheme.of(context).bodyText2,
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
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  if ((trackingPrecommandeRecord.attribution == true) && (valueOrDefault<bool>(currentUserDocument?.client, false) == true))
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                                      child: StreamBuilder<PrecommandeRecord>(
                                                                                        stream: PrecommandeRecord.getDocument(widget.refTrack!),
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
                                                                                          final containerPrecommandeRecord = snapshot.data!;
                                                                                          return Container(
                                                                                            width: double.infinity,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
                                                                                              child: StreamBuilder<UsersRecord>(
                                                                                                stream: UsersRecord.getDocument(containerPrecommandeRecord.livreur!),
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
                                                                                                  final rowUsersRecord = snapshot.data!;
                                                                                                  return Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Card(
                                                                                                        clipBehavior: Clip.antiAliasWithSaveLayer,
                                                                                                        color: FlutterFlowTheme.of(context).secondaryColor,
                                                                                                        elevation: 2.0,
                                                                                                        shape: RoundedRectangleBorder(
                                                                                                          borderRadius: BorderRadius.circular(50.0),
                                                                                                        ),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 2.0, 2.0),
                                                                                                          child: ClipRRect(
                                                                                                            borderRadius: BorderRadius.circular(40.0),
                                                                                                            child: CachedNetworkImage(
                                                                                                              imageUrl: rowUsersRecord.photoUrl!,
                                                                                                              width: 60.0,
                                                                                                              height: 60.0,
                                                                                                              fit: BoxFit.cover,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              rowUsersRecord.displayName!,
                                                                                                              style: FlutterFlowTheme.of(context).title3,
                                                                                                            ),
                                                                                                            Text(
                                                                                                              rowUsersRecord.phoneNumber!,
                                                                                                              style: FlutterFlowTheme.of(context).title3.override(
                                                                                                                    fontFamily: 'sf pro text',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                    useGoogleFonts: false,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 0.0),
                                                                                                              child: Text(
                                                                                                                rowUsersRecord.email!,
                                                                                                                style: FlutterFlowTheme.of(context).bodyText2,
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
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 10.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: 60.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0x00272B50),
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 4.0,
                                                                                              height: 60.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                              ),
                                                                                            ),
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                if (trackingPrecommandeRecord.e1 == true)
                                                                                                  FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 20.0,
                                                                                                    borderWidth: 1.0,
                                                                                                    buttonSize: 60.0,
                                                                                                    fillColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                                    icon: Icon(
                                                                                                      Icons.check,
                                                                                                      color: Colors.white,
                                                                                                      size: 25.0,
                                                                                                    ),
                                                                                                    onPressed: () {
                                                                                                      print('IconButton pressed ...');
                                                                                                    },
                                                                                                  ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        width: 130.0,
                                                                                        height: 120.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0x00272B50),
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                              child: SelectionArea(
                                                                                                  child: Text(
                                                                                                trackingPrecommandeRecord.aboLivre == true
                                                                                                    ? dateTimeFormat(
                                                                                                        'Hm',
                                                                                                        trackingPrecommandeRecord.date!,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      )
                                                                                                    : dateTimeFormat(
                                                                                                        'd/M H:mm',
                                                                                                        trackingPrecommandeRecord.date!,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      ),
                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                      fontFamily: 'sf pro text',
                                                                                                      fontSize: 24.0,
                                                                                                      useGoogleFonts: false,
                                                                                                    ),
                                                                                              )),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                              child: Container(
                                                                                                height: 60.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Color(0x00272B50),
                                                                                                ),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  children: [
                                                                                                    Column(
                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        SelectionArea(
                                                                                                            child: Text(
                                                                                                          'Commande Payée',
                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                fontFamily: 'sf pro text',
                                                                                                                fontSize: 16.0,
                                                                                                                useGoogleFonts: false,
                                                                                                              ),
                                                                                                        )),
                                                                                                        SelectionArea(
                                                                                                            child: Text(
                                                                                                          'Votre commande à été payée',
                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                fontFamily: 'sf pro text',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                useGoogleFonts: false,
                                                                                                              ),
                                                                                                        )),
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
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 10.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: 60.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0x00272B50),
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 4.0,
                                                                                              height: 60.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                              ),
                                                                                            ),
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                if (trackingPrecommandeRecord.e2 == true)
                                                                                                  FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 20.0,
                                                                                                    borderWidth: 1.0,
                                                                                                    buttonSize: 60.0,
                                                                                                    fillColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                                    icon: Icon(
                                                                                                      Icons.check,
                                                                                                      color: Colors.white,
                                                                                                      size: 25.0,
                                                                                                    ),
                                                                                                    onPressed: () {
                                                                                                      print('IconButton pressed ...');
                                                                                                    },
                                                                                                  ),
                                                                                                if (trackingPrecommandeRecord.e2 == false)
                                                                                                  FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 20.0,
                                                                                                    borderWidth: 1.0,
                                                                                                    buttonSize: 60.0,
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    icon: Icon(
                                                                                                      Icons.check,
                                                                                                      color: Color(0xFF545456),
                                                                                                      size: 25.0,
                                                                                                    ),
                                                                                                    onPressed: () {
                                                                                                      print('IconButton pressed ...');
                                                                                                    },
                                                                                                  ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                        child: Container(
                                                                                          height: 60.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0x00272B50),
                                                                                          ),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    SelectionArea(
                                                                                                        child: Text(
                                                                                                      'Commande  Attribué',
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'sf pro text',
                                                                                                            fontSize: 16.0,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                    )),
                                                                                                    SelectionArea(
                                                                                                        child: Text(
                                                                                                      'Votre commande à été attribué à un livreur',
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'sf pro text',
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            useGoogleFonts: false,
                                                                                                          ),
                                                                                                    )),
                                                                                                  ],
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
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 10.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: 60.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0x00272B50),
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 4.0,
                                                                                              height: 60.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                              ),
                                                                                            ),
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                if (trackingPrecommandeRecord.e3 == true)
                                                                                                  FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 20.0,
                                                                                                    borderWidth: 1.0,
                                                                                                    buttonSize: 60.0,
                                                                                                    fillColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                                    icon: Icon(
                                                                                                      Icons.check,
                                                                                                      color: Colors.white,
                                                                                                      size: 25.0,
                                                                                                    ),
                                                                                                    onPressed: () {
                                                                                                      print('IconButton pressed ...');
                                                                                                    },
                                                                                                  ),
                                                                                                if (trackingPrecommandeRecord.e3 == false)
                                                                                                  FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 20.0,
                                                                                                    borderWidth: 1.0,
                                                                                                    buttonSize: 60.0,
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    icon: Icon(
                                                                                                      Icons.check,
                                                                                                      color: Color(0xFF545456),
                                                                                                      size: 25.0,
                                                                                                    ),
                                                                                                    onPressed: () {
                                                                                                      print('IconButton pressed ...');
                                                                                                    },
                                                                                                  ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                        child: Container(
                                                                                          height: 60.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0x00272B50),
                                                                                          ),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        SelectionArea(
                                                                                                            child: Text(
                                                                                                          'Livraison  en court',
                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                fontFamily: 'sf pro text',
                                                                                                                fontSize: 16.0,
                                                                                                                useGoogleFonts: false,
                                                                                                              ),
                                                                                                        )),
                                                                                                        SelectionArea(
                                                                                                            child: Text(
                                                                                                          'Votre commande est en court de livraison',
                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                fontFamily: 'sf pro text',
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                useGoogleFonts: false,
                                                                                                              ),
                                                                                                        )),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    if ((trackingPrecommandeRecord.e3 == false) && (valueOrDefault<bool>(currentUserDocument?.livreur, false) == true) && (trackingPrecommandeRecord.e2 == true))
                                                                                      FlutterFlowIconButton(
                                                                                        borderColor: Colors.transparent,
                                                                                        borderRadius: 20.0,
                                                                                        borderWidth: 1.0,
                                                                                        buttonSize: 30.0,
                                                                                        fillColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                        icon: Icon(
                                                                                          Icons.check,
                                                                                          color: Colors.white,
                                                                                          size: 12.0,
                                                                                        ),
                                                                                        onPressed: () async {
                                                                                          final precommandeUpdateData = createPrecommandeRecordData(
                                                                                            e3: true,
                                                                                          );
                                                                                          await trackingPrecommandeRecord.reference.update(precommandeUpdateData);
                                                                                        },
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(25.0, 0.0, 10.0, 30.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: 60.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0x00272B50),
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 4.0,
                                                                                              height: 60.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                              ),
                                                                                            ),
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                if (trackingPrecommandeRecord.e4 == true)
                                                                                                  FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 20.0,
                                                                                                    borderWidth: 1.0,
                                                                                                    buttonSize: 60.0,
                                                                                                    fillColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                                    icon: Icon(
                                                                                                      Icons.check,
                                                                                                      color: Colors.white,
                                                                                                      size: 25.0,
                                                                                                    ),
                                                                                                    onPressed: () {
                                                                                                      print('IconButton pressed ...');
                                                                                                    },
                                                                                                  ),
                                                                                                if (trackingPrecommandeRecord.e4 == false)
                                                                                                  FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 20.0,
                                                                                                    borderWidth: 1.0,
                                                                                                    buttonSize: 60.0,
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    icon: Icon(
                                                                                                      Icons.check,
                                                                                                      color: Color(0xFF545456),
                                                                                                      size: 25.0,
                                                                                                    ),
                                                                                                    onPressed: () {
                                                                                                      print('IconButton pressed ...');
                                                                                                    },
                                                                                                  ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        width: 100.0,
                                                                                        height: 110.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0x00272B50),
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              valueOrDefault<String>(
                                                                                                dateTimeFormat(
                                                                                                  'd/M H:mm',
                                                                                                  trackingPrecommandeRecord.heurelivre,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                ),
                                                                                                'Pas encore livré',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'sf pro text',
                                                                                                    fontSize: 22.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            )),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                              child: Container(
                                                                                                height: 60.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Color(0x00272B50),
                                                                                                ),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          SelectionArea(
                                                                                                              child: Text(
                                                                                                            'Commande Livrée',
                                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                  fontFamily: 'sf pro text',
                                                                                                                  fontSize: 16.0,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                          )),
                                                                                                        ],
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
                                                                                    if ((trackingPrecommandeRecord.e4 == false) && (valueOrDefault<bool>(currentUserDocument?.livreur, false) == true) && (trackingPrecommandeRecord.e3 == true) && (trackingPrecommandeRecord.e2 == true))
                                                                                      FlutterFlowIconButton(
                                                                                        borderColor: Colors.transparent,
                                                                                        borderRadius: 20.0,
                                                                                        borderWidth: 1.0,
                                                                                        buttonSize: 30.0,
                                                                                        fillColor: FlutterFlowTheme.of(context).primaryColor,
                                                                                        icon: Icon(
                                                                                          Icons.check,
                                                                                          color: Colors.white,
                                                                                          size: 12.0,
                                                                                        ),
                                                                                        onPressed: () async {
                                                                                          final precommandeUpdateData = createPrecommandeRecordData(
                                                                                            e4: true,
                                                                                          );
                                                                                          await trackingPrecommandeRecord.reference.update(precommandeUpdateData);

                                                                                          context.pushNamed(
                                                                                            'Signature',
                                                                                            queryParams: {
                                                                                              'refTrack': serializeParam(
                                                                                                trackingPrecommandeRecord.reference,
                                                                                                ParamType.DocumentReference,
                                                                                              ),
                                                                                            }.withoutNulls,
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              if ((valueOrDefault<bool>(currentUserDocument?.admin, false) == true) && (valueOrDefault<bool>(currentUserDocument?.livreur, false) == true))
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 30.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              'Indication:',
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'sf pro text',
                                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                    fontSize: 18.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 15.0, 10.0, 0.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                                                                                                child: SelectionArea(
                                                                                                    child: Text(
                                                                                                  trackingPrecommandeRecord.indication!,
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'sf pro text',
                                                                                                        fontSize: 18.0,
                                                                                                        useGoogleFonts: false,
                                                                                                      ),
                                                                                                )),
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        100.0,
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        0.97,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0x00272B50),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                20.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                StreamBuilder<List<BanniereRecord>>(
                                                                                  stream: queryBanniereRecord(
                                                                                    queryBuilder: (banniereRecord) => banniereRecord.orderBy('priorite', descending: true),
                                                                                    singleRecord: true,
                                                                                  ),
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
                                                                                    List<BanniereRecord> containerBanniereRecordList = snapshot.data!;
                                                                                    // Return an empty Container when the item does not exist.
                                                                                    if (snapshot.data!.isEmpty) {
                                                                                      return Container();
                                                                                    }
                                                                                    final containerBanniereRecord = containerBanniereRecordList.isNotEmpty ? containerBanniereRecordList.first : null;
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
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                30.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
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
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 100.0),
                                                                              child: StreamBuilder<List<ProduitsRecord>>(
                                                                                stream: queryProduitsRecord(
                                                                                  queryBuilder: (produitsRecord) => produitsRecord.orderBy('vue', descending: true),
                                                                                  limit: 10,
                                                                                ),
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
                                                                                  List<ProduitsRecord> columnProduitsRecordList = snapshot.data!;
                                                                                  return SingleChildScrollView(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: List.generate(columnProduitsRecordList.length, (columnIndex) {
                                                                                        final columnProduitsRecord = columnProduitsRecordList[columnIndex];
                                                                                        return CardProWidget(
                                                                                          key: Key('Keybuq_${columnIndex}_of_${columnProduitsRecordList.length}'),
                                                                                          list: columnProduitsRecord.reference,
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
            ),
          ),
        );
      },
    );
  }
}
