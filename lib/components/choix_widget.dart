import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'choix_model.dart';
export 'choix_model.dart';

class ChoixWidget extends StatefulWidget {
  const ChoixWidget({
    Key? key,
    this.prodRef,
    this.jour,
    this.panRef,
  }) : super(key: key);

  final DocumentReference? prodRef;
  final String? jour;
  final DocumentReference? panRef;

  @override
  _ChoixWidgetState createState() => _ChoixWidgetState();
}

class _ChoixWidgetState extends State<ChoixWidget> {
  late ChoixModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChoixModel());

    _model.searchFieldController ??= TextEditingController();
    _model.indicController ??= TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Stack(
      children: [
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: Color(0x00FFFFFF),
              ),
            ),
          ),
        ),
        Align(
          alignment: AlignmentDirectional(0, 0),
          child: StreamBuilder<UsersRecord>(
            stream: UsersRecord.getDocument(currentUserReference!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 20,
                    height: 20,
                    child: SpinKitPulse(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      size: 20,
                    ),
                  ),
                );
              }
              final containerUsersRecord = snapshot.data!;
              return Container(
                constraints: BoxConstraints(
                  maxWidth: 450,
                ),
                decoration: BoxDecoration(
                  color: Color(0x00272B50),
                ),
                child: StreamBuilder<List<ProduitsRecord>>(
                  stream: queryProduitsRecord(
                    queryBuilder: (produitsRecord) =>
                        produitsRecord.where('Nom',
                            isEqualTo: valueOrDefault<String>(
                              FFAppState().prod,
                              'Chawarma Viande sans piment',
                            )),
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: SpinKitPulse(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            size: 20,
                          ),
                        ),
                      );
                    }
                    List<ProduitsRecord> stackProduitsRecordList =
                        snapshot.data!;
                    final stackProduitsRecord =
                        stackProduitsRecordList.isNotEmpty
                            ? stackProduitsRecordList.first
                            : null;
                    return Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 1),
                          child: StreamBuilder<List<RestaurantsRecord>>(
                            stream: queryRestaurantsRecord(
                              queryBuilder: (restaurantsRecord) =>
                                  restaurantsRecord.where('nom',
                                      isEqualTo:
                                          stackProduitsRecord!.restaurant),
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: SpinKitPulse(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      size: 20,
                                    ),
                                  ),
                                );
                              }
                              List<RestaurantsRecord>
                                  containerRestaurantsRecordList =
                                  snapshot.data!;
                              final containerRestaurantsRecord =
                                  containerRestaurantsRecordList.isNotEmpty
                                      ? containerRestaurantsRecordList.first
                                      : null;
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                constraints: BoxConstraints(
                                  maxWidth: 450,
                                ),
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(40),
                                    topRight: Radius.circular(40),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 138, 0, 0),
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          18, 5, 18, 10),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                if (stackProduitsRecord!
                                                        .favoris!
                                                        .toList()
                                                        .contains(
                                                            currentUserEmail) ==
                                                    true)
                                                  StreamBuilder<
                                                      List<FavRecord>>(
                                                    stream: queryFavRecord(
                                                      parent:
                                                          currentUserReference,
                                                      queryBuilder: (favRecord) =>
                                                          favRecord.where('ref',
                                                              isEqualTo:
                                                                  stackProduitsRecord!
                                                                      .reference),
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 20,
                                                            height: 20,
                                                            child: SpinKitPulse(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 20,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<FavRecord>
                                                          iconButtonFavRecordList =
                                                          snapshot.data!;
                                                      final iconButtonFavRecord =
                                                          iconButtonFavRecordList
                                                                  .isNotEmpty
                                                              ? iconButtonFavRecordList
                                                                  .first
                                                              : null;
                                                      return FlutterFlowIconButton(
                                                        borderColor:
                                                            Colors.transparent,
                                                        borderRadius: 30,
                                                        borderWidth: 1,
                                                        buttonSize: 60,
                                                        icon: Icon(
                                                          Icons.favorite_sharp,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          size: 22,
                                                        ),
                                                        onPressed: () async {
                                                          await iconButtonFavRecord!
                                                              .reference
                                                              .delete();

                                                          final produitsUpdateData =
                                                              {
                                                            'favoris': FieldValue
                                                                .arrayRemove([
                                                              currentUserEmail
                                                            ]),
                                                            'nbreFav':
                                                                FieldValue
                                                                    .increment(
                                                                        -(1)),
                                                          };
                                                          await stackProduitsRecord!
                                                              .reference
                                                              .update(
                                                                  produitsUpdateData);
                                                        },
                                                      );
                                                    },
                                                  ),
                                                if (stackProduitsRecord!
                                                        .favoris!
                                                        .toList()
                                                        .contains(
                                                            currentUserEmail) ==
                                                    false)
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    borderWidth: 1,
                                                    buttonSize: 40,
                                                    icon: Icon(
                                                      FFIcons.kfiRrHeart,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 20,
                                                    ),
                                                    onPressed: () async {
                                                      final favCreateData =
                                                          createFavRecordData(
                                                        date:
                                                            getCurrentTimestamp,
                                                        ref:
                                                            stackProduitsRecord!
                                                                .reference,
                                                        qty: 1,
                                                      );
                                                      var favRecordReference =
                                                          FavRecord.createDoc(
                                                              currentUserReference!);
                                                      await favRecordReference
                                                          .set(favCreateData);
                                                      _model.ref = FavRecord
                                                          .getDocumentFromData(
                                                              favCreateData,
                                                              favRecordReference);
                                                      FFAppState().update(() {
                                                        FFAppState().refFav =
                                                            _model
                                                                .ref!.reference;
                                                      });

                                                      final produitsUpdateData =
                                                          {
                                                        'favoris': FieldValue
                                                            .arrayUnion([
                                                          currentUserEmail
                                                        ]),
                                                        'nbreFav': FieldValue
                                                            .increment(1),
                                                      };
                                                      await stackProduitsRecord!
                                                          .reference
                                                          .update(
                                                              produitsUpdateData);

                                                      setState(() {});
                                                    },
                                                  ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 16, 20, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 4, 0, 0),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 40,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxWidth: 500,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(28),
                                                      ),
                                                      child: TextFormField(
                                                        controller: _model
                                                            .searchFieldController,
                                                        onChanged: (_) =>
                                                            EasyDebounce
                                                                .debounce(
                                                          '_model.searchFieldController',
                                                          Duration(
                                                              milliseconds:
                                                                  200),
                                                          () async {
                                                            setState(() {
                                                              FFAppState()
                                                                  .prod = '';
                                                            });
                                                            setState(() => _model
                                                                    .algoliaSearchResults =
                                                                null);
                                                            await ProduitsRecord
                                                                    .search(
                                                              term: _model
                                                                  .searchFieldController
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
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        12,
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
                                                              width: 0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        29),
                                                          ),
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        29),
                                                          ),
                                                          errorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        29),
                                                          ),
                                                          focusedErrorBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0x00000000),
                                                              width: 0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        29),
                                                          ),
                                                          filled: true,
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          contentPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      14,
                                                                      24,
                                                                      14,
                                                                      24),
                                                          prefixIcon: Icon(
                                                            FFIcons.ksearchFael,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                          ),
                                                          suffixIcon: _model
                                                                  .searchFieldController!
                                                                  .text
                                                                  .isNotEmpty
                                                              ? InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    _model
                                                                        .searchFieldController
                                                                        ?.clear();
                                                                    setState(
                                                                        () {
                                                                      FFAppState()
                                                                          .prod = '';
                                                                    });
                                                                    setState(() =>
                                                                        _model.algoliaSearchResults =
                                                                            null);
                                                                    await ProduitsRecord
                                                                            .search(
                                                                      term: _model
                                                                          .searchFieldController
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
                                                                            setState(() {}));

                                                                    setState(
                                                                        () {});
                                                                  },
                                                                  child: Icon(
                                                                    Icons.clear,
                                                                    color: Color(
                                                                        0xFF757575),
                                                                    size: 22,
                                                                  ),
                                                                )
                                                              : null,
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1,
                                                        validator: _model
                                                            .searchFieldControllerValidator
                                                            .asValidator(
                                                                context),
                                                      ),
                                                    ),
                                                  ),
                                                  if (FFAppState().prod ==
                                                          null ||
                                                      FFAppState().prod == '')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 8, 0, 0),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  1,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0x00FFFFFF),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                              ),
                                                              child: FutureBuilder<
                                                                  List<
                                                                      ProduitsRecord>>(
                                                                future:
                                                                    ProduitsRecord
                                                                        .search(
                                                                  term: _model
                                                                      .searchFieldController
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
                                                                            20,
                                                                        height:
                                                                            20,
                                                                        child:
                                                                            SpinKitPulse(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          size:
                                                                              20,
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
                                                                        child: Text(
                                                                            'No results.'),
                                                                      ),
                                                                    );
                                                                  }
                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: List.generate(
                                                                        columnProduitsRecordList
                                                                            .length,
                                                                        (columnIndex) {
                                                                      final columnProduitsRecord =
                                                                          columnProduitsRecordList[
                                                                              columnIndex];
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0,
                                                                            4,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Container(
                                                                          width: MediaQuery.of(context)
                                                                              .size
                                                                              .width,
                                                                          height:
                                                                              170,
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            maxWidth:
                                                                                500,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(8),
                                                                          ),
                                                                          child:
                                                                              StreamBuilder<ProduitsRecord>(
                                                                            stream:
                                                                                ProduitsRecord.getDocument(columnProduitsRecord.reference),
                                                                            builder:
                                                                                (context, snapshot) {
                                                                              // Customize what your widget looks like when it's loading.
                                                                              if (!snapshot.hasData) {
                                                                                return Center(
                                                                                  child: SizedBox(
                                                                                    width: 20,
                                                                                    height: 20,
                                                                                    child: SpinKitPulse(
                                                                                      color: FlutterFlowTheme.of(context).primaryColor,
                                                                                      size: 20,
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
                                                                                  setState(() {
                                                                                    FFAppState().prod = rowProduitsRecord.nom!;
                                                                                  });
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(10),
                                                                                      child: Image.network(
                                                                                        rowProduitsRecord.image!,
                                                                                        width: 100,
                                                                                        height: 100,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      child: Container(
                                                                                        height: MediaQuery.of(context).size.height * 1,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0x00FFFFFF),
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
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
                                                                                                                  fontSize: 16,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
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
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            rowProduitsRecord.restaurant!,
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
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                                                                                                            child: Text(
                                                                                                              rowProduitsRecord.multi == false ? '${functions.multippl(rowProduitsRecord.prix!, 1).toString()} FCFA' : '${functions.multippl(rowProduitsRecord.prixComplet!, 1).toString()} FCFA',
                                                                                                              textAlign: TextAlign.start,
                                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                    fontFamily: 'sf pro text',
                                                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                    fontSize: 18,
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 20, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.4,
                                                    height: 80,
                                                    constraints: BoxConstraints(
                                                      maxWidth: 250,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
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
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                flex: 2,
                                                                child: Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    FFAppState()
                                                                        .prod,
                                                                    'Chawarma Viande sans piment',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        () {
                                                          if (stackProduitsRecord!
                                                                  .multi ==
                                                              false) {
                                                            return '${functions.multippl(stackProduitsRecord!.prix!, FFAppState().qty).toString()} FCFA';
                                                          } else if ((stackProduitsRecord!
                                                                      .multi ==
                                                                  true) &&
                                                              (FFAppState()
                                                                      .complet ==
                                                                  true)) {
                                                            return '${functions.multippl(stackProduitsRecord!.prixComplet!, FFAppState().qty).toString()} FCFA';
                                                          } else {
                                                            return '${functions.multippl(stackProduitsRecord!.prixDemi!, FFAppState().qty).toString()} FCFA';
                                                          }
                                                        }(),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'sf pro text',
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  useGoogleFonts:
                                                                      false,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 10, 0, 10),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.85,
                                                height: 1,
                                                decoration: BoxDecoration(
                                                  color: Color(0x3EA0A4A8),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 0, 8),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Ouverture - Fermeture',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'sf pro text',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 10, 8, 10),
                                                      child: Text(
                                                        '${dateTimeFormat(
                                                          'Hm',
                                                          stackProduitsRecord!
                                                              .ouv,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        )} - ${dateTimeFormat(
                                                          'Hm',
                                                          stackProduitsRecord!
                                                              .clo,
                                                          locale:
                                                              FFLocalizations.of(
                                                                      context)
                                                                  .languageCode,
                                                        )}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .bodyText1
                                                            .override(
                                                              fontFamily:
                                                                  'sf pro text',
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              useGoogleFonts:
                                                                  false,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 8, 0, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Quantité',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'sf pro text',
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                  Container(
                                                    width: 110,
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      shape: BoxShape.rectangle,
                                                      border: Border.all(
                                                        color:
                                                            Color(0x819E9E9E),
                                                      ),
                                                    ),
                                                    child:
                                                        FlutterFlowCountController(
                                                      decrementIconBuilder:
                                                          (enabled) => FaIcon(
                                                        FontAwesomeIcons.minus,
                                                        color: enabled
                                                            ? Color(0xDD000000)
                                                            : Color(0xFFEEEEEE),
                                                        size: 15,
                                                      ),
                                                      incrementIconBuilder:
                                                          (enabled) => FaIcon(
                                                        FontAwesomeIcons.plus,
                                                        color: enabled
                                                            ? FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor
                                                            : Color(0xFFEEEEEE),
                                                        size: 15,
                                                      ),
                                                      countBuilder: (count) =>
                                                          Text(
                                                        count.toString(),
                                                        style:
                                                            GoogleFonts.getFont(
                                                          'Roboto',
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 13,
                                                        ),
                                                      ),
                                                      count: _model
                                                          .countControllerValue ??= 1,
                                                      updateCount:
                                                          (count) async {
                                                        setState(() => _model
                                                                .countControllerValue =
                                                            count);
                                                        FFAppState().update(() {
                                                          FFAppState().qty = _model
                                                              .countControllerValue!;
                                                        });
                                                      },
                                                      stepSize: 1,
                                                      minimum: 1,
                                                      maximum: 10,
                                                      contentPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 0, 8, 0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 10, 0, 0),
                                                  child: Text(
                                                    stackProduitsRecord!
                                                        .restaurant!,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'sf pro text',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary400,
                                                          useGoogleFonts: false,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 20, 0, 10),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.85,
                                                height: 1,
                                                decoration: BoxDecoration(
                                                  color: Color(0x3EA0A4A8),
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                if (stackProduitsRecord!.prix ==
                                                    0)
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 14, 0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        InkWell(
                                                          onTap: () async {
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .complet =
                                                                  true;
                                                            });
                                                          },
                                                          child: Container(
                                                            width: 130,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FFAppState()
                                                                          .complet ==
                                                                      true
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          20,
                                                                          10,
                                                                          20),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  stackProduitsRecord!
                                                                      .nomComplet,
                                                                  'null',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'sf pro text',
                                                                      color: FFAppState().complet ==
                                                                              true
                                                                          ? Colors
                                                                              .white
                                                                          : FlutterFlowTheme.of(context)
                                                                              .primaryText,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: () async {
                                                            FFAppState()
                                                                .update(() {
                                                              FFAppState()
                                                                      .complet =
                                                                  false;
                                                            });
                                                          },
                                                          child: Container(
                                                            width: 130,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FFAppState()
                                                                          .complet ==
                                                                      false
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          20,
                                                                          10,
                                                                          20),
                                                              child: Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  stackProduitsRecord!
                                                                      .nomDemi,
                                                                  'null',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'sf pro text',
                                                                      color: FFAppState().complet ==
                                                                              true
                                                                          ? FlutterFlowTheme.of(context)
                                                                              .primaryText
                                                                          : Colors
                                                                              .white,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts:
                                                                          false,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                if (stackProduitsRecord!
                                                        .category !=
                                                    'Ravitaillement')
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 20, 0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.4,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Text(
                                                            'Voulez vous personnaliser cette commande ?',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1,
                                                          ),
                                                        ),
                                                        Theme(
                                                          data: ThemeData(
                                                            checkboxTheme:
                                                                CheckboxThemeData(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0),
                                                              ),
                                                            ),
                                                            unselectedWidgetColor:
                                                                Color(
                                                                    0xFFF5F5F5),
                                                          ),
                                                          child: Checkbox(
                                                            value: _model
                                                                    .checkboxValue ??=
                                                                false,
                                                            onChanged:
                                                                (newValue) async {
                                                              setState(() =>
                                                                  _model.checkboxValue =
                                                                      newValue!);
                                                              if (newValue!) {
                                                                setState(() {
                                                                  FFAppState()
                                                                          .prixpers =
                                                                      stackProduitsRecord!
                                                                          .prix!;
                                                                });
                                                              } else {
                                                                setState(() {
                                                                  FFAppState()
                                                                          .prixpers =
                                                                      stackProduitsRecord!
                                                                          .prix!;
                                                                });
                                                              }
                                                            },
                                                            activeColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 16, 0, 0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (_model
                                                              .checkboxValue ==
                                                          true)
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            18,
                                                                            0,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      width: MediaQuery.of(context)
                                                                              .size
                                                                              .width *
                                                                          0.45,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        'Personnalisez le prix unitaire',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'sf pro text',
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.normal,
                                                                              useGoogleFonts: false,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            140,
                                                                        child:
                                                                            TextFormField(
                                                                          controller: _model.prixpers1Controller ??=
                                                                              TextEditingController(
                                                                            text:
                                                                                stackProduitsRecord!.prix?.toString(),
                                                                          ),
                                                                          obscureText:
                                                                              false,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            hintStyle:
                                                                                FlutterFlowTheme.of(context).bodyText2,
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                width: 2,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(20),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                width: 2,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(20),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 2,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(20),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderSide: BorderSide(
                                                                                color: Color(0x00000000),
                                                                                width: 2,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(20),
                                                                            ),
                                                                          ),
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyText1,
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          keyboardType:
                                                                              TextInputType.number,
                                                                          validator: _model
                                                                              .prixpers1ControllerValidator
                                                                              .asValidator(context),
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
                                                                            5,
                                                                            20,
                                                                            0,
                                                                            0),
                                                                child:
                                                                    TextFormField(
                                                                  controller: _model
                                                                      .indicController,
                                                                  onFieldSubmitted:
                                                                      (_) async {
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                              .indication =
                                                                          _model
                                                                              .indicController
                                                                              .text;
                                                                    });
                                                                  },
                                                                  obscureText:
                                                                      false,
                                                                  decoration:
                                                                      InputDecoration(
                                                                    hintText:
                                                                        'Entrez une indication pour cette commande. cela sera prit en compte par le livreur',
                                                                    hintStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText2
                                                                        .override(
                                                                          fontFamily:
                                                                              'sf pro text',
                                                                          fontSize:
                                                                              16,
                                                                          useGoogleFonts:
                                                                              false,
                                                                        ),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        width:
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20),
                                                                    ),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20),
                                                                    ),
                                                                    errorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20),
                                                                    ),
                                                                    focusedErrorBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                        color: Color(
                                                                            0x00000000),
                                                                        width:
                                                                            2,
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20),
                                                                    ),
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'sf pro text',
                                                                        fontSize:
                                                                            18,
                                                                        useGoogleFonts:
                                                                            false,
                                                                        lineHeight:
                                                                            2,
                                                                      ),
                                                                  maxLines: 5,
                                                                  validator: _model
                                                                      .indicControllerValidator
                                                                      .asValidator(
                                                                          context),
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 15, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 20, 0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: StreamBuilder<
                                                              List<
                                                                  PanierRecord>>(
                                                            stream:
                                                                queryPanierRecord(
                                                              parent:
                                                                  currentUserReference,
                                                              queryBuilder: (panierRecord) =>
                                                                  panierRecord.where(
                                                                      'prodRef',
                                                                      isEqualTo:
                                                                          stackProduitsRecord!
                                                                              .reference),
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
                                                                    width: 20,
                                                                    height: 20,
                                                                    child:
                                                                        SpinKitPulse(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size: 20,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<PanierRecord>
                                                                  buttonPanierRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              final buttonPanierRecord =
                                                                  buttonPanierRecordList
                                                                          .isNotEmpty
                                                                      ? buttonPanierRecordList
                                                                          .first
                                                                      : null;
                                                              return FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  setState(() {
                                                                    FFAppState()
                                                                        .prixpers = 0;
                                                                  });
                                                                  setState(() {
                                                                    FFAppState()
                                                                            .prixpers =
                                                                        int.parse(_model
                                                                            .prixpers1Controller
                                                                            .text);
                                                                  });
                                                                  if (FFAppState()
                                                                          .prixpers >=
                                                                      stackProduitsRecord!
                                                                          .prix!) {
                                                                    final panierUpdateData =
                                                                        createPanierRecordData(
                                                                      prodRef:
                                                                          stackProduitsRecord!
                                                                              .reference,
                                                                      qty: FFAppState()
                                                                          .qty,
                                                                      type: () {
                                                                        if (stackProduitsRecord!.multi ==
                                                                            false) {
                                                                          return 'simple';
                                                                        } else if ((stackProduitsRecord!.multi ==
                                                                                true) &&
                                                                            (FFAppState().complet ==
                                                                                true)) {
                                                                          return 'plat complet';
                                                                        } else {
                                                                          return 'demi plat';
                                                                        }
                                                                      }(),
                                                                      mt: functions.reduce(
                                                                          _model.prixpers1Controller.text != functions.newCustomFunction2(stackProduitsRecord!.prix!)
                                                                              ? functions.multippl(FFAppState().prixpers, FFAppState().qty)
                                                                              : stackProduitsRecord!.prix!,
                                                                          stackProduitsRecord!.pourcentage!),
                                                                      jour: widget
                                                                          .jour,
                                                                      abo: true,
                                                                      nom: stackProduitsRecord!
                                                                          .nom,
                                                                      resto: containerRestaurantsRecord!
                                                                          .nom,
                                                                      adress: containerRestaurantsRecord!
                                                                          .adresse,
                                                                      num: containerRestaurantsRecord!
                                                                          .tel,
                                                                      pret:
                                                                          false,
                                                                      pay:
                                                                          false,
                                                                      indic: _model
                                                                          .indicController
                                                                          .text,
                                                                    );
                                                                    await widget
                                                                        .panRef!
                                                                        .update(
                                                                            panierUpdateData);
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Ajouté au panier',
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).secondaryColor,
                                                                      ),
                                                                    );
                                                                    FFAppState()
                                                                        .update(
                                                                            () {
                                                                      FFAppState()
                                                                          .qty = 1;
                                                                    });
                                                                    Navigator.pop(
                                                                        context);
                                                                  } else {
                                                                    ScaffoldMessenger.of(
                                                                            context)
                                                                        .showSnackBar(
                                                                      SnackBar(
                                                                        content:
                                                                            Text(
                                                                          'Erreur',
                                                                          style:
                                                                              GoogleFonts.getFont(
                                                                            'Roboto',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                14,
                                                                          ),
                                                                        ),
                                                                        duration:
                                                                            Duration(milliseconds: 4000),
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).alternate,
                                                                      ),
                                                                    );
                                                                  }
                                                                },
                                                                text:
                                                                    'Ajouter au Panier',
                                                                options:
                                                                    FFButtonOptions(
                                                                  width: 130,
                                                                  height: 40,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  iconPadding:
                                                                      EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2
                                                                      .override(
                                                                        fontFamily:
                                                                            'sf pro text',
                                                                        color: Colors
                                                                            .white,
                                                                        useGoogleFonts:
                                                                            false,
                                                                      ),
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .transparent,
                                                                    width: 1,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              8),
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
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 20, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 0, 0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Moyenne:',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1,
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Text(
                                                              functions
                                                                  .rate(
                                                                      stackProduitsRecord!
                                                                          .note!
                                                                          .toList(),
                                                                      stackProduitsRecord!
                                                                          .note!
                                                                          .toList()
                                                                          .length)
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'sf pro text',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    fontSize:
                                                                        18,
                                                                    useGoogleFonts:
                                                                        false,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Icon(
                                                                Icons
                                                                    .star_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 24,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 0, 0),
                                                    child: StreamBuilder<
                                                        List<AvisRecord>>(
                                                      stream: queryAvisRecord(
                                                        parent:
                                                            stackProduitsRecord!
                                                                .reference,
                                                        queryBuilder:
                                                            (avisRecord) =>
                                                                avisRecord.orderBy(
                                                                    'date',
                                                                    descending:
                                                                        true),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 20,
                                                              height: 20,
                                                              child:
                                                                  SpinKitPulse(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 20,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<AvisRecord>
                                                            columnAvisRecordList =
                                                            snapshot.data!;
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              columnAvisRecordList
                                                                  .length,
                                                              (columnIndex) {
                                                            final columnAvisRecord =
                                                                columnAvisRecordList[
                                                                    columnIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          12,
                                                                          0,
                                                                          0),
                                                              child:
                                                                  StreamBuilder<
                                                                      AvisRecord>(
                                                                stream: AvisRecord
                                                                    .getDocument(
                                                                        columnAvisRecord
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
                                                                            20,
                                                                        height:
                                                                            20,
                                                                        child:
                                                                            SpinKitPulse(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          size:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final menuItemAvisRecord =
                                                                      snapshot
                                                                          .data!;
                                                                  return Container(
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          500,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              3,
                                                                          color:
                                                                              Color(0x411D2429),
                                                                          offset: Offset(
                                                                              0,
                                                                              1),
                                                                        )
                                                                      ],
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              8,
                                                                              8,
                                                                              8,
                                                                              8),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0,
                                                                                1,
                                                                                1,
                                                                                1),
                                                                            child:
                                                                                ClipRRect(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              child: Image.network(
                                                                                menuItemAvisRecord.pp!,
                                                                                width: 40,
                                                                                height: 40,
                                                                                fit: BoxFit.fill,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(12, 0, 4, 0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 4, 8),
                                                                                        child: Text(
                                                                                          dateTimeFormat(
                                                                                            'relative',
                                                                                            menuItemAvisRecord.date!,
                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                          ),
                                                                                          textAlign: TextAlign.end,
                                                                                          style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                fontFamily: 'sf pro text',
                                                                                                fontSize: 12,
                                                                                                useGoogleFonts: false,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Text(
                                                                                    menuItemAvisRecord.nom!,
                                                                                    style: FlutterFlowTheme.of(context).subtitle1.override(
                                                                                          fontFamily: 'sf pro text',
                                                                                          fontSize: 15,
                                                                                          useGoogleFonts: false,
                                                                                        ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        flex: 2,
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0, 4, 8, 0),
                                                                                          child: AutoSizeText(
                                                                                            menuItemAvisRecord.comment!,
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).bodyText2.override(
                                                                                                  fontFamily: 'sf pro text',
                                                                                                  fontSize: 12,
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
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-0.6, -0.5),
                          child: Container(
                            width: 260,
                            height: 240,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 25,
                                  color: Color(0x335A5A5A),
                                  offset: Offset(0, 20),
                                  spreadRadius: 20,
                                )
                              ],
                              shape: BoxShape.rectangle,
                            ),
                            child: Image.network(
                              stackProduitsRecord!.image!,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0, -0.9),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            borderWidth: 1,
                            buttonSize: 80,
                            icon: Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 60,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                              FFAppState().update(() {
                                FFAppState().prixDefaut = true;
                              });
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
