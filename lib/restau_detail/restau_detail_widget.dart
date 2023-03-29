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
import 'restau_detail_model.dart';
export 'restau_detail_model.dart';

class RestauDetailWidget extends StatefulWidget {
  const RestauDetailWidget({
    Key? key,
    this.ref,
  }) : super(key: key);

  final DocumentReference? ref;

  @override
  _RestauDetailWidgetState createState() => _RestauDetailWidgetState();
}

class _RestauDetailWidgetState extends State<RestauDetailWidget> {
  late RestauDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RestauDetailModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'restauDetail'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!loggedIn) {
        _model.currentPageLink = await generateCurrentPageLink(context);

        setState(() {
          FFAppState().shaare = true;
          FFAppState().linkShare = _model.currentPageLink;
        });

        context.goNamed('onBoarding4');
      }
    });

    _model.searchField232Controller ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<RestaurantsRecord>(
      stream: RestaurantsRecord.getDocument(widget.ref!),
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
        final restauDetailRestaurantsRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(),
                  child: StreamBuilder<List<RestaurantsRecord>>(
                    stream: queryRestaurantsRecord(
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
                      List<RestaurantsRecord> containerRestaurantsRecordList =
                          snapshot.data!;
                      // Return an empty Container when the item does not exist.
                      if (snapshot.data!.isEmpty) {
                        return Container();
                      }
                      final containerRestaurantsRecord =
                          containerRestaurantsRecordList.isNotEmpty
                              ? containerRestaurantsRecordList.first
                              : null;
                      return Container(
                        decoration: BoxDecoration(),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 1.0, 0.0, 0.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 5.0,
                                              color: Color(0x430F1113),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(8.0),
                                            bottomRight: Radius.circular(8.0),
                                            topLeft: Radius.circular(0.0),
                                            topRight: Radius.circular(0.0),
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              height: 220.0,
                                              decoration: BoxDecoration(),
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, -1.15),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                30.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                30.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        topRight:
                                                            Radius.circular(
                                                                0.0),
                                                      ),
                                                      child: Image.network(
                                                        restauDetailRestaurantsRecord
                                                            .cover!,
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            1.0,
                                                        height: 180.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  if (currentUserDocument!
                                                          .refresto ==
                                                      restauDetailRestaurantsRecord
                                                          .reference)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              1.0,
                                                          height: 180.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x77090F13),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30.0,
                                                                buttonSize:
                                                                    48.0,
                                                                icon: Icon(
                                                                  Icons
                                                                      .photo_camera,
                                                                  color: Color(
                                                                      0xB7FFFFFF),
                                                                  size: 30.0,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  final selectedMedia =
                                                                      await selectMediaWithSourceBottomSheet(
                                                                    context:
                                                                        context,
                                                                    allowPhoto:
                                                                        true,
                                                                  );
                                                                  if (selectedMedia !=
                                                                          null &&
                                                                      selectedMedia.every((m) => validateFileFormat(
                                                                          m.storagePath,
                                                                          context))) {
                                                                    setState(() =>
                                                                        _model.isMediaUploading1 =
                                                                            true);
                                                                    var selectedUploadedFiles =
                                                                        <FFUploadedFile>[];
                                                                    var downloadUrls =
                                                                        <String>[];
                                                                    try {
                                                                      selectedUploadedFiles = selectedMedia
                                                                          .map((m) => FFUploadedFile(
                                                                                name: m.storagePath.split('/').last,
                                                                                bytes: m.bytes,
                                                                                height: m.dimensions?.height,
                                                                                width: m.dimensions?.width,
                                                                              ))
                                                                          .toList();

                                                                      downloadUrls = (await Future
                                                                              .wait(
                                                                        selectedMedia
                                                                            .map(
                                                                          (m) async => await uploadData(
                                                                              m.storagePath,
                                                                              m.bytes),
                                                                        ),
                                                                      ))
                                                                          .where((u) =>
                                                                              u !=
                                                                              null)
                                                                          .map((u) =>
                                                                              u!)
                                                                          .toList();
                                                                    } finally {
                                                                      _model.isMediaUploading1 =
                                                                          false;
                                                                    }
                                                                    if (selectedUploadedFiles.length ==
                                                                            selectedMedia
                                                                                .length &&
                                                                        downloadUrls.length ==
                                                                            selectedMedia.length) {
                                                                      setState(
                                                                          () {
                                                                        _model.uploadedLocalFile1 =
                                                                            selectedUploadedFiles.first;
                                                                        _model.uploadedFileUrl1 =
                                                                            downloadUrls.first;
                                                                      });
                                                                    } else {
                                                                      setState(
                                                                          () {});
                                                                      return;
                                                                    }
                                                                  }

                                                                  final restaurantsUpdateData =
                                                                      createRestaurantsRecordData(
                                                                    cover: _model
                                                                        .uploadedFileUrl1,
                                                                  );
                                                                  await restauDetailRestaurantsRecord
                                                                      .reference
                                                                      .update(
                                                                          restaurantsUpdateData);
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.5),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  20.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Container(
                                                        width: 80.0,
                                                        height: 80.0,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          restauDetailRestaurantsRecord
                                                              .img!,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (currentUserDocument!
                                                          .refresto ==
                                                      restauDetailRestaurantsRecord
                                                          .reference)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.65),
                                                      child:
                                                          AuthUserStreamWidget(
                                                        builder: (context) =>
                                                            FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30.0,
                                                          buttonSize: 48.0,
                                                          icon: Icon(
                                                            Icons.photo_camera,
                                                            color: Color(
                                                                0xACFFFFFF),
                                                            size: 20.0,
                                                          ),
                                                          onPressed: () async {
                                                            final selectedMedia =
                                                                await selectMediaWithSourceBottomSheet(
                                                              context: context,
                                                              allowPhoto: true,
                                                            );
                                                            if (selectedMedia !=
                                                                    null &&
                                                                selectedMedia.every((m) =>
                                                                    validateFileFormat(
                                                                        m.storagePath,
                                                                        context))) {
                                                              setState(() =>
                                                                  _model.isMediaUploading2 =
                                                                      true);
                                                              var selectedUploadedFiles =
                                                                  <FFUploadedFile>[];
                                                              var downloadUrls =
                                                                  <String>[];
                                                              try {
                                                                selectedUploadedFiles =
                                                                    selectedMedia
                                                                        .map((m) =>
                                                                            FFUploadedFile(
                                                                              name: m.storagePath.split('/').last,
                                                                              bytes: m.bytes,
                                                                              height: m.dimensions?.height,
                                                                              width: m.dimensions?.width,
                                                                            ))
                                                                        .toList();

                                                                downloadUrls = (await Future
                                                                        .wait(
                                                                  selectedMedia
                                                                      .map(
                                                                    (m) async =>
                                                                        await uploadData(
                                                                            m.storagePath,
                                                                            m.bytes),
                                                                  ),
                                                                ))
                                                                    .where((u) =>
                                                                        u !=
                                                                        null)
                                                                    .map((u) =>
                                                                        u!)
                                                                    .toList();
                                                              } finally {
                                                                _model.isMediaUploading2 =
                                                                    false;
                                                              }
                                                              if (selectedUploadedFiles
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length &&
                                                                  downloadUrls
                                                                          .length ==
                                                                      selectedMedia
                                                                          .length) {
                                                                setState(() {
                                                                  _model.uploadedLocalFile2 =
                                                                      selectedUploadedFiles
                                                                          .first;
                                                                  _model.uploadedFileUrl2 =
                                                                      downloadUrls
                                                                          .first;
                                                                });
                                                              } else {
                                                                setState(() {});
                                                                return;
                                                              }
                                                            }

                                                            final restaurantsUpdateData =
                                                                createRestaurantsRecordData(
                                                              img: _model
                                                                  .uploadedFileUrl2,
                                                            );
                                                            await restauDetailRestaurantsRecord
                                                                .reference
                                                                .update(
                                                                    restaurantsUpdateData);
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 60.0,
                                                    icon: Icon(
                                                      Icons
                                                          .arrow_back_ios_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 30.0,
                                                    ),
                                                    onPressed: () async {
                                                      context.safePop();
                                                    },
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
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            restauDetailRestaurantsRecord.nom!,
                                            textAlign: TextAlign.center,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'sf pro text',
                                                  fontSize: 16.0,
                                                  useGoogleFonts: false,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              'Adresse : ${restauDetailRestaurantsRecord.adresse}',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'sf pro text',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    fontSize: 13.0,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 10.0, 0.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              '${dateTimeFormat(
                                                'Hm',
                                                restauDetailRestaurantsRecord
                                                    .ouv,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )} - ${dateTimeFormat(
                                                'Hm',
                                                restauDetailRestaurantsRecord
                                                    .clo,
                                                locale:
                                                    FFLocalizations.of(context)
                                                        .languageCode,
                                              )}',
                                              textAlign: TextAlign.center,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'sf pro text',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary400,
                                                    fontSize: 12.0,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Builder(
                                      builder: (context) => Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 10.0, 0.0, 0.0),
                                        child: InkWell(
                                          onTap: () async {
                                            _model.currentPageLink =
                                                await generateCurrentPageLink(
                                              context,
                                              title:
                                                  restauDetailRestaurantsRecord
                                                      .nom,
                                              imageUrl:
                                                  restauDetailRestaurantsRecord
                                                      .img,
                                              description:
                                                  restauDetailRestaurantsRecord
                                                      .slogan,
                                            );

                                            if (isAndroid || isiOS) {
                                              await Share.share(
                                                _model.currentPageLink,
                                                sharePositionOrigin:
                                                    getWidgetBoundingBox(
                                                        context),
                                              );
                                            }
                                          },
                                          child: Container(
                                            height: 70.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryText,
                                                width: 2.0,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 8.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30.0,
                                                    borderWidth: 1.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons.share,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 20.0,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                4.0, 0.0),
                                                    child: Text(
                                                      'Partagez le lien de ce restaurant',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'sf pro text',
                                                                fontSize: 12.0,
                                                                useGoogleFonts:
                                                                    false,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    StreamBuilder<List<RestaurantsRecord>>(
                                      stream: queryRestaurantsRecord(
                                        queryBuilder: (restaurantsRecord) =>
                                            restaurantsRecord.where('nom',
                                                isEqualTo:
                                                    restauDetailRestaurantsRecord
                                                        .nom),
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                size: 20.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<RestaurantsRecord>
                                            containerRestaurantsRecordList =
                                            snapshot.data!;
                                        // Return an empty Container when the item does not exist.
                                        if (snapshot.data!.isEmpty) {
                                          return Container();
                                        }
                                        final containerRestaurantsRecord =
                                            containerRestaurantsRecordList
                                                    .isNotEmpty
                                                ? containerRestaurantsRecordList
                                                    .first
                                                : null;
                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 16.0, 0.0, 0.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 0.0, 20.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Pour vous',
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
                                                      ),
                                                      InkWell(
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            'pourVousresto',
                                                            queryParams: {
                                                              'res':
                                                                  serializeParam(
                                                                containerRestaurantsRecord!
                                                                    .reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Text(
                                                          'Voir plus',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
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
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          20.0, 16.0, 0.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<ProduitsRecord>>(
                                                    stream: queryProduitsRecord(
                                                      queryBuilder: (produitsRecord) =>
                                                          produitsRecord
                                                              .where(
                                                                  'restaurant',
                                                                  isEqualTo:
                                                                      containerRestaurantsRecord!
                                                                          .nom)
                                                              .orderBy('prio',
                                                                  descending:
                                                                      true),
                                                      limit: 20,
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<ProduitsRecord>
                                                          rowProduitsRecordList =
                                                          snapshot.data!;
                                                      return SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              rowProduitsRecordList
                                                                  .length,
                                                              (rowIndex) {
                                                            final rowProduitsRecord =
                                                                rowProduitsRecordList[
                                                                    rowIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              child: StreamBuilder<
                                                                  ProduitsRecord>(
                                                                stream: ProduitsRecord
                                                                    .getDocument(
                                                                        rowProduitsRecord
                                                                            .reference),
                                                                builder: (context,
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final containerProduitsRecord =
                                                                      snapshot
                                                                          .data!;
                                                                  return Container(
                                                                    width:
                                                                        230.0,
                                                                    height:
                                                                        360.0,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          400.0,
                                                                      maxHeight:
                                                                          320.0,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          9.0,
                                                                          9.0,
                                                                          9.0,
                                                                          9.0),
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().complet =
                                                                                false;
                                                                            FFAppState().refFav =
                                                                                null;
                                                                          });
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().qty =
                                                                                1;
                                                                          });

                                                                          final produitsUpdateData =
                                                                              {
                                                                            'vue':
                                                                                FieldValue.increment(1),
                                                                          };
                                                                          await containerProduitsRecord
                                                                              .reference
                                                                              .update(produitsUpdateData);
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
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
                                                                          ).then((value) =>
                                                                              setState(() {}));
                                                                        },
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Stack(
                                                                              children: [
                                                                                Container(
                                                                                  width: double.infinity,
                                                                                  height: 170.0,
                                                                                  constraints: BoxConstraints(
                                                                                    maxHeight: 170.0,
                                                                                  ),
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    image: DecorationImage(
                                                                                      fit: BoxFit.fitHeight,
                                                                                      image: Image.network(
                                                                                        containerProduitsRecord.image!,
                                                                                      ).image,
                                                                                    ),
                                                                                    borderRadius: BorderRadius.circular(15.0),
                                                                                  ),
                                                                                ),
                                                                                if (containerProduitsRecord.pourcentage != 0)
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(0.96, -0.95),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: 50.0,
                                                                                        height: 40.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0xAC40249B),
                                                                                          borderRadius: BorderRadius.circular(2.0),
                                                                                        ),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              '- ${containerProduitsRecord.pourcentage?.toString()} %',
                                                                                              textAlign: TextAlign.center,
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'sf pro text',
                                                                                                    color: Colors.white,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            )),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ],
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
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Row(
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
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  flex: 2,
                                                                                                  child: Align(
                                                                                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                      child: Text(
                                                                                                        containerProduitsRecord.restaurant!,
                                                                                                        textAlign: TextAlign.start,
                                                                                                        maxLines: 2,
                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                              fontFamily: 'sf pro text',
                                                                                                              color: FlutterFlowTheme.of(context).tertiary400,
                                                                                                              fontSize: 14.0,
                                                                                                              useGoogleFonts: false,
                                                                                                            ),
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
                                                                                RatingBarIndicator(
                                                                                  itemBuilder: (context, index) => Icon(
                                                                                    Icons.star_rounded,
                                                                                    color: Color(0xFFFFCC53),
                                                                                  ),
                                                                                  direction: Axis.horizontal,
                                                                                  rating: functions.rate(containerProduitsRecord.note!.toList(), containerProduitsRecord.note!.toList().length),
                                                                                  unratedColor: Color(0xFF9E9E9E),
                                                                                  itemCount: 5,
                                                                                  itemSize: 18.0,
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
                                                                                          return '${functions.reduce(functions.multippl(containerProduitsRecord.prix!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
                                                                                        } else if ((containerProduitsRecord.multi == true) && (FFAppState().prixDefaut == false)) {
                                                                                          return '${functions.reduce(functions.multippl(containerProduitsRecord.prixComplet!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
                                                                                        } else {
                                                                                          return '${functions.reduce(functions.multippl(containerProduitsRecord.prixDemi!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
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
                                                StreamBuilder<
                                                    List<RestaurantsRecord>>(
                                                  stream:
                                                      queryRestaurantsRecord(
                                                    queryBuilder: (restaurantsRecord) =>
                                                        restaurantsRecord.where(
                                                            'nom',
                                                            isEqualTo:
                                                                restauDetailRestaurantsRecord
                                                                    .nom),
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            size: 20.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<RestaurantsRecord>
                                                        containerRestaurantsRecordList =
                                                        snapshot.data!;
                                                    // Return an empty Container when the item does not exist.
                                                    if (snapshot
                                                        .data!.isEmpty) {
                                                      return Container();
                                                    }
                                                    final containerRestaurantsRecord =
                                                        containerRestaurantsRecordList
                                                                .isNotEmpty
                                                            ? containerRestaurantsRecordList
                                                                .first
                                                            : null;
                                                    return Container(
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    16.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          20.0,
                                                                          0.0,
                                                                          20.0,
                                                                          0.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Text(
                                                                    'Mieux notés',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'sf pro text',
                                                                          fontSize:
                                                                              16.0,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      context
                                                                          .pushNamed(
                                                                        'lesmieuNote',
                                                                        queryParams:
                                                                            {
                                                                          'res':
                                                                              serializeParam(
                                                                            restauDetailRestaurantsRecord.reference,
                                                                            ParamType.DocumentReference,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    },
                                                                    child: Text(
                                                                      'Voir plus',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'sf pro text',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                            useGoogleFonts:
                                                                                false,
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
                                                                          20.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      ProduitsRecord>>(
                                                                stream:
                                                                    queryProduitsRecord(
                                                                  queryBuilder: (produitsRecord) => produitsRecord
                                                                      .where(
                                                                          'restaurant',
                                                                          isEqualTo: containerRestaurantsRecord!
                                                                              .nom)
                                                                      .orderBy(
                                                                          'moyenne',
                                                                          descending:
                                                                              true),
                                                                  limit: 20,
                                                                ),
                                                                builder: (context,
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          size:
                                                                              20.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<ProduitsRecord>
                                                                      rowProduitsRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  return SingleChildScrollView(
                                                                    scrollDirection:
                                                                        Axis.horizontal,
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: List.generate(
                                                                          rowProduitsRecordList
                                                                              .length,
                                                                          (rowIndex) {
                                                                        final rowProduitsRecord =
                                                                            rowProduitsRecordList[rowIndex];
                                                                        return Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              StreamBuilder<ProduitsRecord>(
                                                                            stream:
                                                                                ProduitsRecord.getDocument(rowProduitsRecord.reference),
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
                                                                              final containerProduitsRecord = snapshot.data!;
                                                                              return Container(
                                                                                width: 230.0,
                                                                                height: 360.0,
                                                                                constraints: BoxConstraints(
                                                                                  maxWidth: 400.0,
                                                                                  maxHeight: 320.0,
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
                                                                                        Stack(
                                                                                          children: [
                                                                                            Container(
                                                                                              width: double.infinity,
                                                                                              height: 170.0,
                                                                                              constraints: BoxConstraints(
                                                                                                maxHeight: 170.0,
                                                                                              ),
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                image: DecorationImage(
                                                                                                  fit: BoxFit.fitHeight,
                                                                                                  image: Image.network(
                                                                                                    containerProduitsRecord.image!,
                                                                                                  ).image,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(15.0),
                                                                                              ),
                                                                                            ),
                                                                                            if (containerProduitsRecord.pourcentage != 0)
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.96, -0.95),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                  child: Container(
                                                                                                    width: 50.0,
                                                                                                    height: 40.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Color(0xAC40249B),
                                                                                                      borderRadius: BorderRadius.circular(2.0),
                                                                                                    ),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      children: [
                                                                                                        SelectionArea(
                                                                                                            child: Text(
                                                                                                          '- ${containerProduitsRecord.pourcentage?.toString()} %',
                                                                                                          textAlign: TextAlign.center,
                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                fontFamily: 'sf pro text',
                                                                                                                color: Colors.white,
                                                                                                                useGoogleFonts: false,
                                                                                                              ),
                                                                                                        )),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                          ],
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
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Row(
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
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Expanded(
                                                                                                              flex: 2,
                                                                                                              child: Align(
                                                                                                                alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                                  child: Text(
                                                                                                                    containerProduitsRecord.restaurant!,
                                                                                                                    textAlign: TextAlign.start,
                                                                                                                    maxLines: 2,
                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                          fontFamily: 'sf pro text',
                                                                                                                          color: FlutterFlowTheme.of(context).tertiary400,
                                                                                                                          fontSize: 14.0,
                                                                                                                          useGoogleFonts: false,
                                                                                                                        ),
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
                                                                                            RatingBarIndicator(
                                                                                              itemBuilder: (context, index) => Icon(
                                                                                                Icons.star_rounded,
                                                                                                color: Color(0xFFFFCC53),
                                                                                              ),
                                                                                              direction: Axis.horizontal,
                                                                                              rating: functions.rate(containerProduitsRecord.note!.toList(), containerProduitsRecord.note!.toList().length),
                                                                                              unratedColor: Color(0xFF9E9E9E),
                                                                                              itemCount: 5,
                                                                                              itemSize: 18.0,
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
                                                                                                      return '${functions.reduce(functions.multippl(containerProduitsRecord.prix!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
                                                                                                    } else if ((containerProduitsRecord.multi == true) && (FFAppState().prixDefaut == false)) {
                                                                                                      return '${functions.reduce(functions.multippl(containerProduitsRecord.prixComplet!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
                                                                                                    } else {
                                                                                                      return '${functions.reduce(functions.multippl(containerProduitsRecord.prixDemi!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
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
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 20.0),
                                                  child: StreamBuilder<
                                                      List<CatRecord>>(
                                                    stream: queryCatRecord(
                                                      queryBuilder: (catRecord) =>
                                                          catRecord.whereIn(
                                                              'nom',
                                                              restauDetailRestaurantsRecord
                                                                  .catego!
                                                                  .toList()),
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 20.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<CatRecord>
                                                          columnCatRecordList =
                                                          snapshot.data!;
                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            columnCatRecordList
                                                                .length,
                                                            (columnIndex) {
                                                          final columnCatRecord =
                                                              columnCatRecordList[
                                                                  columnIndex];
                                                          return StreamBuilder<
                                                              CatRecord>(
                                                            stream: CatRecord
                                                                .getDocument(
                                                                    columnCatRecord
                                                                        .reference),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 20.0,
                                                                    height:
                                                                        20.0,
                                                                    child:
                                                                        SpinKitPulse(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              final containerCatRecord =
                                                                  snapshot
                                                                      .data!;
                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            0.0,
                                                                            20.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              containerCatRecord.nom!,
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'sf pro text',
                                                                                    fontSize: 16.0,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                            ),
                                                                            InkWell(
                                                                              onTap: () async {
                                                                                context.pushNamed(
                                                                                  'categoryplat',
                                                                                  queryParams: {
                                                                                    'res': serializeParam(
                                                                                      restauDetailRestaurantsRecord.reference,
                                                                                      ParamType.DocumentReference,
                                                                                    ),
                                                                                    'cat': serializeParam(
                                                                                      containerCatRecord.reference,
                                                                                      ParamType.DocumentReference,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              child: Text(
                                                                                'Voir plus',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'sf pro text',
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      useGoogleFonts: false,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            16.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child: StreamBuilder<
                                                                            List<ProduitsRecord>>(
                                                                          stream:
                                                                              queryProduitsRecord(
                                                                            queryBuilder: (produitsRecord) =>
                                                                                produitsRecord.where('category', isEqualTo: containerCatRecord.nom).orderBy('moyenne', descending: true),
                                                                            limit:
                                                                                20,
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
                                                                            List<ProduitsRecord>
                                                                                rowProduitsRecordList =
                                                                                snapshot.data!;
                                                                            return SingleChildScrollView(
                                                                              scrollDirection: Axis.horizontal,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: List.generate(rowProduitsRecordList.length, (rowIndex) {
                                                                                  final rowProduitsRecord = rowProduitsRecordList[rowIndex];
                                                                                  return Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                    child: StreamBuilder<ProduitsRecord>(
                                                                                      stream: ProduitsRecord.getDocument(rowProduitsRecord.reference),
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
                                                                                          width: 230.0,
                                                                                          height: 360.0,
                                                                                          constraints: BoxConstraints(
                                                                                            maxWidth: 400.0,
                                                                                            maxHeight: 320.0,
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
                                                                                                  Stack(
                                                                                                    children: [
                                                                                                      Container(
                                                                                                        width: double.infinity,
                                                                                                        height: 170.0,
                                                                                                        constraints: BoxConstraints(
                                                                                                          maxHeight: 170.0,
                                                                                                        ),
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          image: DecorationImage(
                                                                                                            fit: BoxFit.fitHeight,
                                                                                                            image: Image.network(
                                                                                                              containerProduitsRecord.image!,
                                                                                                            ).image,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                      if (containerProduitsRecord.pourcentage != 0)
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(0.96, -0.95),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                            child: Container(
                                                                                                              width: 50.0,
                                                                                                              height: 40.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: Color(0xAC40249B),
                                                                                                                borderRadius: BorderRadius.circular(2.0),
                                                                                                              ),
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                children: [
                                                                                                                  SelectionArea(
                                                                                                                      child: Text(
                                                                                                                    '- ${containerProduitsRecord.pourcentage?.toString()} %',
                                                                                                                    textAlign: TextAlign.center,
                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                          fontFamily: 'sf pro text',
                                                                                                                          color: Colors.white,
                                                                                                                          useGoogleFonts: false,
                                                                                                                        ),
                                                                                                                  )),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                    ],
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
                                                                                                              child: Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Row(
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
                                                                                                                  Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                    children: [
                                                                                                                      Expanded(
                                                                                                                        flex: 2,
                                                                                                                        child: Align(
                                                                                                                          alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                                          child: Padding(
                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                                            child: Text(
                                                                                                                              containerProduitsRecord.restaurant!,
                                                                                                                              textAlign: TextAlign.start,
                                                                                                                              maxLines: 2,
                                                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                    fontFamily: 'sf pro text',
                                                                                                                                    color: FlutterFlowTheme.of(context).tertiary400,
                                                                                                                                    fontSize: 14.0,
                                                                                                                                    useGoogleFonts: false,
                                                                                                                                  ),
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
                                                                                                      RatingBarIndicator(
                                                                                                        itemBuilder: (context, index) => Icon(
                                                                                                          Icons.star_rounded,
                                                                                                          color: Color(0xFFFFCC53),
                                                                                                        ),
                                                                                                        direction: Axis.horizontal,
                                                                                                        rating: functions.rate(containerProduitsRecord.note!.toList(), containerProduitsRecord.note!.toList().length),
                                                                                                        unratedColor: Color(0xFF9E9E9E),
                                                                                                        itemCount: 5,
                                                                                                        itemSize: 18.0,
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
                                                                                                                return '${functions.reduce(functions.multippl(containerProduitsRecord.prix!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
                                                                                                              } else if ((containerProduitsRecord.multi == true) && (FFAppState().prixDefaut == false)) {
                                                                                                                return '${functions.reduce(functions.multippl(containerProduitsRecord.prixComplet!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
                                                                                                              } else {
                                                                                                                return '${functions.reduce(functions.multippl(containerProduitsRecord.prixDemi!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
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
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
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
                                    width: MediaQuery.of(context).size.width *
                                        0.19,
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
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.network(
                                                      columnUsersRecord
                                                          .photoUrl!,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 15.0,
                                                                0.0, 0.0),
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
                                                            child:
                                                                SelectionArea(
                                                                    child: Text(
                                                              columnUsersRecord
                                                                  .displayName!,
                                                              textAlign:
                                                                  TextAlign
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
                                                            width: 150.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
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
                                                                        30.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        30.0,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryColor,
                                                                    icon: Icon(
                                                                      FFIcons
                                                                          .kfiRrHome,
                                                                      color: Colors
                                                                          .white,
                                                                      size:
                                                                          15.0,
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
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed('Accueil');
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              'Accueil',
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
                                                                      size:
                                                                          15.0,
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
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed('favoris');
                                                                            },
                                                                            child:
                                                                                Text(
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
                                                                      size:
                                                                          15.0,
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
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed('category');
                                                                            },
                                                                            child:
                                                                                Text(
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
                                                                context
                                                                    .pushNamed(
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
                                                                      size:
                                                                          15.0,
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
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed('cart2');
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              'Commandes',
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
                                                                context
                                                                    .pushNamed(
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
                                                                          .kfiRrUser,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          15.0,
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
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed('user');
                                                                            },
                                                                            child:
                                                                                Text(
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50.0),
                                                            ),
                                                            child: InkWell(
                                                              onTap: () async {
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
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        50.0,
                                                                    borderWidth:
                                                                        1.0,
                                                                    buttonSize:
                                                                        30.0,
                                                                    fillColor:
                                                                        Color(
                                                                            0xFFCC4433),
                                                                    icon: Icon(
                                                                      FFIcons
                                                                          .kfiRrShop,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          15.0,
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
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed('restaurants');
                                                                            },
                                                                            child:
                                                                                Text(
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 5.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.phone,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        size: 20.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child: StreamBuilder<
                                                            List<RideRecord>>(
                                                          stream:
                                                              queryRideRecord(
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 20.0,
                                                                  height: 20.0,
                                                                  child:
                                                                      SpinKitPulse(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    size: 20.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<RideRecord>
                                                                textRideRecordList =
                                                                snapshot.data!;
                                                            // Return an empty Container when the item does not exist.
                                                            if (snapshot.data!
                                                                .isEmpty) {
                                                              return Container();
                                                            }
                                                            final textRideRecord =
                                                                textRideRecordList
                                                                        .isNotEmpty
                                                                    ? textRideRecordList
                                                                        .first
                                                                    : null;
                                                            return Text(
                                                              textRideRecord!
                                                                  .userAddress!,
                                                              maxLines: 2,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'sf pro text',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        13.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            );
                                                          },
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
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: 100.0,
                                      height:
                                          MediaQuery.of(context).size.height *
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20.0,
                                                                16.0,
                                                                20.0,
                                                                0.0),
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
                                                            child:
                                                                TextFormField(
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
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                labelStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2,
                                                                hintText:
                                                                    'Recherchez un plat ici',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Lexend Deca',
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                      fontSize:
                                                                          12.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
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
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                contentPadding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            14.0,
                                                                            24.0,
                                                                            14.0,
                                                                            24.0),
                                                                prefixIcon:
                                                                    Icon(
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
                                                                              _model.algoliaSearchResults = null);
                                                                          await ProduitsRecord
                                                                              .search(
                                                                            term:
                                                                                _model.searchField232Controller.text,
                                                                          ).then((r) => _model.algoliaSearchResults = r).onError((_, __) => _model.algoliaSearchResults = []).whenComplete(() =>
                                                                              setState(() {}));

                                                                          setState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .clear,
                                                                          color:
                                                                              Color(0xFF757575),
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
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.55,
                                                                    height: MediaQuery.of(context)
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
                                                                        // Customize what your widget looks like with no search results.
                                                                        if (snapshot
                                                                            .data!
                                                                            .isEmpty) {
                                                                          return Container(
                                                                            height:
                                                                                100,
                                                                            child:
                                                                                Center(
                                                                              child: Text('No results.'),
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 16.0, 0.0, 0.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
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
                                                          height: 40.0,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 140.0,
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
                                                                      Colors
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
                                                                    Icons
                                                                        .logout,
                                                                    color: Colors
                                                                        .white,
                                                                    size: 20.0,
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
                                                                        Expanded(
                                                                          child:
                                                                              InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              GoRouter.of(context).prepareAuthEvent();
                                                                              await signOut();
                                                                              GoRouter.of(context).clearRedirectLocation();

                                                                              context.goNamedAuth('Onboarding1', mounted);
                                                                            },
                                                                            child:
                                                                                Text(
                                                                              'Déconnexion',
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'sf pro text',
                                                                                    color: Colors.white,
                                                                                    fontSize: 12.0,
                                                                                    fontWeight: FontWeight.bold,
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
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.97,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                60.0),
                                                        topRight:
                                                            Radius.circular(
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
                                                            child: StreamBuilder<
                                                                List<
                                                                    RestaurantsRecord>>(
                                                              stream:
                                                                  queryRestaurantsRecord(
                                                                singleRecord:
                                                                    true,
                                                              ),
                                                              builder: (context,
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        size:
                                                                            20.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<RestaurantsRecord>
                                                                    containerRestaurantsRecordList =
                                                                    snapshot
                                                                        .data!;
                                                                // Return an empty Container when the item does not exist.
                                                                if (snapshot
                                                                    .data!
                                                                    .isEmpty) {
                                                                  return Container();
                                                                }
                                                                final containerRestaurantsRecord =
                                                                    containerRestaurantsRecordList
                                                                            .isNotEmpty
                                                                        ? containerRestaurantsRecordList
                                                                            .first
                                                                        : null;
                                                                return Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        children: [
                                                                          Stack(
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 1.0, 0.0, 0.0),
                                                                                child: Container(
                                                                                  width: MediaQuery.of(context).size.width * 1.0,
                                                                                  decoration: BoxDecoration(
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 5.0,
                                                                                        color: Color(0x430F1113),
                                                                                        offset: Offset(0.0, 2.0),
                                                                                      )
                                                                                    ],
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(8.0),
                                                                                      bottomRight: Radius.circular(8.0),
                                                                                      topLeft: Radius.circular(0.0),
                                                                                      topRight: Radius.circular(0.0),
                                                                                    ),
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    children: [
                                                                                      Container(
                                                                                        height: 220.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Stack(
                                                                                          children: [
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, -1.15),
                                                                                              child: ClipRRect(
                                                                                                borderRadius: BorderRadius.only(
                                                                                                  bottomLeft: Radius.circular(30.0),
                                                                                                  bottomRight: Radius.circular(30.0),
                                                                                                  topLeft: Radius.circular(0.0),
                                                                                                  topRight: Radius.circular(0.0),
                                                                                                ),
                                                                                                child: Image.network(
                                                                                                  restauDetailRestaurantsRecord.cover!,
                                                                                                  width: MediaQuery.of(context).size.width * 1.0,
                                                                                                  height: 180.0,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            if (currentUserDocument!.refresto == restauDetailRestaurantsRecord.reference)
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.0, -1.0),
                                                                                                child: AuthUserStreamWidget(
                                                                                                  builder: (context) => Container(
                                                                                                    width: MediaQuery.of(context).size.width * 1.0,
                                                                                                    height: 180.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Color(0x77090F13),
                                                                                                    ),
                                                                                                    child: Column(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                                      children: [
                                                                                                        FlutterFlowIconButton(
                                                                                                          borderColor: Colors.transparent,
                                                                                                          borderRadius: 30.0,
                                                                                                          buttonSize: 48.0,
                                                                                                          icon: Icon(
                                                                                                            Icons.photo_camera,
                                                                                                            color: Color(0xB7FFFFFF),
                                                                                                            size: 30.0,
                                                                                                          ),
                                                                                                          onPressed: () async {
                                                                                                            final selectedMedia = await selectMediaWithSourceBottomSheet(
                                                                                                              context: context,
                                                                                                              allowPhoto: true,
                                                                                                            );
                                                                                                            if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                                              setState(() => _model.isMediaUploading3 = true);
                                                                                                              var selectedUploadedFiles = <FFUploadedFile>[];
                                                                                                              var downloadUrls = <String>[];
                                                                                                              try {
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
                                                                                                                _model.isMediaUploading3 = false;
                                                                                                              }
                                                                                                              if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                                                setState(() {
                                                                                                                  _model.uploadedLocalFile3 = selectedUploadedFiles.first;
                                                                                                                  _model.uploadedFileUrl3 = downloadUrls.first;
                                                                                                                });
                                                                                                              } else {
                                                                                                                setState(() {});
                                                                                                                return;
                                                                                                              }
                                                                                                            }

                                                                                                            final restaurantsUpdateData = createRestaurantsRecordData(
                                                                                                              cover: _model.uploadedFileUrl3,
                                                                                                            );
                                                                                                            await restauDetailRestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                                          },
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.5),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                                child: Container(
                                                                                                  width: 80.0,
                                                                                                  height: 80.0,
                                                                                                  clipBehavior: Clip.antiAlias,
                                                                                                  decoration: BoxDecoration(
                                                                                                    shape: BoxShape.circle,
                                                                                                  ),
                                                                                                  child: Image.network(
                                                                                                    restauDetailRestaurantsRecord.img!,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            if (currentUserDocument!.refresto == restauDetailRestaurantsRecord.reference)
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.65),
                                                                                                child: AuthUserStreamWidget(
                                                                                                  builder: (context) => FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 30.0,
                                                                                                    buttonSize: 48.0,
                                                                                                    icon: Icon(
                                                                                                      Icons.photo_camera,
                                                                                                      color: Color(0xACFFFFFF),
                                                                                                      size: 20.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      final selectedMedia = await selectMediaWithSourceBottomSheet(
                                                                                                        context: context,
                                                                                                        allowPhoto: true,
                                                                                                      );
                                                                                                      if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                                        setState(() => _model.isMediaUploading4 = true);
                                                                                                        var selectedUploadedFiles = <FFUploadedFile>[];
                                                                                                        var downloadUrls = <String>[];
                                                                                                        try {
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
                                                                                                          _model.isMediaUploading4 = false;
                                                                                                        }
                                                                                                        if (selectedUploadedFiles.length == selectedMedia.length && downloadUrls.length == selectedMedia.length) {
                                                                                                          setState(() {
                                                                                                            _model.uploadedLocalFile4 = selectedUploadedFiles.first;
                                                                                                            _model.uploadedFileUrl4 = downloadUrls.first;
                                                                                                          });
                                                                                                        } else {
                                                                                                          setState(() {});
                                                                                                          return;
                                                                                                        }
                                                                                                      }

                                                                                                      final restaurantsUpdateData = createRestaurantsRecordData(
                                                                                                        img: _model.uploadedFileUrl4,
                                                                                                      );
                                                                                                      await restauDetailRestaurantsRecord.reference.update(restaurantsUpdateData);
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            FlutterFlowIconButton(
                                                                                              borderColor: Colors.transparent,
                                                                                              borderRadius: 30.0,
                                                                                              borderWidth: 1.0,
                                                                                              buttonSize: 60.0,
                                                                                              icon: Icon(
                                                                                                Icons.arrow_back_ios_rounded,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                size: 30.0,
                                                                                              ),
                                                                                              onPressed: () async {
                                                                                                context.safePop();
                                                                                              },
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
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.min,
                                                                            children: [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Expanded(
                                                                                    flex: 2,
                                                                                    child: Text(
                                                                                      restauDetailRestaurantsRecord.nom!,
                                                                                      textAlign: TextAlign.center,
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
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 2,
                                                                                      child: Text(
                                                                                        'Adresse : ${restauDetailRestaurantsRecord.adresse}',
                                                                                        textAlign: TextAlign.center,
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'sf pro text',
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 13.0,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 2,
                                                                                      child: Text(
                                                                                        '${dateTimeFormat(
                                                                                          'Hm',
                                                                                          restauDetailRestaurantsRecord.ouv,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        )} - ${dateTimeFormat(
                                                                                          'Hm',
                                                                                          restauDetailRestaurantsRecord.clo,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        )}',
                                                                                        textAlign: TextAlign.center,
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'sf pro text',
                                                                                              color: FlutterFlowTheme.of(context).tertiary400,
                                                                                              fontSize: 12.0,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Divider(
                                                                                thickness: 1.0,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                              ),
                                                                              StreamBuilder<List<RestaurantsRecord>>(
                                                                                stream: queryRestaurantsRecord(
                                                                                  queryBuilder: (restaurantsRecord) => restaurantsRecord.where('nom', isEqualTo: restauDetailRestaurantsRecord.nom),
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
                                                                                  List<RestaurantsRecord> containerRestaurantsRecordList = snapshot.data!;
                                                                                  // Return an empty Container when the item does not exist.
                                                                                  if (snapshot.data!.isEmpty) {
                                                                                    return Container();
                                                                                  }
                                                                                  final containerRestaurantsRecord = containerRestaurantsRecordList.isNotEmpty ? containerRestaurantsRecordList.first : null;
                                                                                  return Container(
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Pour vous',
                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                        fontFamily: 'sf pro text',
                                                                                                        fontSize: 16.0,
                                                                                                        useGoogleFonts: false,
                                                                                                      ),
                                                                                                ),
                                                                                                InkWell(
                                                                                                  onTap: () async {
                                                                                                    context.pushNamed(
                                                                                                      'pourVousresto',
                                                                                                      queryParams: {
                                                                                                        'res': serializeParam(
                                                                                                          containerRestaurantsRecord!.reference,
                                                                                                          ParamType.DocumentReference,
                                                                                                        ),
                                                                                                      }.withoutNulls,
                                                                                                    );
                                                                                                  },
                                                                                                  child: Text(
                                                                                                    'Voir plus',
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'sf pro text',
                                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 0.0, 0.0),
                                                                                            child: StreamBuilder<List<ProduitsRecord>>(
                                                                                              stream: queryProduitsRecord(
                                                                                                queryBuilder: (produitsRecord) => produitsRecord.where('restaurant', isEqualTo: containerRestaurantsRecord!.nom).orderBy('prio', descending: true),
                                                                                                limit: 20,
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
                                                                                                List<ProduitsRecord> rowProduitsRecordList = snapshot.data!;
                                                                                                return SingleChildScrollView(
                                                                                                  scrollDirection: Axis.horizontal,
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: List.generate(rowProduitsRecordList.length, (rowIndex) {
                                                                                                      final rowProduitsRecord = rowProduitsRecordList[rowIndex];
                                                                                                      return Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                        child: StreamBuilder<ProduitsRecord>(
                                                                                                          stream: ProduitsRecord.getDocument(rowProduitsRecord.reference),
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
                                                                                                              width: 230.0,
                                                                                                              height: 360.0,
                                                                                                              constraints: BoxConstraints(
                                                                                                                maxWidth: 400.0,
                                                                                                                maxHeight: 320.0,
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
                                                                                                                      Stack(
                                                                                                                        children: [
                                                                                                                          Container(
                                                                                                                            width: double.infinity,
                                                                                                                            height: 170.0,
                                                                                                                            constraints: BoxConstraints(
                                                                                                                              maxHeight: 170.0,
                                                                                                                            ),
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                              image: DecorationImage(
                                                                                                                                fit: BoxFit.fitHeight,
                                                                                                                                image: Image.network(
                                                                                                                                  containerProduitsRecord.image!,
                                                                                                                                ).image,
                                                                                                                              ),
                                                                                                                              borderRadius: BorderRadius.circular(15.0),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          if (containerProduitsRecord.pourcentage != 0)
                                                                                                                            Align(
                                                                                                                              alignment: AlignmentDirectional(0.96, -0.95),
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                                child: Container(
                                                                                                                                  width: 50.0,
                                                                                                                                  height: 40.0,
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    color: Color(0xAC40249B),
                                                                                                                                    borderRadius: BorderRadius.circular(2.0),
                                                                                                                                  ),
                                                                                                                                  child: Column(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                    children: [
                                                                                                                                      SelectionArea(
                                                                                                                                          child: Text(
                                                                                                                                        '- ${containerProduitsRecord.pourcentage?.toString()} %',
                                                                                                                                        textAlign: TextAlign.center,
                                                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                              fontFamily: 'sf pro text',
                                                                                                                                              color: Colors.white,
                                                                                                                                              useGoogleFonts: false,
                                                                                                                                            ),
                                                                                                                                      )),
                                                                                                                                    ],
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                        ],
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
                                                                                                                                  child: Column(
                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                    children: [
                                                                                                                                      Row(
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
                                                                                                                                      Row(
                                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                        children: [
                                                                                                                                          Expanded(
                                                                                                                                            flex: 2,
                                                                                                                                            child: Align(
                                                                                                                                              alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                                                              child: Padding(
                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                                                                child: Text(
                                                                                                                                                  containerProduitsRecord.restaurant!,
                                                                                                                                                  textAlign: TextAlign.start,
                                                                                                                                                  maxLines: 2,
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                        fontFamily: 'sf pro text',
                                                                                                                                                        color: FlutterFlowTheme.of(context).tertiary400,
                                                                                                                                                        fontSize: 14.0,
                                                                                                                                                        useGoogleFonts: false,
                                                                                                                                                      ),
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
                                                                                                                          RatingBarIndicator(
                                                                                                                            itemBuilder: (context, index) => Icon(
                                                                                                                              Icons.star_rounded,
                                                                                                                              color: Color(0xFFFFCC53),
                                                                                                                            ),
                                                                                                                            direction: Axis.horizontal,
                                                                                                                            rating: functions.rate(containerProduitsRecord.note!.toList(), containerProduitsRecord.note!.toList().length),
                                                                                                                            unratedColor: Color(0xFF9E9E9E),
                                                                                                                            itemCount: 5,
                                                                                                                            itemSize: 18.0,
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
                                                                                                                                    return '${functions.reduce(functions.multippl(containerProduitsRecord.prix!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
                                                                                                                                  } else if ((containerProduitsRecord.multi == true) && (FFAppState().prixDefaut == false)) {
                                                                                                                                    return '${functions.reduce(functions.multippl(containerProduitsRecord.prixComplet!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
                                                                                                                                  } else {
                                                                                                                                    return '${functions.reduce(functions.multippl(containerProduitsRecord.prixDemi!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
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
                                                                                          StreamBuilder<List<RestaurantsRecord>>(
                                                                                            stream: queryRestaurantsRecord(
                                                                                              queryBuilder: (restaurantsRecord) => restaurantsRecord.where('nom', isEqualTo: restauDetailRestaurantsRecord.nom),
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
                                                                                              List<RestaurantsRecord> containerRestaurantsRecordList = snapshot.data!;
                                                                                              // Return an empty Container when the item does not exist.
                                                                                              if (snapshot.data!.isEmpty) {
                                                                                                return Container();
                                                                                              }
                                                                                              final containerRestaurantsRecord = containerRestaurantsRecordList.isNotEmpty ? containerRestaurantsRecordList.first : null;
                                                                                              return Container(
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'Mieux notés',
                                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                    fontFamily: 'sf pro text',
                                                                                                                    fontSize: 16.0,
                                                                                                                    useGoogleFonts: false,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            InkWell(
                                                                                                              onTap: () async {
                                                                                                                context.pushNamed(
                                                                                                                  'lesmieuNote',
                                                                                                                  queryParams: {
                                                                                                                    'res': serializeParam(
                                                                                                                      restauDetailRestaurantsRecord.reference,
                                                                                                                      ParamType.DocumentReference,
                                                                                                                    ),
                                                                                                                  }.withoutNulls,
                                                                                                                );
                                                                                                              },
                                                                                                              child: Text(
                                                                                                                'Voir plus',
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 0.0, 0.0),
                                                                                                        child: StreamBuilder<List<ProduitsRecord>>(
                                                                                                          stream: queryProduitsRecord(
                                                                                                            queryBuilder: (produitsRecord) => produitsRecord.where('restaurant', isEqualTo: containerRestaurantsRecord!.nom).orderBy('moyenne', descending: true),
                                                                                                            limit: 20,
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
                                                                                                            List<ProduitsRecord> rowProduitsRecordList = snapshot.data!;
                                                                                                            return SingleChildScrollView(
                                                                                                              scrollDirection: Axis.horizontal,
                                                                                                              child: Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: List.generate(rowProduitsRecordList.length, (rowIndex) {
                                                                                                                  final rowProduitsRecord = rowProduitsRecordList[rowIndex];
                                                                                                                  return Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                                    child: StreamBuilder<ProduitsRecord>(
                                                                                                                      stream: ProduitsRecord.getDocument(rowProduitsRecord.reference),
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
                                                                                                                          width: 230.0,
                                                                                                                          height: 360.0,
                                                                                                                          constraints: BoxConstraints(
                                                                                                                            maxWidth: 400.0,
                                                                                                                            maxHeight: 320.0,
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
                                                                                                                                  Stack(
                                                                                                                                    children: [
                                                                                                                                      Container(
                                                                                                                                        width: double.infinity,
                                                                                                                                        height: 170.0,
                                                                                                                                        constraints: BoxConstraints(
                                                                                                                                          maxHeight: 170.0,
                                                                                                                                        ),
                                                                                                                                        decoration: BoxDecoration(
                                                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                          image: DecorationImage(
                                                                                                                                            fit: BoxFit.fitHeight,
                                                                                                                                            image: Image.network(
                                                                                                                                              containerProduitsRecord.image!,
                                                                                                                                            ).image,
                                                                                                                                          ),
                                                                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      if (containerProduitsRecord.pourcentage != 0)
                                                                                                                                        Align(
                                                                                                                                          alignment: AlignmentDirectional(0.96, -0.95),
                                                                                                                                          child: Padding(
                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                                            child: Container(
                                                                                                                                              width: 50.0,
                                                                                                                                              height: 40.0,
                                                                                                                                              decoration: BoxDecoration(
                                                                                                                                                color: Color(0xAC40249B),
                                                                                                                                                borderRadius: BorderRadius.circular(2.0),
                                                                                                                                              ),
                                                                                                                                              child: Column(
                                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                                children: [
                                                                                                                                                  SelectionArea(
                                                                                                                                                      child: Text(
                                                                                                                                                    '- ${containerProduitsRecord.pourcentage?.toString()} %',
                                                                                                                                                    textAlign: TextAlign.center,
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                          fontFamily: 'sf pro text',
                                                                                                                                                          color: Colors.white,
                                                                                                                                                          useGoogleFonts: false,
                                                                                                                                                        ),
                                                                                                                                                  )),
                                                                                                                                                ],
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                    ],
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
                                                                                                                                              child: Column(
                                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                                children: [
                                                                                                                                                  Row(
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
                                                                                                                                                  Row(
                                                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                                    children: [
                                                                                                                                                      Expanded(
                                                                                                                                                        flex: 2,
                                                                                                                                                        child: Align(
                                                                                                                                                          alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                                                                          child: Padding(
                                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                                                                            child: Text(
                                                                                                                                                              containerProduitsRecord.restaurant!,
                                                                                                                                                              textAlign: TextAlign.start,
                                                                                                                                                              maxLines: 2,
                                                                                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                                    fontFamily: 'sf pro text',
                                                                                                                                                                    color: FlutterFlowTheme.of(context).tertiary400,
                                                                                                                                                                    fontSize: 14.0,
                                                                                                                                                                    useGoogleFonts: false,
                                                                                                                                                                  ),
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
                                                                                                                                      RatingBarIndicator(
                                                                                                                                        itemBuilder: (context, index) => Icon(
                                                                                                                                          Icons.star_rounded,
                                                                                                                                          color: Color(0xFFFFCC53),
                                                                                                                                        ),
                                                                                                                                        direction: Axis.horizontal,
                                                                                                                                        rating: functions.rate(containerProduitsRecord.note!.toList(), containerProduitsRecord.note!.toList().length),
                                                                                                                                        unratedColor: Color(0xFF9E9E9E),
                                                                                                                                        itemCount: 5,
                                                                                                                                        itemSize: 18.0,
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
                                                                                                                                                return '${functions.reduce(functions.multippl(containerProduitsRecord.prix!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
                                                                                                                                              } else if ((containerProduitsRecord.multi == true) && (FFAppState().prixDefaut == false)) {
                                                                                                                                                return '${functions.reduce(functions.multippl(containerProduitsRecord.prixComplet!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
                                                                                                                                              } else {
                                                                                                                                                return '${functions.reduce(functions.multippl(containerProduitsRecord.prixDemi!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
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
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                                                                                            child: StreamBuilder<List<CatRecord>>(
                                                                                              stream: queryCatRecord(
                                                                                                queryBuilder: (catRecord) => catRecord.whereIn('nom', restauDetailRestaurantsRecord.catego!.toList()),
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
                                                                                                List<CatRecord> columnCatRecordList = snapshot.data!;
                                                                                                return Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: List.generate(columnCatRecordList.length, (columnIndex) {
                                                                                                    final columnCatRecord = columnCatRecordList[columnIndex];
                                                                                                    return StreamBuilder<CatRecord>(
                                                                                                      stream: CatRecord.getDocument(columnCatRecord.reference),
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
                                                                                                        final containerCatRecord = snapshot.data!;
                                                                                                        return Container(
                                                                                                          decoration: BoxDecoration(),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        containerCatRecord.nom!,
                                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                              fontFamily: 'sf pro text',
                                                                                                                              fontSize: 16.0,
                                                                                                                              useGoogleFonts: false,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                      InkWell(
                                                                                                                        onTap: () async {
                                                                                                                          context.pushNamed(
                                                                                                                            'categoryplat',
                                                                                                                            queryParams: {
                                                                                                                              'res': serializeParam(
                                                                                                                                restauDetailRestaurantsRecord.reference,
                                                                                                                                ParamType.DocumentReference,
                                                                                                                              ),
                                                                                                                              'cat': serializeParam(
                                                                                                                                containerCatRecord.reference,
                                                                                                                                ParamType.DocumentReference,
                                                                                                                              ),
                                                                                                                            }.withoutNulls,
                                                                                                                          );
                                                                                                                        },
                                                                                                                        child: Text(
                                                                                                                          'Voir plus',
                                                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                fontFamily: 'sf pro text',
                                                                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                                useGoogleFonts: false,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 0.0, 0.0),
                                                                                                                  child: StreamBuilder<List<ProduitsRecord>>(
                                                                                                                    stream: queryProduitsRecord(
                                                                                                                      queryBuilder: (produitsRecord) => produitsRecord.where('category', isEqualTo: containerCatRecord.nom).orderBy('moyenne', descending: true),
                                                                                                                      limit: 20,
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
                                                                                                                      List<ProduitsRecord> rowProduitsRecordList = snapshot.data!;
                                                                                                                      return SingleChildScrollView(
                                                                                                                        scrollDirection: Axis.horizontal,
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: List.generate(rowProduitsRecordList.length, (rowIndex) {
                                                                                                                            final rowProduitsRecord = rowProduitsRecordList[rowIndex];
                                                                                                                            return Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                                              child: StreamBuilder<ProduitsRecord>(
                                                                                                                                stream: ProduitsRecord.getDocument(rowProduitsRecord.reference),
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
                                                                                                                                    width: 230.0,
                                                                                                                                    height: 360.0,
                                                                                                                                    constraints: BoxConstraints(
                                                                                                                                      maxWidth: 400.0,
                                                                                                                                      maxHeight: 320.0,
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
                                                                                                                                            Stack(
                                                                                                                                              children: [
                                                                                                                                                Container(
                                                                                                                                                  width: double.infinity,
                                                                                                                                                  height: 170.0,
                                                                                                                                                  constraints: BoxConstraints(
                                                                                                                                                    maxHeight: 170.0,
                                                                                                                                                  ),
                                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                                    image: DecorationImage(
                                                                                                                                                      fit: BoxFit.fitHeight,
                                                                                                                                                      image: Image.network(
                                                                                                                                                        containerProduitsRecord.image!,
                                                                                                                                                      ).image,
                                                                                                                                                    ),
                                                                                                                                                    borderRadius: BorderRadius.circular(15.0),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                                if (containerProduitsRecord.pourcentage != 0)
                                                                                                                                                  Align(
                                                                                                                                                    alignment: AlignmentDirectional(0.96, -0.95),
                                                                                                                                                    child: Padding(
                                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                                                                      child: Container(
                                                                                                                                                        width: 50.0,
                                                                                                                                                        height: 40.0,
                                                                                                                                                        decoration: BoxDecoration(
                                                                                                                                                          color: Color(0xAC40249B),
                                                                                                                                                          borderRadius: BorderRadius.circular(2.0),
                                                                                                                                                        ),
                                                                                                                                                        child: Column(
                                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                                                                          children: [
                                                                                                                                                            SelectionArea(
                                                                                                                                                                child: Text(
                                                                                                                                                              '- ${containerProduitsRecord.pourcentage?.toString()} %',
                                                                                                                                                              textAlign: TextAlign.center,
                                                                                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                                    fontFamily: 'sf pro text',
                                                                                                                                                                    color: Colors.white,
                                                                                                                                                                    useGoogleFonts: false,
                                                                                                                                                                  ),
                                                                                                                                                            )),
                                                                                                                                                          ],
                                                                                                                                                        ),
                                                                                                                                                      ),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                              ],
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
                                                                                                                                                        child: Column(
                                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                                          children: [
                                                                                                                                                            Row(
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
                                                                                                                                                            Row(
                                                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                                              children: [
                                                                                                                                                                Expanded(
                                                                                                                                                                  flex: 2,
                                                                                                                                                                  child: Align(
                                                                                                                                                                    alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                                                                                    child: Padding(
                                                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                                                                                      child: Text(
                                                                                                                                                                        containerProduitsRecord.restaurant!,
                                                                                                                                                                        textAlign: TextAlign.start,
                                                                                                                                                                        maxLines: 2,
                                                                                                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                                              fontFamily: 'sf pro text',
                                                                                                                                                                              color: FlutterFlowTheme.of(context).tertiary400,
                                                                                                                                                                              fontSize: 14.0,
                                                                                                                                                                              useGoogleFonts: false,
                                                                                                                                                                            ),
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
                                                                                                                                                RatingBarIndicator(
                                                                                                                                                  itemBuilder: (context, index) => Icon(
                                                                                                                                                    Icons.star_rounded,
                                                                                                                                                    color: Color(0xFFFFCC53),
                                                                                                                                                  ),
                                                                                                                                                  direction: Axis.horizontal,
                                                                                                                                                  rating: functions.rate(containerProduitsRecord.note!.toList(), containerProduitsRecord.note!.toList().length),
                                                                                                                                                  unratedColor: Color(0xFF9E9E9E),
                                                                                                                                                  itemCount: 5,
                                                                                                                                                  itemSize: 18.0,
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
                                                                                                                                                          return '${functions.reduce(functions.multippl(containerProduitsRecord.prix!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
                                                                                                                                                        } else if ((containerProduitsRecord.multi == true) && (FFAppState().prixDefaut == false)) {
                                                                                                                                                          return '${functions.reduce(functions.multippl(containerProduitsRecord.prixComplet!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
                                                                                                                                                        } else {
                                                                                                                                                          return '${functions.reduce(functions.multippl(containerProduitsRecord.prixDemi!, FFAppState().qty), containerProduitsRecord.pourcentage!).toString()} FCFA';
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
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    );
                                                                                                  }),
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
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
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.97,
                                                              constraints:
                                                                  BoxConstraints(
                                                                maxWidth: 300.0,
                                                              ),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x00272B50),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          20.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          StreamBuilder<
                                                                              List<BanniereRecord>>(
                                                                            stream:
                                                                                queryBanniereRecord(
                                                                              queryBuilder: (banniereRecord) => banniereRecord.orderBy('priorite', descending: true),
                                                                              singleRecord: true,
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
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
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
                                                                            List<ProduitsRecord>>(
                                                                          stream:
                                                                              queryProduitsRecord(
                                                                            queryBuilder: (produitsRecord) =>
                                                                                produitsRecord.orderBy('vue', descending: true),
                                                                            limit:
                                                                                10,
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
                                                                            List<ProduitsRecord>
                                                                                columnProduitsRecordList =
                                                                                snapshot.data!;
                                                                            return SingleChildScrollView(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: List.generate(columnProduitsRecordList.length, (columnIndex) {
                                                                                  final columnProduitsRecord = columnProduitsRecordList[columnIndex];
                                                                                  return CardProWidget(
                                                                                    key: Key('Keyr1a_${columnIndex}_of_${columnProduitsRecordList.length}'),
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
        );
      },
    );
  }
}
