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
import 'restaurants_model.dart';
export 'restaurants_model.dart';

class RestaurantsWidget extends StatefulWidget {
  const RestaurantsWidget({Key? key}) : super(key: key);

  @override
  _RestaurantsWidgetState createState() => _RestaurantsWidgetState();
}

class _RestaurantsWidgetState extends State<RestaurantsWidget>
    with TickerProviderStateMixin {
  late RestaurantsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = {
    'circleImageOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      effects: [
        FadeEffect(
          curve: Curves.easeInOut,
          delay: 0.ms,
          duration: 600.ms,
          begin: 0.0,
          end: 1.0,
        ),
      ],
    ),
  };

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RestaurantsModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'restaurants'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!loggedIn) {
        context.goNamed('connexion');
      }
      if (valueOrDefault<bool>(currentUserDocument?.abonnLivraison, false) ==
          true) {
        if (functions.abo(
                currentUserDocument!.debutAbo!, getCurrentTimestamp) ==
            false) {
          final usersUpdateData = createUsersRecordData(
            abonnLivraison: false,
          );
          await currentUserReference!.update(usersUpdateData);
        }
      }
      if (FFAppState().isActive == true) {
        setDarkModeSetting(context, ThemeMode.light);
      } else {
        setDarkModeSetting(context, ThemeMode.dark);
      }

      FFAppState().update(() {
        FFAppState().prixDefaut = true;
        FFAppState().refFav = null;
      });
      FFAppState().update(() {
        FFAppState().qty = 1;
      });

      final lastConnexionHourUpdateData = createLastConnexionHourRecordData(
        last: getCurrentTimestamp,
      );
      await currentUserDocument!.last!.update(lastConnexionHourUpdateData);
    });

    _model.searchFieldController ??= TextEditingController();
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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: Stack(
          children: [
            if (responsiveVisibility(
              context: context,
              tabletLandscape: false,
              desktop: false,
            ))
              Container(
                width: MediaQuery.of(context).size.width * 1.0,
                height: MediaQuery.of(context).size.height * 1.0,
                decoration: BoxDecoration(
                  color: Color(0x00272B50),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 45.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  20.0, 0.0, 20.0, 0.0),
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
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          size: 20.0,
                                        ),
                                      ),
                                    );
                                  }
                                  final rowUsersRecord = snapshot.data!;
                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.7,
                                            decoration: BoxDecoration(
                                              color: Color(0x00FFFFFF),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  'Restaurants',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'sf pro text',
                                                        fontSize: 22.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-0.6, -0.5),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.12,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.12,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 15.0,
                                                color: Color(0x205A5A5A),
                                                spreadRadius: 3.0,
                                              )
                                            ],
                                            shape: BoxShape.circle,
                                          ),
                                          child: Container(
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.network(
                                              rowUsersRecord.photoUrl!,
                                              fit: BoxFit.fill,
                                            ),
                                          ).animateOnPageLoad(animationsMap[
                                              'circleImageOnPageLoadAnimation']!),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              20.0, 16.0, 20.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 4.0, 0.0, 0.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 40.0,
                                  constraints: BoxConstraints(
                                    maxWidth: 500.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    borderRadius: BorderRadius.circular(28.0),
                                  ),
                                  child: TextFormField(
                                    controller: _model.searchFieldController,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.searchFieldController',
                                      Duration(milliseconds: 200),
                                      () async {
                                        setState(() => _model
                                            .algoliaSearchResults1 = null);
                                        await RestaurantsRecord.search(
                                          term:
                                              _model.searchFieldController.text,
                                        )
                                            .then((r) => _model
                                                .algoliaSearchResults1 = r)
                                            .onError((_, __) => _model
                                                .algoliaSearchResults1 = [])
                                            .whenComplete(
                                                () => setState(() {}));
                                      },
                                    ),
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .bodyText2,
                                      hintText: 'Recherchez un restaurant ici',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Lexend Deca',
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            fontSize: 12.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(29.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(29.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(29.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 0.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(29.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      contentPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              14.0, 24.0, 14.0, 24.0),
                                      prefixIcon: Icon(
                                        FFIcons.ksearchFael,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                      suffixIcon: _model.searchFieldController!
                                              .text.isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model.searchFieldController
                                                    ?.clear();
                                                setState(() => _model
                                                        .algoliaSearchResults1 =
                                                    null);
                                                await RestaurantsRecord.search(
                                                  term: _model
                                                      .searchFieldController
                                                      .text,
                                                )
                                                    .then((r) => _model
                                                            .algoliaSearchResults1 =
                                                        r)
                                                    .onError((_, __) => _model
                                                            .algoliaSearchResults1 =
                                                        [])
                                                    .whenComplete(
                                                        () => setState(() {}));

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
                                    style:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    validator: _model
                                        .searchFieldControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                              if (_model.searchFieldController.text != null &&
                                  _model.searchFieldController.text != '')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 8.0, 0.0, 0.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              1.0,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              1.0,
                                          decoration: BoxDecoration(
                                            color: Color(0x00FFFFFF),
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                          ),
                                          child: FutureBuilder<
                                              List<RestaurantsRecord>>(
                                            future: RestaurantsRecord.search(
                                              term: _model
                                                  .searchFieldController.text,
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
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 20.0,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<RestaurantsRecord>
                                                  columnRestaurantsRecordList =
                                                  snapshot.data!;
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
                                                children: List.generate(
                                                    columnRestaurantsRecordList
                                                        .length, (columnIndex) {
                                                  final columnRestaurantsRecord =
                                                      columnRestaurantsRecordList[
                                                          columnIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 4.0,
                                                                0.0, 0.0),
                                                    child: Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              1.0,
                                                      height: 130.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 500.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: StreamBuilder<
                                                          RestaurantsRecord>(
                                                        stream: RestaurantsRecord
                                                            .getDocument(
                                                                columnRestaurantsRecord
                                                                    .reference),
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
                                                          final rowRestaurantsRecord =
                                                              snapshot.data!;
                                                          return InkWell(
                                                            onTap: () async {
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .prixDefaut =
                                                                    true;
                                                                FFAppState()
                                                                        .refFav =
                                                                    null;
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                    .qty = 1;
                                                              });

                                                              context.pushNamed(
                                                                'restauDetail',
                                                                queryParams: {
                                                                  'ref':
                                                                      serializeParam(
                                                                    rowRestaurantsRecord
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0),
                                                                  child: Image
                                                                      .network(
                                                                    rowRestaurantsRecord
                                                                        .img!,
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        100.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Container(
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height *
                                                                        1.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0x00FFFFFF),
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.5,
                                                                            height:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x00FFFFFF),
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 2,
                                                                                      child: Text(
                                                                                        rowRestaurantsRecord.nom!,
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
                                                                                          rowRestaurantsRecord.ouv,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        )} - ${dateTimeFormat(
                                                                                          'Hm',
                                                                                          rowRestaurantsRecord.clo,
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
                                                                                          rowRestaurantsRecord.zone!,
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
                        StreamBuilder<List<CatRecord>>(
                          stream: queryCatRecord(
                            queryBuilder: (catRecord) => catRecord.where('nom',
                                isNotEqualTo: 'ravitaillement'),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 20.0,
                                  height: 20.0,
                                  child: SpinKitPulse(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    size: 20.0,
                                  ),
                                ),
                              );
                            }
                            List<CatRecord> containerCatRecordList =
                                snapshot.data!;
                            return Container(
                              decoration: BoxDecoration(),
                            );
                          },
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 100.0),
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
                                      color: FlutterFlowTheme.of(context)
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
                                  containerRestaurantsRecordList.isNotEmpty
                                      ? containerRestaurantsRecordList.first
                                      : null;
                              return Container(
                                decoration: BoxDecoration(),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 16.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 0.0, 20.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Les meilleurs restaurants',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'sf pro text',
                                                        fontSize: 16.0,
                                                        useGoogleFonts: false,
                                                      ),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                context
                                                    .pushNamed('pourVousresto');
                                              },
                                              child: Text(
                                                'Voir plus',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'sf pro text',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      useGoogleFonts: false,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20.0, 16.0, 0.0, 0.0),
                                        child: StreamBuilder<
                                            List<RestaurantsRecord>>(
                                          stream: queryRestaurantsRecord(
                                            queryBuilder: (restaurantsRecord) =>
                                                restaurantsRecord.orderBy(
                                                    'prio',
                                                    descending: true),
                                            limit: 50,
                                          ),
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
                                            List<RestaurantsRecord>
                                                rowRestaurantsRecordList =
                                                snapshot.data!;
                                            return SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    rowRestaurantsRecordList
                                                        .length, (rowIndex) {
                                                  final rowRestaurantsRecord =
                                                      rowRestaurantsRecordList[
                                                          rowIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                12.0, 0.0),
                                                    child: StreamBuilder<
                                                        RestaurantsRecord>(
                                                      stream: RestaurantsRecord
                                                          .getDocument(
                                                              rowRestaurantsRecord
                                                                  .reference),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
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
                                                        final containerRestaurantsRecord =
                                                            snapshot.data!;
                                                        return Container(
                                                          width: 230.0,
                                                          height: 320.0,
                                                          constraints:
                                                              BoxConstraints(
                                                            maxWidth: 400.0,
                                                            maxHeight: 320.0,
                                                          ),
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15.0),
                                                          ),
                                                          child: InkWell(
                                                            onTap: () async {
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                        .complet =
                                                                    false;
                                                                FFAppState()
                                                                        .refFav =
                                                                    null;
                                                              });
                                                              FFAppState()
                                                                  .update(() {
                                                                FFAppState()
                                                                    .qty = 1;
                                                              });

                                                              context.pushNamed(
                                                                'restauDetail',
                                                                queryParams: {
                                                                  'ref':
                                                                      serializeParam(
                                                                    containerRestaurantsRecord
                                                                        .reference,
                                                                    ParamType
                                                                        .DocumentReference,
                                                                  ),
                                                                }.withoutNulls,
                                                              );
                                                            },
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: 170.0,
                                                                  constraints:
                                                                      BoxConstraints(
                                                                    maxHeight:
                                                                        170.0,
                                                                  ),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    image:
                                                                        DecorationImage(
                                                                      fit: BoxFit
                                                                          .fitHeight,
                                                                      image: Image
                                                                          .network(
                                                                        rowRestaurantsRecord
                                                                            .img!,
                                                                      ).image,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              0.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              15.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              15.0),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Color(0x00FFFFFF),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 9.0, 0.0),
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
                                                                                          rowRestaurantsRecord.nom!,
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
                                                                                    children: [
                                                                                      Expanded(
                                                                                        flex: 2,
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                          child: Text(
                                                                                            rowRestaurantsRecord.zone!,
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
                                                                                    ],
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
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          9.0,
                                                                          0.0,
                                                                          9.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        '${dateTimeFormat(
                                                                          'Hm',
                                                                          rowRestaurantsRecord
                                                                              .ouv,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )} - ${dateTimeFormat(
                                                                          'Hm',
                                                                          rowRestaurantsRecord
                                                                              .clo,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        )}',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'sf pro text',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 12.0,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          9.0,
                                                                          10.0,
                                                                          9.0,
                                                                          9.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      RatingBarIndicator(
                                                                        itemBuilder:
                                                                            (context, index) =>
                                                                                Icon(
                                                                          Icons
                                                                              .star_rounded,
                                                                          color:
                                                                              Color(0xFFFFCC53),
                                                                        ),
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        rating: functions.rate(
                                                                            rowRestaurantsRecord.ratelist!.toList(),
                                                                            rowRestaurantsRecord.ratelist!.toList().length),
                                                                        unratedColor:
                                                                            Color(0xFF9E9E9E),
                                                                        itemCount:
                                                                            5,
                                                                        itemSize:
                                                                            18.0,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 16.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0, 0.0,
                                                                20.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Les mieux notés',
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
                                                                'restaurantsmieuxNote');
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
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(20.0,
                                                                16.0, 0.0, 0.0),
                                                    child: StreamBuilder<
                                                        List<
                                                            RestaurantsRecord>>(
                                                      stream:
                                                          queryRestaurantsRecord(
                                                        queryBuilder:
                                                            (restaurantsRecord) =>
                                                                restaurantsRecord
                                                                    .orderBy(
                                                                        'note',
                                                                        descending:
                                                                            true),
                                                        limit: 50,
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
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
                                                        List<RestaurantsRecord>
                                                            rowRestaurantsRecordList =
                                                            snapshot.data!;
                                                        return SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: List.generate(
                                                                rowRestaurantsRecordList
                                                                    .length,
                                                                (rowIndex) {
                                                              final rowRestaurantsRecord =
                                                                  rowRestaurantsRecordList[
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
                                                                    RestaurantsRecord>(
                                                                  stream: RestaurantsRecord
                                                                      .getDocument(
                                                                          rowRestaurantsRecord
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
                                                                    final containerRestaurantsRecord =
                                                                        snapshot
                                                                            .data!;
                                                                    return Container(
                                                                      width:
                                                                          230.0,
                                                                      height:
                                                                          320.0,
                                                                      constraints:
                                                                          BoxConstraints(
                                                                        maxWidth:
                                                                            400.0,
                                                                        maxHeight:
                                                                            320.0,
                                                                      ),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(15.0),
                                                                      ),
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

                                                                          context
                                                                              .pushNamed(
                                                                            'restauDetail',
                                                                            queryParams:
                                                                                {
                                                                              'ref': serializeParam(
                                                                                containerRestaurantsRecord.reference,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
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
                                                                                    rowRestaurantsRecord.img!,
                                                                                  ).image,
                                                                                ),
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(0.0),
                                                                                  bottomRight: Radius.circular(0.0),
                                                                                  topLeft: Radius.circular(15.0),
                                                                                  topRight: Radius.circular(15.0),
                                                                                ),
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
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 9.0, 0.0),
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
                                                                                                      rowRestaurantsRecord.nom!,
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
                                                                                                children: [
                                                                                                  Expanded(
                                                                                                    flex: 2,
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                      child: Text(
                                                                                                        rowRestaurantsRecord.zone!,
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
                                                                                                ],
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
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 9.0, 0.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    '${dateTimeFormat(
                                                                                      'Hm',
                                                                                      rowRestaurantsRecord.ouv,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    )} - ${dateTimeFormat(
                                                                                      'Hm',
                                                                                      rowRestaurantsRecord.clo,
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
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(9.0, 10.0, 9.0, 9.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  RatingBarIndicator(
                                                                                    itemBuilder: (context, index) => Icon(
                                                                                      Icons.star_rounded,
                                                                                      color: Color(0xFFFFCC53),
                                                                                    ),
                                                                                    direction: Axis.horizontal,
                                                                                    rating: functions.rate(rowRestaurantsRecord.ratelist!.toList(), rowRestaurantsRecord.ratelist!.toList().length),
                                                                                    unratedColor: Color(0xFF9E9E9E),
                                                                                    itemCount: 5,
                                                                                    itemSize: 18.0,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
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
                                                      queryBuilder:
                                                          (restaurantsRecord) =>
                                                              restaurantsRecord
                                                                  .where('zone',
                                                                      isEqualTo:
                                                                          'cotonou'),
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
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
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
                                                                      'Cotonou',
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
                                                                          'zone',
                                                                          queryParams:
                                                                              {
                                                                            'zone':
                                                                                serializeParam(
                                                                              'cotonou',
                                                                              ParamType.String,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        'Voir plus',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
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
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        16.0,
                                                                        0.0,
                                                                        0.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        RestaurantsRecord>>(
                                                                  stream:
                                                                      queryRestaurantsRecord(
                                                                    queryBuilder: (restaurantsRecord) => restaurantsRecord.where(
                                                                        'zone',
                                                                        isEqualTo:
                                                                            'cotonou'),
                                                                    limit: 50,
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
                                                                    List<RestaurantsRecord>
                                                                        rowRestaurantsRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    return SingleChildScrollView(
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: List.generate(
                                                                            rowRestaurantsRecordList.length,
                                                                            (rowIndex) {
                                                                          final rowRestaurantsRecord =
                                                                              rowRestaurantsRecordList[rowIndex];
                                                                          return Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                12.0,
                                                                                0.0),
                                                                            child:
                                                                                StreamBuilder<RestaurantsRecord>(
                                                                              stream: RestaurantsRecord.getDocument(rowRestaurantsRecord.reference),
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
                                                                                final containerRestaurantsRecord = snapshot.data!;
                                                                                return Container(
                                                                                  width: 230.0,
                                                                                  height: 320.0,
                                                                                  constraints: BoxConstraints(
                                                                                    maxWidth: 400.0,
                                                                                    maxHeight: 320.0,
                                                                                  ),
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    borderRadius: BorderRadius.circular(15.0),
                                                                                  ),
                                                                                  child: InkWell(
                                                                                    onTap: () async {
                                                                                      FFAppState().update(() {
                                                                                        FFAppState().complet = false;
                                                                                        FFAppState().refFav = null;
                                                                                      });
                                                                                      FFAppState().update(() {
                                                                                        FFAppState().qty = 1;
                                                                                      });

                                                                                      context.pushNamed(
                                                                                        'restauDetail',
                                                                                        queryParams: {
                                                                                          'ref': serializeParam(
                                                                                            containerRestaurantsRecord.reference,
                                                                                            ParamType.DocumentReference,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    },
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
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
                                                                                                rowRestaurantsRecord.img!,
                                                                                              ).image,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.only(
                                                                                              bottomLeft: Radius.circular(0.0),
                                                                                              bottomRight: Radius.circular(0.0),
                                                                                              topLeft: Radius.circular(15.0),
                                                                                              topRight: Radius.circular(15.0),
                                                                                            ),
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
                                                                                                    child: Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 9.0, 0.0),
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
                                                                                                                  rowRestaurantsRecord.nom!,
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
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                flex: 2,
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                                  child: Text(
                                                                                                                    rowRestaurantsRecord.zone!,
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
                                                                                                            ],
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
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 9.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                '${dateTimeFormat(
                                                                                                  'Hm',
                                                                                                  rowRestaurantsRecord.ouv,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                )} - ${dateTimeFormat(
                                                                                                  'Hm',
                                                                                                  rowRestaurantsRecord.clo,
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
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(9.0, 10.0, 9.0, 9.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              RatingBarIndicator(
                                                                                                itemBuilder: (context, index) => Icon(
                                                                                                  Icons.star_rounded,
                                                                                                  color: Color(0xFFFFCC53),
                                                                                                ),
                                                                                                direction: Axis.horizontal,
                                                                                                rating: functions.rate(rowRestaurantsRecord.ratelist!.toList(), rowRestaurantsRecord.ratelist!.toList().length),
                                                                                                unratedColor: Color(0xFF9E9E9E),
                                                                                                itemCount: 5,
                                                                                                itemSize: 18.0,
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
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
                                                                  List<
                                                                      RestaurantsRecord>>(
                                                                stream:
                                                                    queryRestaurantsRecord(
                                                                  queryBuilder: (restaurantsRecord) =>
                                                                      restaurantsRecord.where(
                                                                          'zone',
                                                                          isEqualTo:
                                                                              'akpakpa'),
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
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
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
                                                                  final containerRestaurantsRecord = containerRestaurantsRecordList
                                                                          .isNotEmpty
                                                                      ? containerRestaurantsRecordList
                                                                          .first
                                                                      : null;
                                                                  return Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          16.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                20.0,
                                                                                0.0,
                                                                                20.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  'Akpakpa',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'sf pro text',
                                                                                        fontSize: 16.0,
                                                                                        useGoogleFonts: false,
                                                                                      ),
                                                                                ),
                                                                                InkWell(
                                                                                  onTap: () async {
                                                                                    context.pushNamed(
                                                                                      'zone',
                                                                                      queryParams: {
                                                                                        'zone': serializeParam(
                                                                                          'akpakpa',
                                                                                          ParamType.String,
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
                                                                            child:
                                                                                StreamBuilder<List<RestaurantsRecord>>(
                                                                              stream: queryRestaurantsRecord(
                                                                                queryBuilder: (restaurantsRecord) => restaurantsRecord.where('zone', isEqualTo: 'akpakpa'),
                                                                                limit: 50,
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
                                                                                List<RestaurantsRecord> rowRestaurantsRecordList = snapshot.data!;
                                                                                return SingleChildScrollView(
                                                                                  scrollDirection: Axis.horizontal,
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: List.generate(rowRestaurantsRecordList.length, (rowIndex) {
                                                                                      final rowRestaurantsRecord = rowRestaurantsRecordList[rowIndex];
                                                                                      return Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                        child: StreamBuilder<RestaurantsRecord>(
                                                                                          stream: RestaurantsRecord.getDocument(rowRestaurantsRecord.reference),
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
                                                                                            final containerRestaurantsRecord = snapshot.data!;
                                                                                            return Container(
                                                                                              width: 230.0,
                                                                                              height: 320.0,
                                                                                              constraints: BoxConstraints(
                                                                                                maxWidth: 400.0,
                                                                                                maxHeight: 320.0,
                                                                                              ),
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                borderRadius: BorderRadius.circular(15.0),
                                                                                              ),
                                                                                              child: InkWell(
                                                                                                onTap: () async {
                                                                                                  FFAppState().update(() {
                                                                                                    FFAppState().complet = false;
                                                                                                    FFAppState().refFav = null;
                                                                                                  });
                                                                                                  FFAppState().update(() {
                                                                                                    FFAppState().qty = 1;
                                                                                                  });

                                                                                                  context.pushNamed(
                                                                                                    'restauDetail',
                                                                                                    queryParams: {
                                                                                                      'ref': serializeParam(
                                                                                                        containerRestaurantsRecord.reference,
                                                                                                        ParamType.DocumentReference,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                  );
                                                                                                },
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
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
                                                                                                            rowRestaurantsRecord.img!,
                                                                                                          ).image,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.only(
                                                                                                          bottomLeft: Radius.circular(0.0),
                                                                                                          bottomRight: Radius.circular(0.0),
                                                                                                          topLeft: Radius.circular(15.0),
                                                                                                          topRight: Radius.circular(15.0),
                                                                                                        ),
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
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 9.0, 0.0),
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
                                                                                                                              rowRestaurantsRecord.nom!,
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
                                                                                                                        children: [
                                                                                                                          Expanded(
                                                                                                                            flex: 2,
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                                              child: Text(
                                                                                                                                rowRestaurantsRecord.zone!,
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
                                                                                                                        ],
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
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 9.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            '${dateTimeFormat(
                                                                                                              'Hm',
                                                                                                              rowRestaurantsRecord.ouv,
                                                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                                                            )} - ${dateTimeFormat(
                                                                                                              'Hm',
                                                                                                              rowRestaurantsRecord.clo,
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
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(9.0, 10.0, 9.0, 9.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          RatingBarIndicator(
                                                                                                            itemBuilder: (context, index) => Icon(
                                                                                                              Icons.star_rounded,
                                                                                                              color: Color(0xFFFFCC53),
                                                                                                            ),
                                                                                                            direction: Axis.horizontal,
                                                                                                            rating: functions.rate(rowRestaurantsRecord.ratelist!.toList(), rowRestaurantsRecord.ratelist!.toList().length),
                                                                                                            unratedColor: Color(0xFF9E9E9E),
                                                                                                            itemCount: 5,
                                                                                                            itemSize: 18.0,
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
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
                                                                              queryBuilder: (restaurantsRecord) => restaurantsRecord.where('zone', isEqualTo: 'calavi'),
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
                                                                              List<RestaurantsRecord> containerRestaurantsRecordList = snapshot.data!;
                                                                              // Return an empty Container when the item does not exist.
                                                                              if (snapshot.data!.isEmpty) {
                                                                                return Container();
                                                                              }
                                                                              final containerRestaurantsRecord = containerRestaurantsRecordList.isNotEmpty ? containerRestaurantsRecordList.first : null;
                                                                              return Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 120.0),
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
                                                                                              'Calavi',
                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                    fontFamily: 'sf pro text',
                                                                                                    fontSize: 16.0,
                                                                                                    useGoogleFonts: false,
                                                                                                  ),
                                                                                            ),
                                                                                            InkWell(
                                                                                              onTap: () async {
                                                                                                context.pushNamed(
                                                                                                  'zone',
                                                                                                  queryParams: {
                                                                                                    'zone': serializeParam(
                                                                                                      'ccalavi',
                                                                                                      ParamType.String,
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
                                                                                        child: StreamBuilder<List<RestaurantsRecord>>(
                                                                                          stream: queryRestaurantsRecord(
                                                                                            queryBuilder: (restaurantsRecord) => restaurantsRecord.where('zone', isEqualTo: 'calavi'),
                                                                                            limit: 50,
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
                                                                                            List<RestaurantsRecord> rowRestaurantsRecordList = snapshot.data!;
                                                                                            return SingleChildScrollView(
                                                                                              scrollDirection: Axis.horizontal,
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: List.generate(rowRestaurantsRecordList.length, (rowIndex) {
                                                                                                  final rowRestaurantsRecord = rowRestaurantsRecordList[rowIndex];
                                                                                                  return Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                    child: StreamBuilder<RestaurantsRecord>(
                                                                                                      stream: RestaurantsRecord.getDocument(rowRestaurantsRecord.reference),
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
                                                                                                        final containerRestaurantsRecord = snapshot.data!;
                                                                                                        return Container(
                                                                                                          width: 230.0,
                                                                                                          height: 320.0,
                                                                                                          constraints: BoxConstraints(
                                                                                                            maxWidth: 400.0,
                                                                                                            maxHeight: 320.0,
                                                                                                          ),
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                            borderRadius: BorderRadius.circular(15.0),
                                                                                                          ),
                                                                                                          child: InkWell(
                                                                                                            onTap: () async {
                                                                                                              FFAppState().update(() {
                                                                                                                FFAppState().complet = false;
                                                                                                                FFAppState().refFav = null;
                                                                                                              });
                                                                                                              FFAppState().update(() {
                                                                                                                FFAppState().qty = 1;
                                                                                                              });

                                                                                                              context.pushNamed(
                                                                                                                'restauDetail',
                                                                                                                queryParams: {
                                                                                                                  'ref': serializeParam(
                                                                                                                    containerRestaurantsRecord.reference,
                                                                                                                    ParamType.DocumentReference,
                                                                                                                  ),
                                                                                                                }.withoutNulls,
                                                                                                              );
                                                                                                            },
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
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
                                                                                                                        rowRestaurantsRecord.img!,
                                                                                                                      ).image,
                                                                                                                    ),
                                                                                                                    borderRadius: BorderRadius.only(
                                                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                                                      bottomRight: Radius.circular(0.0),
                                                                                                                      topLeft: Radius.circular(15.0),
                                                                                                                      topRight: Radius.circular(15.0),
                                                                                                                    ),
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
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 9.0, 0.0),
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
                                                                                                                                          rowRestaurantsRecord.nom!,
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
                                                                                                                                    children: [
                                                                                                                                      Expanded(
                                                                                                                                        flex: 2,
                                                                                                                                        child: Padding(
                                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                                                          child: Text(
                                                                                                                                            rowRestaurantsRecord.zone!,
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
                                                                                                                                    ],
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
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 9.0, 0.0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Text(
                                                                                                                        '${dateTimeFormat(
                                                                                                                          'Hm',
                                                                                                                          rowRestaurantsRecord.ouv,
                                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                                        )} - ${dateTimeFormat(
                                                                                                                          'Hm',
                                                                                                                          rowRestaurantsRecord.clo,
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
                                                                                                                ),
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(9.0, 10.0, 9.0, 9.0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    children: [
                                                                                                                      RatingBarIndicator(
                                                                                                                        itemBuilder: (context, index) => Icon(
                                                                                                                          Icons.star_rounded,
                                                                                                                          color: Color(0xFFFFCC53),
                                                                                                                        ),
                                                                                                                        direction: Axis.horizontal,
                                                                                                                        rating: functions.rate(rowRestaurantsRecord.ratelist!.toList(), rowRestaurantsRecord.ratelist!.toList().length),
                                                                                                                        unratedColor: Color(0xFF9E9E9E),
                                                                                                                        itemCount: 5,
                                                                                                                        itemSize: 18.0,
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
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
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
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
                                width: MediaQuery.of(context).size.width * 0.19,
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
                                                      MainAxisAlignment.center,
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
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 1,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'sf pro text',
                                                                fontSize: 12.0,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 50.0, 0.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 15.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
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
                                                                borderColor: Colors
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
                                                                  size: 15.0,
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
                                                                      InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          context
                                                                              .pushNamed('Accueil');
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          'Accueil',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
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
                                                mainAxisSize: MainAxisSize.max,
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
                                                          color:
                                                              Color(0x00FC6A57),
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
                                                                borderColor: Colors
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
                                                                      InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          context
                                                                              .pushNamed('favoris');
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          'Favoris',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
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
                                                mainAxisSize: MainAxisSize.max,
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
                                                          color:
                                                              Color(0x00FC6A57),
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
                                                                borderColor: Colors
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
                                                                      InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          context
                                                                              .pushNamed('category');
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          'Catégories',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
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
                                                mainAxisSize: MainAxisSize.max,
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
                                                          color:
                                                              Color(0x00FC6A57),
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
                                                                borderColor: Colors
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
                                                                      InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          context
                                                                              .pushNamed('cart2');
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          'Commandes',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
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
                                                mainAxisSize: MainAxisSize.max,
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
                                                          color:
                                                              Color(0x00FC6A57),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
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
                                                                borderColor: Colors
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
                                                                  size: 15.0,
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
                                                                      InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          context
                                                                              .pushNamed('user');
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          'Profil',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
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
                                                mainAxisSize: MainAxisSize.max,
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
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    50.0,
                                                                borderWidth:
                                                                    1.0,
                                                                buttonSize:
                                                                    30.0,
                                                                fillColor: Color(
                                                                    0xFFCC4433),
                                                                icon: Icon(
                                                                  FFIcons
                                                                      .kfiRrShop,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 15.0,
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
                                                                      InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          context
                                                                              .pushNamed('restaurants');
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          'Restaurants',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
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
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.phone,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 20.0,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(5.0, 0.0,
                                                                0.0, 0.0),
                                                    child: StreamBuilder<
                                                        List<RideRecord>>(
                                                      stream: queryRideRecord(
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
                                                        if (snapshot
                                                            .data!.isEmpty) {
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
                                                                fontSize: 13.0,
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
                                      MediaQuery.of(context).size.height * 1.0,
                                  decoration: BoxDecoration(
                                    color: Color(0x00272B50),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                    .fromSTEB(
                                                        20.0, 16.0, 20.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
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
                                                          color:
                                                              Color(0x00272B50),
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
                                                                  _model.algoliaSearchResults2 =
                                                                      null);
                                                              await RestaurantsRecord
                                                                      .search(
                                                                term: _model
                                                                    .searchField232Controller
                                                                    .text,
                                                              )
                                                                  .then((r) =>
                                                                      _model.algoliaSearchResults2 =
                                                                          r)
                                                                  .onError((_,
                                                                          __) =>
                                                                      _model.algoliaSearchResults2 =
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
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
                                                                          _model.algoliaSearchResults2 =
                                                                              null);
                                                                      await RestaurantsRecord
                                                                              .search(
                                                                        term: _model
                                                                            .searchField232Controller
                                                                            .text,
                                                                      )
                                                                          .then((r) => _model.algoliaSearchResults2 =
                                                                              r)
                                                                          .onError((_, __) => _model.algoliaSearchResults2 =
                                                                              [])
                                                                          .whenComplete(() =>
                                                                              setState(() {}));

                                                                      setState(
                                                                          () {});
                                                                    },
                                                                    child: Icon(
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
                                                                      BorderRadius
                                                                          .circular(
                                                                              15.0),
                                                                ),
                                                                child: FutureBuilder<
                                                                    List<
                                                                        RestaurantsRecord>>(
                                                                  future:
                                                                      RestaurantsRecord
                                                                          .search(
                                                                    term: _model
                                                                        .searchField232Controller
                                                                        .text,
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
                                                                    List<RestaurantsRecord>
                                                                        columnRestaurantsRecordList =
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
                                                                          MainAxisSize
                                                                              .max,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: List.generate(
                                                                          columnRestaurantsRecordList
                                                                              .length,
                                                                          (columnIndex) {
                                                                        final columnRestaurantsRecord =
                                                                            columnRestaurantsRecordList[columnIndex];
                                                                        return Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              4.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 1.0,
                                                                            height:
                                                                                130.0,
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxWidth: 500.0,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                            ),
                                                                            child:
                                                                                StreamBuilder<RestaurantsRecord>(
                                                                              stream: RestaurantsRecord.getDocument(columnRestaurantsRecord.reference),
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
                                                                                final rowRestaurantsRecord = snapshot.data!;
                                                                                return InkWell(
                                                                                  onTap: () async {
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().prixDefaut = true;
                                                                                      FFAppState().refFav = null;
                                                                                    });
                                                                                    FFAppState().update(() {
                                                                                      FFAppState().qty = 1;
                                                                                    });

                                                                                    context.pushNamed(
                                                                                      'restauDetail',
                                                                                      queryParams: {
                                                                                        'ref': serializeParam(
                                                                                          rowRestaurantsRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                        child: Image.network(
                                                                                          rowRestaurantsRecord.img!,
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
                                                                                                              rowRestaurantsRecord.nom!,
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
                                                                                                                rowRestaurantsRecord.ouv,
                                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                                              )} - ${dateTimeFormat(
                                                                                                                'Hm',
                                                                                                                rowRestaurantsRecord.clo,
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
                                                                                                                rowRestaurantsRecord.zone!,
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
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(10.0, 0.0,
                                                                10.0, 0.0),
                                                    child: Container(
                                                      height: 40.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 140.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary400,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50.0),
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
                                                              MainAxisSize.max,
                                                          children: [
                                                            FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius:
                                                                  50.0,
                                                              borderWidth: 1.0,
                                                              buttonSize: 40.0,
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
                                                                padding:
                                                                    EdgeInsetsDirectional
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
                                                                          GoRouter.of(context)
                                                                              .prepareAuthEvent();
                                                                          await signOut();
                                                                          GoRouter.of(context)
                                                                              .clearRedirectLocation();

                                                                          context.goNamedAuth(
                                                                              'Onboarding1',
                                                                              mounted);
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          'Déconnexion',
                                                                          textAlign:
                                                                              TextAlign.start,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
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
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 40.0, 0.0, 0.0),
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
                                                          color:
                                                              Color(0x00272B50),
                                                        ),
                                                        child: StreamBuilder<
                                                            List<
                                                                RestaurantsRecord>>(
                                                          stream:
                                                              queryRestaurantsRecord(
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
                                                            List<RestaurantsRecord>
                                                                containerRestaurantsRecordList =
                                                                snapshot.data!;
                                                            // Return an empty Container when the item does not exist.
                                                            if (snapshot.data!
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
                                                                            'Les meilleurs restaurants',
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'sf pro text',
                                                                                  fontSize: 16.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                          ),
                                                                          InkWell(
                                                                            onTap:
                                                                                () async {
                                                                              context.pushNamed('pourVousresto');
                                                                            },
                                                                            child:
                                                                                Text(
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
                                                                          List<
                                                                              RestaurantsRecord>>(
                                                                        stream:
                                                                            queryRestaurantsRecord(
                                                                          queryBuilder: (restaurantsRecord) => restaurantsRecord.orderBy(
                                                                              'prio',
                                                                              descending: true),
                                                                          limit:
                                                                              50,
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
                                                                          List<RestaurantsRecord>
                                                                              rowRestaurantsRecordList =
                                                                              snapshot.data!;
                                                                          return SingleChildScrollView(
                                                                            scrollDirection:
                                                                                Axis.horizontal,
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: List.generate(rowRestaurantsRecordList.length, (rowIndex) {
                                                                                final rowRestaurantsRecord = rowRestaurantsRecordList[rowIndex];
                                                                                return Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                  child: StreamBuilder<RestaurantsRecord>(
                                                                                    stream: RestaurantsRecord.getDocument(rowRestaurantsRecord.reference),
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
                                                                                      final containerRestaurantsRecord = snapshot.data!;
                                                                                      return Container(
                                                                                        width: 230.0,
                                                                                        height: 320.0,
                                                                                        constraints: BoxConstraints(
                                                                                          maxWidth: 400.0,
                                                                                          maxHeight: 320.0,
                                                                                        ),
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                        ),
                                                                                        child: InkWell(
                                                                                          onTap: () async {
                                                                                            FFAppState().update(() {
                                                                                              FFAppState().complet = false;
                                                                                              FFAppState().refFav = null;
                                                                                            });
                                                                                            FFAppState().update(() {
                                                                                              FFAppState().qty = 1;
                                                                                            });

                                                                                            context.pushNamed(
                                                                                              'restauDetail',
                                                                                              queryParams: {
                                                                                                'ref': serializeParam(
                                                                                                  containerRestaurantsRecord.reference,
                                                                                                  ParamType.DocumentReference,
                                                                                                ),
                                                                                              }.withoutNulls,
                                                                                            );
                                                                                          },
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
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
                                                                                                      rowRestaurantsRecord.img!,
                                                                                                    ).image,
                                                                                                  ),
                                                                                                  borderRadius: BorderRadius.only(
                                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                                    bottomRight: Radius.circular(0.0),
                                                                                                    topLeft: Radius.circular(15.0),
                                                                                                    topRight: Radius.circular(15.0),
                                                                                                  ),
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
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 9.0, 0.0),
                                                                                                            child: Column(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      flex: 2,
                                                                                                                      child: Text(
                                                                                                                        rowRestaurantsRecord.nom!,
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
                                                                                                                  children: [
                                                                                                                    Expanded(
                                                                                                                      flex: 2,
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                                        child: Text(
                                                                                                                          rowRestaurantsRecord.zone!,
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
                                                                                                                  ],
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
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 9.0, 0.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      '${dateTimeFormat(
                                                                                                        'Hm',
                                                                                                        rowRestaurantsRecord.ouv,
                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                      )} - ${dateTimeFormat(
                                                                                                        'Hm',
                                                                                                        rowRestaurantsRecord.clo,
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
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(9.0, 10.0, 9.0, 9.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: [
                                                                                                    RatingBarIndicator(
                                                                                                      itemBuilder: (context, index) => Icon(
                                                                                                        Icons.star_rounded,
                                                                                                        color: Color(0xFFFFCC53),
                                                                                                      ),
                                                                                                      direction: Axis.horizontal,
                                                                                                      rating: functions.rate(rowRestaurantsRecord.ratelist!.toList(), rowRestaurantsRecord.ratelist!.toList().length),
                                                                                                      unratedColor: Color(0xFF9E9E9E),
                                                                                                      itemCount: 5,
                                                                                                      itemSize: 18.0,
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ],
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
                                                                        List<
                                                                            RestaurantsRecord>>(
                                                                      stream:
                                                                          queryRestaurantsRecord(
                                                                        singleRecord:
                                                                            true,
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
                                                                        List<RestaurantsRecord>
                                                                            containerRestaurantsRecordList =
                                                                            snapshot.data!;
                                                                        // Return an empty Container when the item does not exist.
                                                                        if (snapshot
                                                                            .data!
                                                                            .isEmpty) {
                                                                          return Container();
                                                                        }
                                                                        final containerRestaurantsRecord = containerRestaurantsRecordList.isNotEmpty
                                                                            ? containerRestaurantsRecordList.first
                                                                            : null;
                                                                        return Container(
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                16.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    children: [
                                                                                      Text(
                                                                                        'Les mieux notés',
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'sf pro text',
                                                                                              fontSize: 16.0,
                                                                                              useGoogleFonts: false,
                                                                                            ),
                                                                                      ),
                                                                                      InkWell(
                                                                                        onTap: () async {
                                                                                          context.pushNamed('restaurantsmieuxNote');
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
                                                                                  child: StreamBuilder<List<RestaurantsRecord>>(
                                                                                    stream: queryRestaurantsRecord(
                                                                                      queryBuilder: (restaurantsRecord) => restaurantsRecord.orderBy('note', descending: true),
                                                                                      limit: 50,
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
                                                                                      List<RestaurantsRecord> rowRestaurantsRecordList = snapshot.data!;
                                                                                      return SingleChildScrollView(
                                                                                        scrollDirection: Axis.horizontal,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: List.generate(rowRestaurantsRecordList.length, (rowIndex) {
                                                                                            final rowRestaurantsRecord = rowRestaurantsRecordList[rowIndex];
                                                                                            return Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                              child: StreamBuilder<RestaurantsRecord>(
                                                                                                stream: RestaurantsRecord.getDocument(rowRestaurantsRecord.reference),
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
                                                                                                  final containerRestaurantsRecord = snapshot.data!;
                                                                                                  return Container(
                                                                                                    width: 230.0,
                                                                                                    height: 320.0,
                                                                                                    constraints: BoxConstraints(
                                                                                                      maxWidth: 400.0,
                                                                                                      maxHeight: 320.0,
                                                                                                    ),
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      borderRadius: BorderRadius.circular(15.0),
                                                                                                    ),
                                                                                                    child: InkWell(
                                                                                                      onTap: () async {
                                                                                                        FFAppState().update(() {
                                                                                                          FFAppState().complet = false;
                                                                                                          FFAppState().refFav = null;
                                                                                                        });
                                                                                                        FFAppState().update(() {
                                                                                                          FFAppState().qty = 1;
                                                                                                        });

                                                                                                        context.pushNamed(
                                                                                                          'restauDetail',
                                                                                                          queryParams: {
                                                                                                            'ref': serializeParam(
                                                                                                              containerRestaurantsRecord.reference,
                                                                                                              ParamType.DocumentReference,
                                                                                                            ),
                                                                                                          }.withoutNulls,
                                                                                                        );
                                                                                                      },
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
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
                                                                                                                  rowRestaurantsRecord.img!,
                                                                                                                ).image,
                                                                                                              ),
                                                                                                              borderRadius: BorderRadius.only(
                                                                                                                bottomLeft: Radius.circular(0.0),
                                                                                                                bottomRight: Radius.circular(0.0),
                                                                                                                topLeft: Radius.circular(15.0),
                                                                                                                topRight: Radius.circular(15.0),
                                                                                                              ),
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
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 9.0, 0.0),
                                                                                                                        child: Column(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              children: [
                                                                                                                                Expanded(
                                                                                                                                  flex: 2,
                                                                                                                                  child: Text(
                                                                                                                                    rowRestaurantsRecord.nom!,
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
                                                                                                                              children: [
                                                                                                                                Expanded(
                                                                                                                                  flex: 2,
                                                                                                                                  child: Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                                                    child: Text(
                                                                                                                                      rowRestaurantsRecord.zone!,
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
                                                                                                                              ],
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
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 9.0, 0.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Text(
                                                                                                                  '${dateTimeFormat(
                                                                                                                    'Hm',
                                                                                                                    rowRestaurantsRecord.ouv,
                                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                                  )} - ${dateTimeFormat(
                                                                                                                    'Hm',
                                                                                                                    rowRestaurantsRecord.clo,
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
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(9.0, 10.0, 9.0, 9.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                RatingBarIndicator(
                                                                                                                  itemBuilder: (context, index) => Icon(
                                                                                                                    Icons.star_rounded,
                                                                                                                    color: Color(0xFFFFCC53),
                                                                                                                  ),
                                                                                                                  direction: Axis.horizontal,
                                                                                                                  rating: functions.rate(rowRestaurantsRecord.ratelist!.toList(), rowRestaurantsRecord.ratelist!.toList().length),
                                                                                                                  unratedColor: Color(0xFF9E9E9E),
                                                                                                                  itemCount: 5,
                                                                                                                  itemSize: 18.0,
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
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
                                                                                    queryBuilder: (restaurantsRecord) => restaurantsRecord.where('zone', isEqualTo: 'cotonou'),
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
                                                                                                    'Cotonou',
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'sf pro text',
                                                                                                          fontSize: 16.0,
                                                                                                          useGoogleFonts: false,
                                                                                                        ),
                                                                                                  ),
                                                                                                  InkWell(
                                                                                                    onTap: () async {
                                                                                                      context.pushNamed(
                                                                                                        'zone',
                                                                                                        queryParams: {
                                                                                                          'zone': serializeParam(
                                                                                                            'cotonou',
                                                                                                            ParamType.String,
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
                                                                                              child: StreamBuilder<List<RestaurantsRecord>>(
                                                                                                stream: queryRestaurantsRecord(
                                                                                                  queryBuilder: (restaurantsRecord) => restaurantsRecord.where('zone', isEqualTo: 'cotonou'),
                                                                                                  limit: 50,
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
                                                                                                  List<RestaurantsRecord> rowRestaurantsRecordList = snapshot.data!;
                                                                                                  return SingleChildScrollView(
                                                                                                    scrollDirection: Axis.horizontal,
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: List.generate(rowRestaurantsRecordList.length, (rowIndex) {
                                                                                                        final rowRestaurantsRecord = rowRestaurantsRecordList[rowIndex];
                                                                                                        return Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                          child: StreamBuilder<RestaurantsRecord>(
                                                                                                            stream: RestaurantsRecord.getDocument(rowRestaurantsRecord.reference),
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
                                                                                                              final containerRestaurantsRecord = snapshot.data!;
                                                                                                              return Container(
                                                                                                                width: 230.0,
                                                                                                                height: 320.0,
                                                                                                                constraints: BoxConstraints(
                                                                                                                  maxWidth: 400.0,
                                                                                                                  maxHeight: 320.0,
                                                                                                                ),
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                  borderRadius: BorderRadius.circular(15.0),
                                                                                                                ),
                                                                                                                child: InkWell(
                                                                                                                  onTap: () async {
                                                                                                                    FFAppState().update(() {
                                                                                                                      FFAppState().complet = false;
                                                                                                                      FFAppState().refFav = null;
                                                                                                                    });
                                                                                                                    FFAppState().update(() {
                                                                                                                      FFAppState().qty = 1;
                                                                                                                    });

                                                                                                                    context.pushNamed(
                                                                                                                      'restauDetail',
                                                                                                                      queryParams: {
                                                                                                                        'ref': serializeParam(
                                                                                                                          containerRestaurantsRecord.reference,
                                                                                                                          ParamType.DocumentReference,
                                                                                                                        ),
                                                                                                                      }.withoutNulls,
                                                                                                                    );
                                                                                                                  },
                                                                                                                  child: Column(
                                                                                                                    mainAxisSize: MainAxisSize.max,
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
                                                                                                                              rowRestaurantsRecord.img!,
                                                                                                                            ).image,
                                                                                                                          ),
                                                                                                                          borderRadius: BorderRadius.only(
                                                                                                                            bottomLeft: Radius.circular(0.0),
                                                                                                                            bottomRight: Radius.circular(0.0),
                                                                                                                            topLeft: Radius.circular(15.0),
                                                                                                                            topRight: Radius.circular(15.0),
                                                                                                                          ),
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
                                                                                                                                  child: Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 9.0, 0.0),
                                                                                                                                    child: Column(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      children: [
                                                                                                                                        Row(
                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                          children: [
                                                                                                                                            Expanded(
                                                                                                                                              flex: 2,
                                                                                                                                              child: Text(
                                                                                                                                                rowRestaurantsRecord.nom!,
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
                                                                                                                                          children: [
                                                                                                                                            Expanded(
                                                                                                                                              flex: 2,
                                                                                                                                              child: Padding(
                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                                                                child: Text(
                                                                                                                                                  rowRestaurantsRecord.zone!,
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
                                                                                                                                          ],
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
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 9.0, 0.0),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          children: [
                                                                                                                            Text(
                                                                                                                              '${dateTimeFormat(
                                                                                                                                'Hm',
                                                                                                                                rowRestaurantsRecord.ouv,
                                                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                                                              )} - ${dateTimeFormat(
                                                                                                                                'Hm',
                                                                                                                                rowRestaurantsRecord.clo,
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
                                                                                                                      ),
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(9.0, 10.0, 9.0, 9.0),
                                                                                                                        child: Row(
                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                          children: [
                                                                                                                            RatingBarIndicator(
                                                                                                                              itemBuilder: (context, index) => Icon(
                                                                                                                                Icons.star_rounded,
                                                                                                                                color: Color(0xFFFFCC53),
                                                                                                                              ),
                                                                                                                              direction: Axis.horizontal,
                                                                                                                              rating: functions.rate(rowRestaurantsRecord.ratelist!.toList(), rowRestaurantsRecord.ratelist!.toList().length),
                                                                                                                              unratedColor: Color(0xFF9E9E9E),
                                                                                                                              itemCount: 5,
                                                                                                                              itemSize: 18.0,
                                                                                                                            ),
                                                                                                                          ],
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ],
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
                                                                                                queryBuilder: (restaurantsRecord) => restaurantsRecord.where('zone', isEqualTo: 'akpakpa'),
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
                                                                                                                'Akpakpa',
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                      fontSize: 16.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              ),
                                                                                                              InkWell(
                                                                                                                onTap: () async {
                                                                                                                  context.pushNamed(
                                                                                                                    'zone',
                                                                                                                    queryParams: {
                                                                                                                      'zone': serializeParam(
                                                                                                                        'akpakpa',
                                                                                                                        ParamType.String,
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
                                                                                                          child: StreamBuilder<List<RestaurantsRecord>>(
                                                                                                            stream: queryRestaurantsRecord(
                                                                                                              queryBuilder: (restaurantsRecord) => restaurantsRecord.where('zone', isEqualTo: 'akpakpa'),
                                                                                                              limit: 50,
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
                                                                                                              List<RestaurantsRecord> rowRestaurantsRecordList = snapshot.data!;
                                                                                                              return SingleChildScrollView(
                                                                                                                scrollDirection: Axis.horizontal,
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: List.generate(rowRestaurantsRecordList.length, (rowIndex) {
                                                                                                                    final rowRestaurantsRecord = rowRestaurantsRecordList[rowIndex];
                                                                                                                    return Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                                      child: StreamBuilder<RestaurantsRecord>(
                                                                                                                        stream: RestaurantsRecord.getDocument(rowRestaurantsRecord.reference),
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
                                                                                                                          final containerRestaurantsRecord = snapshot.data!;
                                                                                                                          return Container(
                                                                                                                            width: 230.0,
                                                                                                                            height: 320.0,
                                                                                                                            constraints: BoxConstraints(
                                                                                                                              maxWidth: 400.0,
                                                                                                                              maxHeight: 320.0,
                                                                                                                            ),
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                              borderRadius: BorderRadius.circular(15.0),
                                                                                                                            ),
                                                                                                                            child: InkWell(
                                                                                                                              onTap: () async {
                                                                                                                                FFAppState().update(() {
                                                                                                                                  FFAppState().complet = false;
                                                                                                                                  FFAppState().refFav = null;
                                                                                                                                });
                                                                                                                                FFAppState().update(() {
                                                                                                                                  FFAppState().qty = 1;
                                                                                                                                });

                                                                                                                                context.pushNamed(
                                                                                                                                  'restauDetail',
                                                                                                                                  queryParams: {
                                                                                                                                    'ref': serializeParam(
                                                                                                                                      containerRestaurantsRecord.reference,
                                                                                                                                      ParamType.DocumentReference,
                                                                                                                                    ),
                                                                                                                                  }.withoutNulls,
                                                                                                                                );
                                                                                                                              },
                                                                                                                              child: Column(
                                                                                                                                mainAxisSize: MainAxisSize.max,
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
                                                                                                                                          rowRestaurantsRecord.img!,
                                                                                                                                        ).image,
                                                                                                                                      ),
                                                                                                                                      borderRadius: BorderRadius.only(
                                                                                                                                        bottomLeft: Radius.circular(0.0),
                                                                                                                                        bottomRight: Radius.circular(0.0),
                                                                                                                                        topLeft: Radius.circular(15.0),
                                                                                                                                        topRight: Radius.circular(15.0),
                                                                                                                                      ),
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
                                                                                                                                              child: Padding(
                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 9.0, 0.0),
                                                                                                                                                child: Column(
                                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                                  children: [
                                                                                                                                                    Row(
                                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                                      children: [
                                                                                                                                                        Expanded(
                                                                                                                                                          flex: 2,
                                                                                                                                                          child: Text(
                                                                                                                                                            rowRestaurantsRecord.nom!,
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
                                                                                                                                                      children: [
                                                                                                                                                        Expanded(
                                                                                                                                                          flex: 2,
                                                                                                                                                          child: Padding(
                                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                                                                            child: Text(
                                                                                                                                                              rowRestaurantsRecord.zone!,
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
                                                                                                                                                      ],
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
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 9.0, 0.0),
                                                                                                                                    child: Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      children: [
                                                                                                                                        Text(
                                                                                                                                          '${dateTimeFormat(
                                                                                                                                            'Hm',
                                                                                                                                            rowRestaurantsRecord.ouv,
                                                                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                                                                          )} - ${dateTimeFormat(
                                                                                                                                            'Hm',
                                                                                                                                            rowRestaurantsRecord.clo,
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
                                                                                                                                  ),
                                                                                                                                  Padding(
                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(9.0, 10.0, 9.0, 9.0),
                                                                                                                                    child: Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                      children: [
                                                                                                                                        RatingBarIndicator(
                                                                                                                                          itemBuilder: (context, index) => Icon(
                                                                                                                                            Icons.star_rounded,
                                                                                                                                            color: Color(0xFFFFCC53),
                                                                                                                                          ),
                                                                                                                                          direction: Axis.horizontal,
                                                                                                                                          rating: functions.rate(rowRestaurantsRecord.ratelist!.toList(), rowRestaurantsRecord.ratelist!.toList().length),
                                                                                                                                          unratedColor: Color(0xFF9E9E9E),
                                                                                                                                          itemCount: 5,
                                                                                                                                          itemSize: 18.0,
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ],
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
                                                                                                            queryBuilder: (restaurantsRecord) => restaurantsRecord.where('zone', isEqualTo: 'calavi'),
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
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 120.0),
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
                                                                                                                            'Calavi',
                                                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                  fontFamily: 'sf pro text',
                                                                                                                                  fontSize: 16.0,
                                                                                                                                  useGoogleFonts: false,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                          InkWell(
                                                                                                                            onTap: () async {
                                                                                                                              context.pushNamed(
                                                                                                                                'zone',
                                                                                                                                queryParams: {
                                                                                                                                  'zone': serializeParam(
                                                                                                                                    'ccalavi',
                                                                                                                                    ParamType.String,
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
                                                                                                                      child: StreamBuilder<List<RestaurantsRecord>>(
                                                                                                                        stream: queryRestaurantsRecord(
                                                                                                                          queryBuilder: (restaurantsRecord) => restaurantsRecord.where('zone', isEqualTo: 'calavi'),
                                                                                                                          limit: 50,
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
                                                                                                                          List<RestaurantsRecord> rowRestaurantsRecordList = snapshot.data!;
                                                                                                                          return SingleChildScrollView(
                                                                                                                            scrollDirection: Axis.horizontal,
                                                                                                                            child: Row(
                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                              children: List.generate(rowRestaurantsRecordList.length, (rowIndex) {
                                                                                                                                final rowRestaurantsRecord = rowRestaurantsRecordList[rowIndex];
                                                                                                                                return Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                                                                                                                                  child: StreamBuilder<RestaurantsRecord>(
                                                                                                                                    stream: RestaurantsRecord.getDocument(rowRestaurantsRecord.reference),
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
                                                                                                                                      final containerRestaurantsRecord = snapshot.data!;
                                                                                                                                      return Container(
                                                                                                                                        width: 230.0,
                                                                                                                                        height: 320.0,
                                                                                                                                        constraints: BoxConstraints(
                                                                                                                                          maxWidth: 400.0,
                                                                                                                                          maxHeight: 320.0,
                                                                                                                                        ),
                                                                                                                                        decoration: BoxDecoration(
                                                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                                                                        ),
                                                                                                                                        child: InkWell(
                                                                                                                                          onTap: () async {
                                                                                                                                            FFAppState().update(() {
                                                                                                                                              FFAppState().complet = false;
                                                                                                                                              FFAppState().refFav = null;
                                                                                                                                            });
                                                                                                                                            FFAppState().update(() {
                                                                                                                                              FFAppState().qty = 1;
                                                                                                                                            });

                                                                                                                                            context.pushNamed(
                                                                                                                                              'restauDetail',
                                                                                                                                              queryParams: {
                                                                                                                                                'ref': serializeParam(
                                                                                                                                                  containerRestaurantsRecord.reference,
                                                                                                                                                  ParamType.DocumentReference,
                                                                                                                                                ),
                                                                                                                                              }.withoutNulls,
                                                                                                                                            );
                                                                                                                                          },
                                                                                                                                          child: Column(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
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
                                                                                                                                                      rowRestaurantsRecord.img!,
                                                                                                                                                    ).image,
                                                                                                                                                  ),
                                                                                                                                                  borderRadius: BorderRadius.only(
                                                                                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                                                                                    bottomRight: Radius.circular(0.0),
                                                                                                                                                    topLeft: Radius.circular(15.0),
                                                                                                                                                    topRight: Radius.circular(15.0),
                                                                                                                                                  ),
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
                                                                                                                                                          child: Padding(
                                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 9.0, 0.0),
                                                                                                                                                            child: Column(
                                                                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                                                                              children: [
                                                                                                                                                                Row(
                                                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                                                  children: [
                                                                                                                                                                    Expanded(
                                                                                                                                                                      flex: 2,
                                                                                                                                                                      child: Text(
                                                                                                                                                                        rowRestaurantsRecord.nom!,
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
                                                                                                                                                                  children: [
                                                                                                                                                                    Expanded(
                                                                                                                                                                      flex: 2,
                                                                                                                                                                      child: Padding(
                                                                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                                                                                                                                                                        child: Text(
                                                                                                                                                                          rowRestaurantsRecord.zone!,
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
                                                                                                                                                                  ],
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
                                                                                                                                              Padding(
                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(9.0, 0.0, 9.0, 0.0),
                                                                                                                                                child: Row(
                                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                                  children: [
                                                                                                                                                    Text(
                                                                                                                                                      '${dateTimeFormat(
                                                                                                                                                        'Hm',
                                                                                                                                                        rowRestaurantsRecord.ouv,
                                                                                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                                                                                      )} - ${dateTimeFormat(
                                                                                                                                                        'Hm',
                                                                                                                                                        rowRestaurantsRecord.clo,
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
                                                                                                                                              ),
                                                                                                                                              Padding(
                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(9.0, 10.0, 9.0, 9.0),
                                                                                                                                                child: Row(
                                                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                                  children: [
                                                                                                                                                    RatingBarIndicator(
                                                                                                                                                      itemBuilder: (context, index) => Icon(
                                                                                                                                                        Icons.star_rounded,
                                                                                                                                                        color: Color(0xFFFFCC53),
                                                                                                                                                      ),
                                                                                                                                                      direction: Axis.horizontal,
                                                                                                                                                      rating: functions.rate(rowRestaurantsRecord.ratelist!.toList(), rowRestaurantsRecord.ratelist!.toList().length),
                                                                                                                                                      unratedColor: Color(0xFF9E9E9E),
                                                                                                                                                      itemCount: 5,
                                                                                                                                                      itemSize: 18.0,
                                                                                                                                                    ),
                                                                                                                                                  ],
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
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
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
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
                                                                          List<
                                                                              BanniereRecord>>(
                                                                        stream:
                                                                            queryBanniereRecord(
                                                                          queryBuilder: (banniereRecord) => banniereRecord.orderBy(
                                                                              'priorite',
                                                                              descending: true),
                                                                          singleRecord:
                                                                              true,
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
                                                                          List<BanniereRecord>
                                                                              containerBanniereRecordList =
                                                                              snapshot.data!;
                                                                          // Return an empty Container when the item does not exist.
                                                                          if (snapshot
                                                                              .data!
                                                                              .isEmpty) {
                                                                            return Container();
                                                                          }
                                                                          final containerBanniereRecord = containerBanniereRecordList.isNotEmpty
                                                                              ? containerBanniereRecordList.first
                                                                              : null;
                                                                          return InkWell(
                                                                            onTap:
                                                                                () async {
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
                                                                            child:
                                                                                Container(
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
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
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
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
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
                                                                            descending:
                                                                                true),
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
                                                                        return SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                List.generate(columnProduitsRecordList.length, (columnIndex) {
                                                                              final columnProduitsRecord = columnProduitsRecordList[columnIndex];
                                                                              return CardProWidget(
                                                                                key: Key('Keysvf_${columnIndex}_of_${columnProduitsRecordList.length}'),
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
            if (responsiveVisibility(
              context: context,
              tabletLandscape: false,
              desktop: false,
            ))
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (responsiveVisibility(
                      context: context,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 1.0,
                                height: 70.0,
                                decoration: BoxDecoration(
                                  color: Color(0x00272B50),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 12.0,
                                      color: Color(0x33000000),
                                      offset: Offset(0.0, 5.0),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                child: ClipRRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: 2.0,
                                      sigmaY: 2.0,
                                    ),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          1.0,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        color: Color(0xB915191C),
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10.0, 10.0, 10.0, 10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: () async {
                                                context.pushNamed('Accueil');
                                              },
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.12,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: Color(0x00272B50),
                                                ),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 30.0,
                                                  icon: FaIcon(
                                                    FontAwesomeIcons.home,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    size: 20.0,
                                                  ),
                                                  onPressed: () async {
                                                    context
                                                        .pushNamed('Accueil');
                                                  },
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.12,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x00272B50),
                                              ),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                borderWidth: 1.0,
                                                buttonSize: 30.0,
                                                icon: Icon(
                                                  FFIcons.kfiRrApps,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 20.0,
                                                ),
                                                onPressed: () async {
                                                  context.pushNamed('category');
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.3,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.3,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary400,
                                                            Color(0x85202034)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  0, 1.0),
                                                        ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 32.0,
                                                        icon: Icon(
                                                          FFIcons.kfiRrShop,
                                                          color: Colors.white,
                                                          size: 22.0,
                                                        ),
                                                        onPressed: () async {
                                                          context.pushNamed(
                                                              'cart2');
                                                        },
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                            Color(0x85202034)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  0, 1.0),
                                                        ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 32.0,
                                                        icon: Icon(
                                                          FFIcons.kfiRrUtensils,
                                                          color: Colors.white,
                                                          size: 22.0,
                                                        ),
                                                        onPressed: () async {
                                                          context.pushNamed(
                                                              'cart2');
                                                        },
                                                      ),
                                                    ),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.15,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                          colors: [
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiary400,
                                                            Color(0x85202034)
                                                          ],
                                                          stops: [0.0, 1.0],
                                                          begin:
                                                              AlignmentDirectional(
                                                                  0.0, -1.0),
                                                          end:
                                                              AlignmentDirectional(
                                                                  0, 1.0),
                                                        ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 32.0,
                                                        icon: Icon(
                                                          FFIcons
                                                              .kfiRrShoppingCartAdd,
                                                          color: Colors.white,
                                                          size: 20.0,
                                                        ),
                                                        onPressed: () async {
                                                          context.pushNamed(
                                                              'Ravitaillemant');
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.12,
                                              height: 100.0,
                                              decoration: BoxDecoration(),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                borderWidth: 1.0,
                                                buttonSize: 30.0,
                                                icon: Icon(
                                                  FFIcons.kfiRrHeart,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 20.0,
                                                ),
                                                onPressed: () async {
                                                  context.pushNamed('favoris');
                                                },
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.13,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color: Color(0x00272B50),
                                              ),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30.0,
                                                borderWidth: 1.0,
                                                buttonSize: 40.0,
                                                icon: Icon(
                                                  Icons.person_outline,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryText,
                                                  size: 25.0,
                                                ),
                                                onPressed: () async {
                                                  context.pushNamed('user');
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
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
            if (responsiveVisibility(
              context: context,
              phone: false,
              tablet: false,
              tabletLandscape: false,
              desktop: false,
            ))
              Align(
                alignment: AlignmentDirectional(0.0, 0.44),
                child: StreamBuilder<List<ProduitsRecord>>(
                  stream: queryProduitsRecord(),
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
                    List<ProduitsRecord> columnProduitsRecordList =
                        snapshot.data!;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(columnProduitsRecordList.length,
                          (columnIndex) {
                        final columnProduitsRecord =
                            columnProduitsRecordList[columnIndex];
                        return Align(
                          alignment: AlignmentDirectional(0.02, 0.67),
                          child: StreamBuilder<ProduitsRecord>(
                            stream: ProduitsRecord.getDocument(
                                columnProduitsRecord.reference),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 20.0,
                                    height: 20.0,
                                    child: SpinKitPulse(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 20.0,
                                    ),
                                  ),
                                );
                              }
                              final buttonProduitsRecord = snapshot.data!;
                              return FFButtonWidget(
                                onPressed: () async {
                                  FFAppState().update(() {
                                    FFAppState().prixDefaut = false;
                                    FFAppState().refFav = null;
                                  });
                                  FFAppState().update(() {
                                    FFAppState().qty = 1;
                                  });
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              1.0,
                                          child: DetailWidget(
                                            prodRef:
                                                buttonProduitsRecord.reference,
                                          ),
                                        ),
                                      );
                                    },
                                  ).then((value) => setState(() {}));
                                },
                                text: 'Button',
                                options: FFButtonOptions(
                                  width: 130.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'sf pro text',
                                        color: Colors.white,
                                        useGoogleFonts: false,
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              );
                            },
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
    );
  }
}
