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
import 'cart2_model.dart';
export 'cart2_model.dart';

class Cart2Widget extends StatefulWidget {
  const Cart2Widget({Key? key}) : super(key: key);

  @override
  _Cart2WidgetState createState() => _Cart2WidgetState();
}

class _Cart2WidgetState extends State<Cart2Widget> {
  late Cart2Model _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Cart2Model());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'cart2'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 5000));
      FFAppState().update(() {
        FFAppState().tabAbo = false;
        FFAppState().tabSimple = false;
      });
    });

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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Stack(
            children: [
              if (responsiveVisibility(
                context: context,
                tabletLandscape: false,
                desktop: false,
              ))
                Align(
                  alignment: AlignmentDirectional(0.0, -5.65),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 8.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 20.0, 0.0, 0.0),
                                child: Text(
                                  'Commandes',
                                  style: FlutterFlowTheme.of(context).title1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 20.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color(0x00272B50),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        1.0,
                                    decoration: BoxDecoration(
                                      color: Color(0x00272B50),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0.0),
                                        bottomRight: Radius.circular(0.0),
                                        topLeft: Radius.circular(30.0),
                                        topRight: Radius.circular(30.0),
                                      ),
                                    ),
                                    child: DefaultTabController(
                                      length: 3,
                                      initialIndex: min(
                                          valueOrDefault<int>(
                                            () {
                                              if (FFAppState().tabSimple ==
                                                  true) {
                                                return 1;
                                              } else if (FFAppState().tabAbo ==
                                                  true) {
                                                return 2;
                                              } else {
                                                return 0;
                                              }
                                            }(),
                                            0,
                                          ),
                                          2),
                                      child: Column(
                                        children: [
                                          TabBar(
                                            isScrollable: true,
                                            labelColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryColor,
                                            unselectedLabelColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryText,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'sf pro text',
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      useGoogleFonts: false,
                                                    ),
                                            indicatorColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryColor,
                                            tabs: [
                                              Tab(
                                                text: 'Panier',
                                              ),
                                              Tab(
                                                text: 'Historique de Paiements',
                                              ),
                                              Tab(
                                                text: 'Abonnement',
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: TabBarView(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 20.0),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      5.0,
                                                                      0.0,
                                                                      5.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final panChild =
                                                                  FFAppState()
                                                                      .panieRef
                                                                      .toList();
                                                              if (panChild
                                                                  .isEmpty) {
                                                                return Container(
                                                                  width: 250.0,
                                                                  child:
                                                                      UuuiiiWidget(),
                                                                );
                                                              }
                                                              return SingleChildScrollView(
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: List.generate(
                                                                      panChild
                                                                          .length,
                                                                      (panChildIndex) {
                                                                    final panChildItem =
                                                                        panChild[
                                                                            panChildIndex];
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          4.0,
                                                                          0.0,
                                                                          10.0),
                                                                      child:
                                                                          Container(
                                                                        width: MediaQuery.of(context).size.width *
                                                                            1.0,
                                                                        height:
                                                                            170.0,
                                                                        constraints:
                                                                            BoxConstraints(
                                                                          maxWidth:
                                                                              500.0,
                                                                        ),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0x00272B50),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                        child: StreamBuilder<
                                                                            PanierRecord>(
                                                                          stream:
                                                                              PanierRecord.getDocument(panChildItem),
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
                                                                            final rowPanierRecord =
                                                                                snapshot.data!;
                                                                            return Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                StreamBuilder<ProduitsRecord>(
                                                                                  stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
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
                                                                                    final imageProduitsRecord = snapshot.data!;
                                                                                    return ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                      child: Image.network(
                                                                                        imageProduitsRecord.image!,
                                                                                        width: 60.0,
                                                                                        height: 60.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    );
                                                                                  },
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
                                                                                        Expanded(
                                                                                          child: Padding(
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
                                                                                                        child: StreamBuilder<ProduitsRecord>(
                                                                                                          stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
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
                                                                                                            final textProduitsRecord = snapshot.data!;
                                                                                                            return Text(
                                                                                                              textProduitsRecord.nom!,
                                                                                                              maxLines: 2,
                                                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                    fontFamily: 'sf pro text',
                                                                                                                    fontSize: 16.0,
                                                                                                                    useGoogleFonts: false,
                                                                                                                  ),
                                                                                                            );
                                                                                                          },
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
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                          child: StreamBuilder<ProduitsRecord>(
                                                                                                            stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
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
                                                                                                              final textProduitsRecord = snapshot.data!;
                                                                                                              return Text(
                                                                                                                textProduitsRecord.restaurant!,
                                                                                                                maxLines: 2,
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                      color: FlutterFlowTheme.of(context).tertiary400,
                                                                                                                      fontSize: 16.0,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                                                                                                    child: StreamBuilder<ProduitsRecord>(
                                                                                                      stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
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
                                                                                                        return Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Container(
                                                                                                              width: 40.0,
                                                                                                              height: 30.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                borderRadius: BorderRadius.circular(9.0),
                                                                                                              ),
                                                                                                              child: InkWell(
                                                                                                                onTap: () async {
                                                                                                                  if (rowPanierRecord.qty != 1) {
                                                                                                                    final panierUpdateData = {
                                                                                                                      ...createPanierRecordData(
                                                                                                                        mt: functions.reduce(
                                                                                                                            functions.multippl(() {
                                                                                                                              if (rowPanierRecord.type == 'simple') {
                                                                                                                                return rowProduitsRecord.prix!;
                                                                                                                              } else if (rowPanierRecord.type == 'plat complet') {
                                                                                                                                return rowProduitsRecord.prixComplet!;
                                                                                                                              } else {
                                                                                                                                return rowProduitsRecord.prixDemi!;
                                                                                                                              }
                                                                                                                            }(), functions.addqty(rowPanierRecord.qty!, -1)),
                                                                                                                            rowProduitsRecord.pourcentage!),
                                                                                                                      ),
                                                                                                                      'qty': FieldValue.increment(-(1)),
                                                                                                                    };
                                                                                                                    await rowPanierRecord.reference.update(panierUpdateData);
                                                                                                                    return;
                                                                                                                  }
                                                                                                                },
                                                                                                                child: Icon(
                                                                                                                  FFIcons.kfiRrMinus,
                                                                                                                  color: Colors.white,
                                                                                                                  size: 10.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                              child: Container(
                                                                                                                width: 50.0,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                                                ),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                                  child: Text(
                                                                                                                    rowPanierRecord.qty!.toString(),
                                                                                                                    textAlign: TextAlign.center,
                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                          fontFamily: 'sf pro text',
                                                                                                                          fontSize: 18.0,
                                                                                                                          useGoogleFonts: false,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Container(
                                                                                                              width: 40.0,
                                                                                                              height: 30.0,
                                                                                                              decoration: BoxDecoration(
                                                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                borderRadius: BorderRadius.circular(9.0),
                                                                                                              ),
                                                                                                              child: InkWell(
                                                                                                                onTap: () async {
                                                                                                                  final panierUpdateData = {
                                                                                                                    ...createPanierRecordData(
                                                                                                                      mt: functions.reduce(
                                                                                                                          functions.multippl(() {
                                                                                                                            if (rowPanierRecord.type == 'simple') {
                                                                                                                              return rowProduitsRecord.prix!;
                                                                                                                            } else if (rowPanierRecord.type == 'plat complet') {
                                                                                                                              return rowProduitsRecord.prixComplet!;
                                                                                                                            } else {
                                                                                                                              return rowProduitsRecord.prixDemi!;
                                                                                                                            }
                                                                                                                          }(), functions.addqty(rowPanierRecord.qty!, 1)),
                                                                                                                          rowProduitsRecord.pourcentage!),
                                                                                                                    ),
                                                                                                                    'qty': FieldValue.increment(1),
                                                                                                                  };
                                                                                                                  await rowPanierRecord.reference.update(panierUpdateData);
                                                                                                                },
                                                                                                                child: Icon(
                                                                                                                  Icons.add,
                                                                                                                  color: Colors.white,
                                                                                                                  size: 20.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                              child: Container(
                                                                                                                width: MediaQuery.of(context).size.width * 1.0,
                                                                                                                height: 40.0,
                                                                                                                constraints: BoxConstraints(
                                                                                                                  maxWidth: 50.0,
                                                                                                                  maxHeight: 30.0,
                                                                                                                ),
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                  borderRadius: BorderRadius.circular(9.0),
                                                                                                                ),
                                                                                                                child: InkWell(
                                                                                                                  onTap: () async {
                                                                                                                    await rowPanierRecord.reference.delete();
                                                                                                                    FFAppState().update(() {
                                                                                                                      FFAppState().removeFromPanieRef(rowPanierRecord.reference);
                                                                                                                    });
                                                                                                                  },
                                                                                                                  child: Icon(
                                                                                                                    FFIcons.kfiRrDeleteDocument,
                                                                                                                    color: Colors.white,
                                                                                                                    size: 20.0,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                          child: StreamBuilder<ProduitsRecord>(
                                                                                                            stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
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
                                                                                                              final textProduitsRecord = snapshot.data!;
                                                                                                              return Text(
                                                                                                                rowPanierRecord.type!,
                                                                                                                textAlign: TextAlign.start,
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 13.0,
                                                                                                                      fontWeight: FontWeight.bold,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Expanded(
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                          child: StreamBuilder<ProduitsRecord>(
                                                                                                            stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
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
                                                                                                              final textProduitsRecord = snapshot.data!;
                                                                                                              return Text(
                                                                                                                '${rowPanierRecord.mt?.toString()} FCFA',
                                                                                                                textAlign: TextAlign.end,
                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                      fontSize: 18.0,
                                                                                                                      fontWeight: FontWeight.bold,
                                                                                                                      useGoogleFonts: false,
                                                                                                                    ),
                                                                                                              );
                                                                                                            },
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
                                                                              ],
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                        if (FFAppState()
                                                                .panieRef
                                                                .length >
                                                            0)
                                                          Form(
                                                            key:
                                                                _model.formKey1,
                                                            autovalidateMode:
                                                                AutovalidateMode
                                                                    .disabled,
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                        child:
                                                                            FFButtonWidget(
                                                                          onPressed:
                                                                              () async {
                                                                            final _datePicked1Date =
                                                                                await showDatePicker(
                                                                              context: context,
                                                                              initialDate: getCurrentTimestamp,
                                                                              firstDate: DateTime(1900),
                                                                              lastDate: DateTime(2050),
                                                                            );

                                                                            TimeOfDay?
                                                                                _datePicked1Time;
                                                                            if (_datePicked1Date !=
                                                                                null) {
                                                                              _datePicked1Time = await showTimePicker(
                                                                                context: context,
                                                                                initialTime: TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                              );
                                                                            }

                                                                            if (_datePicked1Date != null &&
                                                                                _datePicked1Time != null) {
                                                                              setState(() {
                                                                                _model.datePicked1 = DateTime(
                                                                                  _datePicked1Date.year,
                                                                                  _datePicked1Date.month,
                                                                                  _datePicked1Date.day,
                                                                                  _datePicked1Time!.hour,
                                                                                  _datePicked1Time.minute,
                                                                                );
                                                                              });
                                                                            }
                                                                          },
                                                                          text:
                                                                              'Choisir  la date et l\'heure de livraison',
                                                                          options:
                                                                              FFButtonOptions(
                                                                            width:
                                                                                130.0,
                                                                            height:
                                                                                40.0,
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary400,
                                                                            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                  fontFamily: 'sf pro text',
                                                                                  color: Colors.white,
                                                                                  fontSize: 16.0,
                                                                                  useGoogleFonts: false,
                                                                                ),
                                                                            borderSide:
                                                                                BorderSide(
                                                                              color: Colors.transparent,
                                                                              width: 1.0,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(13.0),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                if (_model
                                                                        .datePicked1 !=
                                                                    null)
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            8.0,
                                                                            0.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        dateTimeFormat(
                                                                          'd/M H:mm',
                                                                          _model
                                                                              .datePicked1,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        'Aucune date sélectionné',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1,
                                                                    ),
                                                                  ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          40.0,
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          FFAppState()
                                                                              .update(() {
                                                                            FFAppState().panieRef =
                                                                                [];
                                                                          });
                                                                        },
                                                                        text:
                                                                            'Annuler',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              130.0,
                                                                          height:
                                                                              40.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .subtitle2
                                                                              .override(
                                                                                fontFamily: 'sf pro text',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                fontSize: 14.0,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      StreamBuilder<
                                                                          List<
                                                                              PanierRecord>>(
                                                                        stream:
                                                                            queryPanierRecord(
                                                                          parent:
                                                                              currentUserReference,
                                                                          queryBuilder: (panierRecord) => panierRecord.whereIn(
                                                                              'ref',
                                                                              FFAppState().panieRef),
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
                                                                          List<PanierRecord>
                                                                              buttonPanierRecordList =
                                                                              snapshot.data!;
                                                                          return FFButtonWidget(
                                                                            onPressed:
                                                                                () async {
                                                                              if (_model.formKey1.currentState == null || !_model.formKey1.currentState!.validate()) {
                                                                                return;
                                                                              }
                                                                              if (_model.datePicked1 == null) {
                                                                                return;
                                                                              }
                                                                              if (FFAppState().paiementEtape == true) {
                                                                                await FFAppState().refPrep!.delete();
                                                                              }

                                                                              final precommandeCreateData = {
                                                                                ...createPrecommandeRecordData(
                                                                                  refcli: currentUserReference,
                                                                                  soustot: functions.subtotal(buttonPanierRecordList.map((e) => e.mt).withoutNulls.toList()),
                                                                                  date: _model.datePicked1,
                                                                                  nom: random_data.randomString(
                                                                                    12,
                                                                                    25,
                                                                                    true,
                                                                                    true,
                                                                                    true,
                                                                                  ),
                                                                                  statut: 'Soumis',
                                                                                  livrer: false,
                                                                                  dateAjout: getCurrentTimestamp,
                                                                                ),
                                                                                'listecom': FFAppState().panieRef,
                                                                              };
                                                                              var precommandeRecordReference = PrecommandeRecord.collection.doc();
                                                                              await precommandeRecordReference.set(precommandeCreateData);
                                                                              _model.precommande = PrecommandeRecord.getDocumentFromData(precommandeCreateData, precommandeRecordReference);
                                                                              FFAppState().update(() {
                                                                                FFAppState().refPrep = _model.precommande!.reference;
                                                                              });

                                                                              context.pushNamed(
                                                                                'moyenPaiement',
                                                                                queryParams: {
                                                                                  'refComm': serializeParam(
                                                                                    _model.precommande!.reference,
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );

                                                                              setState(() {});
                                                                            },
                                                                            text:
                                                                                'Commander',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              width: 120.0,
                                                                              height: 40.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: _model.datePicked1 == null ? Color(0xFFB8B4B4) : FlutterFlowTheme.of(context).primaryColor,
                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                    fontFamily: 'sf pro text',
                                                                                    color: Colors.white,
                                                                                    fontSize: 14.0,
                                                                                    useGoogleFonts: false,
                                                                                  ),
                                                                              borderSide: BorderSide(
                                                                                color: Colors.transparent,
                                                                                width: 1.0,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(13.0),
                                                                            ),
                                                                          );
                                                                        },
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
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 5.0),
                                                  child: StreamBuilder<
                                                      List<PrecommandeRecord>>(
                                                    stream:
                                                        queryPrecommandeRecord(
                                                      queryBuilder:
                                                          (precommandeRecord) =>
                                                              precommandeRecord
                                                                  .where(
                                                                      'refcli',
                                                                      isEqualTo:
                                                                          currentUserReference)
                                                                  .where(
                                                                      'statut',
                                                                      isEqualTo:
                                                                          'Payé')
                                                                  .where(
                                                                      'aboLivre',
                                                                      isEqualTo:
                                                                          false)
                                                                  .orderBy(
                                                                      'dateAjout',
                                                                      descending:
                                                                          true),
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
                                                      List<PrecommandeRecord>
                                                          columnPrecommandeRecordList =
                                                          snapshot.data!;
                                                      if (columnPrecommandeRecordList
                                                          .isEmpty) {
                                                        return Container(
                                                          width: 300.0,
                                                          child: UuuiiiWidget(),
                                                        );
                                                      }
                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: List.generate(
                                                              columnPrecommandeRecordList
                                                                  .length,
                                                              (columnIndex) {
                                                            final columnPrecommandeRecord =
                                                                columnPrecommandeRecordList[
                                                                    columnIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          20.0),
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
                                                                            18.0),
                                                                    child: StreamBuilder<
                                                                        List<
                                                                            PanierRecord>>(
                                                                      stream:
                                                                          queryPanierRecord(
                                                                        parent:
                                                                            currentUserReference,
                                                                        queryBuilder: (panierRecord) => panierRecord.whereIn(
                                                                            'ref',
                                                                            columnPrecommandeRecord.listecom!.toList()),
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
                                                                        List<PanierRecord>
                                                                            containerPanierRecordList =
                                                                            snapshot.data!;
                                                                        // Return an empty Container when the item does not exist.
                                                                        if (snapshot
                                                                            .data!
                                                                            .isEmpty) {
                                                                          return Container();
                                                                        }
                                                                        final containerPanierRecord = containerPanierRecordList.isNotEmpty
                                                                            ? containerPanierRecordList.first
                                                                            : null;
                                                                        return Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 1.0,
                                                                          height:
                                                                              130.0,
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            maxWidth:
                                                                                400.0,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(15.0),
                                                                          ),
                                                                          child:
                                                                              StreamBuilder<PrecommandeRecord>(
                                                                            stream:
                                                                                PrecommandeRecord.getDocument(columnPrecommandeRecord.reference),
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
                                                                              final rowPrecommandeRecord = snapshot.data!;
                                                                              return Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: StreamBuilder<ProduitsRecord>(
                                                                                      stream: ProduitsRecord.getDocument(containerPanierRecord!.prodRef!),
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
                                                                                          height: MediaQuery.of(context).size.height * 1.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0x00FFFFFF),
                                                                                            image: DecorationImage(
                                                                                              fit: BoxFit.cover,
                                                                                              image: Image.network(
                                                                                                containerProduitsRecord.image!,
                                                                                              ).image,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(20.0),
                                                                                          ),
                                                                                          child: Container(
                                                                                            width: 100.0,
                                                                                            height: 100.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).customColor2,
                                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                                            ),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                    child: Container(
                                                                                                      width: MediaQuery.of(context).size.width * 0.5,
                                                                                                      height: double.infinity,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: Color(0x00FFFFFF),
                                                                                                      ),
                                                                                                      child: InkWell(
                                                                                                        onTap: () async {
                                                                                                          context.pushNamed(
                                                                                                            'Tracking',
                                                                                                            queryParams: {
                                                                                                              'refTrack': serializeParam(
                                                                                                                rowPrecommandeRecord.reference,
                                                                                                                ParamType.DocumentReference,
                                                                                                              ),
                                                                                                            }.withoutNulls,
                                                                                                          );
                                                                                                        },
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
                                                                                                                    rowPrecommandeRecord.nom!,
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
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                Expanded(
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      'Status',
                                                                                                                      textAlign: TextAlign.start,
                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                            fontFamily: 'sf pro text',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            fontSize: 13.0,
                                                                                                                            fontWeight: FontWeight.bold,
                                                                                                                            useGoogleFonts: false,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Expanded(
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      rowPrecommandeRecord.statut!,
                                                                                                                      textAlign: TextAlign.end,
                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                            fontFamily: 'sf pro text',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            fontSize: 18.0,
                                                                                                                            fontWeight: FontWeight.bold,
                                                                                                                            useGoogleFonts: false,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                Expanded(
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      'Etat',
                                                                                                                      textAlign: TextAlign.start,
                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                            fontFamily: 'sf pro text',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            fontSize: 13.0,
                                                                                                                            fontWeight: FontWeight.bold,
                                                                                                                            useGoogleFonts: false,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Expanded(
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      rowPrecommandeRecord.livrer == false ? 'Pas encore livré' : 'Livré',
                                                                                                                      textAlign: TextAlign.end,
                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                            fontFamily: 'sf pro text',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
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
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        );
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
                                                                  StreamBuilder<
                                                                      PrecommandeRecord>(
                                                                    stream: PrecommandeRecord.getDocument(
                                                                        columnPrecommandeRecord
                                                                            .reference),
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
                                                                      final buttonPrecommandeRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            'listePanier',
                                                                            queryParams:
                                                                                {
                                                                              'refPanier': serializeParam(
                                                                                buttonPrecommandeRecord.reference,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        text:
                                                                            'Voir le contenu',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              40.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .subtitle2
                                                                              .override(
                                                                                fontFamily: 'sf pro text',
                                                                                color: Colors.white,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          }),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 20.0, 0.0, 5.0),
                                                  child: StreamBuilder<
                                                      List<PrecommandeRecord>>(
                                                    stream:
                                                        queryPrecommandeRecord(
                                                      queryBuilder:
                                                          (precommandeRecord) =>
                                                              precommandeRecord
                                                                  .where(
                                                                      'refcli',
                                                                      isEqualTo:
                                                                          currentUserReference)
                                                                  .where(
                                                                      'statut',
                                                                      isEqualTo:
                                                                          'Payé')
                                                                  .where(
                                                                      'aboLivre',
                                                                      isEqualTo:
                                                                          true)
                                                                  .orderBy(
                                                                      'dateAjout',
                                                                      descending:
                                                                          true),
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
                                                      List<PrecommandeRecord>
                                                          columnPrecommandeRecordList =
                                                          snapshot.data!;
                                                      if (columnPrecommandeRecordList
                                                          .isEmpty) {
                                                        return Container(
                                                          width: 300.0,
                                                          child: UuuiiiWidget(),
                                                        );
                                                      }
                                                      return SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: List.generate(
                                                              columnPrecommandeRecordList
                                                                  .length,
                                                              (columnIndex) {
                                                            final columnPrecommandeRecord =
                                                                columnPrecommandeRecordList[
                                                                    columnIndex];
                                                            return Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          20.0),
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
                                                                            18.0),
                                                                    child: StreamBuilder<
                                                                        List<
                                                                            PanierRecord>>(
                                                                      stream:
                                                                          queryPanierRecord(
                                                                        parent:
                                                                            currentUserReference,
                                                                        queryBuilder: (panierRecord) => panierRecord.whereIn(
                                                                            'ref',
                                                                            columnPrecommandeRecord.listecom!.toList()),
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
                                                                        List<PanierRecord>
                                                                            containerPanierRecordList =
                                                                            snapshot.data!;
                                                                        // Return an empty Container when the item does not exist.
                                                                        if (snapshot
                                                                            .data!
                                                                            .isEmpty) {
                                                                          return Container();
                                                                        }
                                                                        final containerPanierRecord = containerPanierRecordList.isNotEmpty
                                                                            ? containerPanierRecordList.first
                                                                            : null;
                                                                        return Container(
                                                                          width:
                                                                              MediaQuery.of(context).size.width * 1.0,
                                                                          height:
                                                                              130.0,
                                                                          constraints:
                                                                              BoxConstraints(
                                                                            maxWidth:
                                                                                400.0,
                                                                          ),
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(15.0),
                                                                          ),
                                                                          child:
                                                                              StreamBuilder<PrecommandeRecord>(
                                                                            stream:
                                                                                PrecommandeRecord.getDocument(columnPrecommandeRecord.reference),
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
                                                                              final rowPrecommandeRecord = snapshot.data!;
                                                                              return Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: StreamBuilder<ProduitsRecord>(
                                                                                      stream: ProduitsRecord.getDocument(containerPanierRecord!.prodRef!),
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
                                                                                          height: MediaQuery.of(context).size.height * 1.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0x00FFFFFF),
                                                                                            image: DecorationImage(
                                                                                              fit: BoxFit.cover,
                                                                                              image: Image.network(
                                                                                                containerProduitsRecord.image!,
                                                                                              ).image,
                                                                                            ),
                                                                                            borderRadius: BorderRadius.circular(20.0),
                                                                                          ),
                                                                                          child: Container(
                                                                                            width: 100.0,
                                                                                            height: 100.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).customColor2,
                                                                                              borderRadius: BorderRadius.circular(20.0),
                                                                                            ),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                    child: Container(
                                                                                                      width: MediaQuery.of(context).size.width * 0.5,
                                                                                                      height: double.infinity,
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: Color(0x00FFFFFF),
                                                                                                      ),
                                                                                                      child: InkWell(
                                                                                                        onTap: () async {
                                                                                                          context.pushNamed(
                                                                                                            'Tracking',
                                                                                                            queryParams: {
                                                                                                              'refTrack': serializeParam(
                                                                                                                rowPrecommandeRecord.reference,
                                                                                                                ParamType.DocumentReference,
                                                                                                              ),
                                                                                                            }.withoutNulls,
                                                                                                          );
                                                                                                        },
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
                                                                                                                    rowPrecommandeRecord.nom!,
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
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                Expanded(
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      'Status',
                                                                                                                      textAlign: TextAlign.start,
                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                            fontFamily: 'sf pro text',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            fontSize: 13.0,
                                                                                                                            fontWeight: FontWeight.bold,
                                                                                                                            useGoogleFonts: false,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Expanded(
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      rowPrecommandeRecord.statut!,
                                                                                                                      textAlign: TextAlign.end,
                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                            fontFamily: 'sf pro text',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            fontSize: 18.0,
                                                                                                                            fontWeight: FontWeight.bold,
                                                                                                                            useGoogleFonts: false,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                              children: [
                                                                                                                Expanded(
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      'Etat',
                                                                                                                      textAlign: TextAlign.start,
                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                            fontFamily: 'sf pro text',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            fontSize: 13.0,
                                                                                                                            fontWeight: FontWeight.bold,
                                                                                                                            useGoogleFonts: false,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                                Expanded(
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                    child: Text(
                                                                                                                      rowPrecommandeRecord.livrer == false ? 'Pas encore livré' : 'Livré',
                                                                                                                      textAlign: TextAlign.end,
                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                            fontFamily: 'sf pro text',
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
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
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        );
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
                                                                  StreamBuilder<
                                                                      PrecommandeRecord>(
                                                                    stream: PrecommandeRecord.getDocument(
                                                                        columnPrecommandeRecord
                                                                            .reference),
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
                                                                      final buttonPrecommandeRecord =
                                                                          snapshot
                                                                              .data!;
                                                                      return FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            'listePanier',
                                                                            queryParams:
                                                                                {
                                                                              'refPanier': serializeParam(
                                                                                buttonPrecommandeRecord.reference,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        text:
                                                                            'Voir le contenu',
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              40.0,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .subtitle2
                                                                              .override(
                                                                                fontFamily: 'sf pro text',
                                                                                color: Colors.white,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
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
                                        ],
                                      ),
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
                                                                      30.0,
                                                                  borderWidth:
                                                                      1.0,
                                                                  buttonSize:
                                                                      30.0,
                                                                  fillColor: Color(
                                                                      0xFFCC4433),
                                                                  icon: Icon(
                                                                    Icons
                                                                        .shopping_basket_outlined,
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
                                                                            context.pushNamed('cart2');
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'Commandes',
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
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  icon: Icon(
                                                                    FFIcons
                                                                        .kfiRrShop,
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
                                                                            context.pushNamed('restaurants');
                                                                          },
                                                                          child:
                                                                              Text(
                                                                            'Restaurants',
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
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        30.0,
                                                                        0.0,
                                                                        15.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child: SelectionArea(
                                                                          child: Text(
                                                                        'Mes Commandes',
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
                                                              Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                                child:
                                                                    Container(
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      1.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0x00272B50),
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
                                                                              30.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              30.0),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      DefaultTabController(
                                                                    length: 3,
                                                                    initialIndex:
                                                                        min(
                                                                            valueOrDefault<int>(
                                                                              () {
                                                                                if (FFAppState().tabSimple == true) {
                                                                                  return 1;
                                                                                } else if (FFAppState().tabAbo == true) {
                                                                                  return 2;
                                                                                } else {
                                                                                  return 0;
                                                                                }
                                                                              }(),
                                                                              0,
                                                                            ),
                                                                            2),
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        TabBar(
                                                                          isScrollable:
                                                                              true,
                                                                          labelColor:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          unselectedLabelColor:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          labelStyle: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'sf pro text',
                                                                                fontSize: 16.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                useGoogleFonts: false,
                                                                              ),
                                                                          indicatorColor:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                          tabs: [
                                                                            Tab(
                                                                              text: 'Panier',
                                                                            ),
                                                                            Tab(
                                                                              text: 'Historique de Paiements',
                                                                            ),
                                                                            Tab(
                                                                              text: 'Abonnement',
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Expanded(
                                                                          child:
                                                                              TabBarView(
                                                                            children: [
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0x00272B50),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                                                                                  child: SingleChildScrollView(
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      children: [
                                                                                        Container(
                                                                                          height: 220.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0x00272B50),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 5.0),
                                                                                            child: Builder(
                                                                                              builder: (context) {
                                                                                                final panChild = FFAppState().panieRef.toList();
                                                                                                if (panChild.isEmpty) {
                                                                                                  return Container(
                                                                                                    width: 250.0,
                                                                                                    child: UuuiiiWidget(),
                                                                                                  );
                                                                                                }
                                                                                                return SingleChildScrollView(
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                                    children: List.generate(panChild.length, (panChildIndex) {
                                                                                                      final panChildItem = panChild[panChildIndex];
                                                                                                      return Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 10.0),
                                                                                                        child: Container(
                                                                                                          width: MediaQuery.of(context).size.width * 1.0,
                                                                                                          height: 170.0,
                                                                                                          constraints: BoxConstraints(
                                                                                                            maxWidth: 400.0,
                                                                                                          ),
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: Color(0x00272B50),
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                          ),
                                                                                                          child: StreamBuilder<PanierRecord>(
                                                                                                            stream: PanierRecord.getDocument(panChildItem),
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
                                                                                                              final rowPanierRecord = snapshot.data!;
                                                                                                              return Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  StreamBuilder<ProduitsRecord>(
                                                                                                                    stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
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
                                                                                                                      final imageProduitsRecord = snapshot.data!;
                                                                                                                      return ClipRRect(
                                                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                                                        child: Image.network(
                                                                                                                          imageProduitsRecord.image!,
                                                                                                                          width: 100.0,
                                                                                                                          height: 100.0,
                                                                                                                          fit: BoxFit.cover,
                                                                                                                        ),
                                                                                                                      );
                                                                                                                    },
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
                                                                                                                          Expanded(
                                                                                                                            child: Padding(
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
                                                                                                                                          child: StreamBuilder<ProduitsRecord>(
                                                                                                                                            stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
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
                                                                                                                                              final textProduitsRecord = snapshot.data!;
                                                                                                                                              return Text(
                                                                                                                                                textProduitsRecord.nom!,
                                                                                                                                                maxLines: 2,
                                                                                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                      fontFamily: 'sf pro text',
                                                                                                                                                      fontSize: 16.0,
                                                                                                                                                      useGoogleFonts: false,
                                                                                                                                                    ),
                                                                                                                                              );
                                                                                                                                            },
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
                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                                                            child: StreamBuilder<ProduitsRecord>(
                                                                                                                                              stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
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
                                                                                                                                                final textProduitsRecord = snapshot.data!;
                                                                                                                                                return Text(
                                                                                                                                                  textProduitsRecord.restaurant!,
                                                                                                                                                  maxLines: 2,
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                        fontFamily: 'sf pro text',
                                                                                                                                                        color: FlutterFlowTheme.of(context).tertiary400,
                                                                                                                                                        fontSize: 16.0,
                                                                                                                                                        useGoogleFonts: false,
                                                                                                                                                      ),
                                                                                                                                                );
                                                                                                                                              },
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                    Padding(
                                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 5.0),
                                                                                                                                      child: StreamBuilder<ProduitsRecord>(
                                                                                                                                        stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
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
                                                                                                                                          return Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                                            children: [
                                                                                                                                              Container(
                                                                                                                                                width: 40.0,
                                                                                                                                                height: 30.0,
                                                                                                                                                decoration: BoxDecoration(
                                                                                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                                                  borderRadius: BorderRadius.circular(9.0),
                                                                                                                                                ),
                                                                                                                                                child: InkWell(
                                                                                                                                                  onTap: () async {
                                                                                                                                                    if (rowPanierRecord.qty != 1) {
                                                                                                                                                      final panierUpdateData = {
                                                                                                                                                        ...createPanierRecordData(
                                                                                                                                                          mt: functions.reduce(
                                                                                                                                                              functions.multippl(() {
                                                                                                                                                                if (rowPanierRecord.type == 'simple') {
                                                                                                                                                                  return rowProduitsRecord.prix!;
                                                                                                                                                                } else if (rowPanierRecord.type == 'plat complet') {
                                                                                                                                                                  return rowProduitsRecord.prixComplet!;
                                                                                                                                                                } else {
                                                                                                                                                                  return rowProduitsRecord.prixDemi!;
                                                                                                                                                                }
                                                                                                                                                              }(), functions.addqty(rowPanierRecord.qty!, -1)),
                                                                                                                                                              rowProduitsRecord.pourcentage!),
                                                                                                                                                        ),
                                                                                                                                                        'qty': FieldValue.increment(-(1)),
                                                                                                                                                      };
                                                                                                                                                      await rowPanierRecord.reference.update(panierUpdateData);
                                                                                                                                                      return;
                                                                                                                                                    }
                                                                                                                                                  },
                                                                                                                                                  child: Icon(
                                                                                                                                                    FFIcons.kfiRrMinus,
                                                                                                                                                    color: Colors.white,
                                                                                                                                                    size: 10.0,
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                              Padding(
                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                                                                                child: Container(
                                                                                                                                                  width: 50.0,
                                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                                                                  ),
                                                                                                                                                  child: Padding(
                                                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 8.0),
                                                                                                                                                    child: Text(
                                                                                                                                                      rowPanierRecord.qty!.toString(),
                                                                                                                                                      textAlign: TextAlign.center,
                                                                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                            fontFamily: 'sf pro text',
                                                                                                                                                            fontSize: 18.0,
                                                                                                                                                            useGoogleFonts: false,
                                                                                                                                                          ),
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                              Container(
                                                                                                                                                width: 40.0,
                                                                                                                                                height: 30.0,
                                                                                                                                                decoration: BoxDecoration(
                                                                                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                                                  borderRadius: BorderRadius.circular(9.0),
                                                                                                                                                ),
                                                                                                                                                child: InkWell(
                                                                                                                                                  onTap: () async {
                                                                                                                                                    final panierUpdateData = {
                                                                                                                                                      ...createPanierRecordData(
                                                                                                                                                        mt: functions.reduce(
                                                                                                                                                            functions.multippl(() {
                                                                                                                                                              if (rowPanierRecord.type == 'simple') {
                                                                                                                                                                return rowProduitsRecord.prix!;
                                                                                                                                                              } else if (rowPanierRecord.type == 'plat complet') {
                                                                                                                                                                return rowProduitsRecord.prixComplet!;
                                                                                                                                                              } else {
                                                                                                                                                                return rowProduitsRecord.prixDemi!;
                                                                                                                                                              }
                                                                                                                                                            }(), functions.addqty(rowPanierRecord.qty!, 1)),
                                                                                                                                                            rowProduitsRecord.pourcentage!),
                                                                                                                                                      ),
                                                                                                                                                      'qty': FieldValue.increment(1),
                                                                                                                                                    };
                                                                                                                                                    await rowPanierRecord.reference.update(panierUpdateData);
                                                                                                                                                  },
                                                                                                                                                  child: Icon(
                                                                                                                                                    Icons.add,
                                                                                                                                                    color: Colors.white,
                                                                                                                                                    size: 20.0,
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                              Padding(
                                                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                                                                child: Container(
                                                                                                                                                  width: MediaQuery.of(context).size.width * 1.0,
                                                                                                                                                  height: 40.0,
                                                                                                                                                  constraints: BoxConstraints(
                                                                                                                                                    maxWidth: 50.0,
                                                                                                                                                    maxHeight: 30.0,
                                                                                                                                                  ),
                                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                                    color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                                                                    borderRadius: BorderRadius.circular(9.0),
                                                                                                                                                  ),
                                                                                                                                                  child: InkWell(
                                                                                                                                                    onTap: () async {
                                                                                                                                                      await rowPanierRecord.reference.delete();
                                                                                                                                                      FFAppState().update(() {
                                                                                                                                                        FFAppState().removeFromPanieRef(rowPanierRecord.reference);
                                                                                                                                                      });
                                                                                                                                                    },
                                                                                                                                                    child: Icon(
                                                                                                                                                      FFIcons.kfiRrDeleteDocument,
                                                                                                                                                      color: Colors.white,
                                                                                                                                                      size: 20.0,
                                                                                                                                                    ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          );
                                                                                                                                        },
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                    Row(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                      children: [
                                                                                                                                        Expanded(
                                                                                                                                          child: Padding(
                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                                            child: StreamBuilder<ProduitsRecord>(
                                                                                                                                              stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
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
                                                                                                                                                final textProduitsRecord = snapshot.data!;
                                                                                                                                                return Text(
                                                                                                                                                  rowPanierRecord.type!,
                                                                                                                                                  textAlign: TextAlign.start,
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                        fontFamily: 'sf pro text',
                                                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                        fontSize: 13.0,
                                                                                                                                                        fontWeight: FontWeight.bold,
                                                                                                                                                        useGoogleFonts: false,
                                                                                                                                                      ),
                                                                                                                                                );
                                                                                                                                              },
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        Expanded(
                                                                                                                                          child: Padding(
                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                            child: StreamBuilder<ProduitsRecord>(
                                                                                                                                              stream: ProduitsRecord.getDocument(rowPanierRecord.prodRef!),
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
                                                                                                                                                final textProduitsRecord = snapshot.data!;
                                                                                                                                                return Text(
                                                                                                                                                  '${rowPanierRecord.mt?.toString()} FCFA',
                                                                                                                                                  textAlign: TextAlign.end,
                                                                                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                        fontFamily: 'sf pro text',
                                                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                        fontSize: 18.0,
                                                                                                                                                        fontWeight: FontWeight.bold,
                                                                                                                                                        useGoogleFonts: false,
                                                                                                                                                      ),
                                                                                                                                                );
                                                                                                                                              },
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
                                                                                                                ],
                                                                                                              );
                                                                                                            },
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        if (FFAppState().panieRef.length > 0)
                                                                                          Form(
                                                                                            key: _model.formKey2,
                                                                                            autovalidateMode: AutovalidateMode.disabled,
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                                          child: FFButtonWidget(
                                                                                                            onPressed: () async {
                                                                                                              final _datePicked2Date = await showDatePicker(
                                                                                                                context: context,
                                                                                                                initialDate: getCurrentTimestamp,
                                                                                                                firstDate: DateTime(1900),
                                                                                                                lastDate: DateTime(2050),
                                                                                                              );

                                                                                                              TimeOfDay? _datePicked2Time;
                                                                                                              if (_datePicked2Date != null) {
                                                                                                                _datePicked2Time = await showTimePicker(
                                                                                                                  context: context,
                                                                                                                  initialTime: TimeOfDay.fromDateTime(getCurrentTimestamp),
                                                                                                                );
                                                                                                              }

                                                                                                              if (_datePicked2Date != null && _datePicked2Time != null) {
                                                                                                                setState(() {
                                                                                                                  _model.datePicked2 = DateTime(
                                                                                                                    _datePicked2Date.year,
                                                                                                                    _datePicked2Date.month,
                                                                                                                    _datePicked2Date.day,
                                                                                                                    _datePicked2Time!.hour,
                                                                                                                    _datePicked2Time.minute,
                                                                                                                  );
                                                                                                                });
                                                                                                              }
                                                                                                            },
                                                                                                            text: 'Choisir  la date et l\'heure de livraison',
                                                                                                            options: FFButtonOptions(
                                                                                                              width: 130.0,
                                                                                                              height: 40.0,
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                              color: FlutterFlowTheme.of(context).tertiary400,
                                                                                                              textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                                    fontFamily: 'sf pro text',
                                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                    fontSize: 16.0,
                                                                                                                    useGoogleFonts: false,
                                                                                                                  ),
                                                                                                              borderSide: BorderSide(
                                                                                                                color: Colors.transparent,
                                                                                                                width: 1.0,
                                                                                                              ),
                                                                                                              borderRadius: BorderRadius.circular(13.0),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  if (_model.datePicked2 != null)
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          dateTimeFormat(
                                                                                                            'd/M H:mm',
                                                                                                            _model.datePicked2,
                                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                                          ),
                                                                                                          'Aucune date sélectionné',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).bodyText1,
                                                                                                      ),
                                                                                                    ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Stack(
                                                                                                          children: [
                                                                                                            StreamBuilder<List<PanierRecord>>(
                                                                                                              stream: queryPanierRecord(
                                                                                                                parent: currentUserReference,
                                                                                                                queryBuilder: (panierRecord) => panierRecord.whereIn('ref', FFAppState().panieRef),
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
                                                                                                                List<PanierRecord> buttonPanierRecordList = snapshot.data!;
                                                                                                                return FFButtonWidget(
                                                                                                                  onPressed: () async {
                                                                                                                    if (_model.formKey2.currentState == null || !_model.formKey2.currentState!.validate()) {
                                                                                                                      return;
                                                                                                                    }
                                                                                                                    if (FFAppState().paiementEtape == true) {
                                                                                                                      await FFAppState().refPrep!.delete();
                                                                                                                    }

                                                                                                                    final precommandeCreateData = {
                                                                                                                      ...createPrecommandeRecordData(
                                                                                                                        refcli: currentUserReference,
                                                                                                                        soustot: functions.subtotal(buttonPanierRecordList.map((e) => e.mt).withoutNulls.toList()),
                                                                                                                        date: _model.datePicked2,
                                                                                                                        nom: random_data.randomString(
                                                                                                                          12,
                                                                                                                          25,
                                                                                                                          true,
                                                                                                                          true,
                                                                                                                          true,
                                                                                                                        ),
                                                                                                                        statut: 'Soumis',
                                                                                                                        livrer: false,
                                                                                                                        dateAjout: getCurrentTimestamp,
                                                                                                                      ),
                                                                                                                      'listecom': FFAppState().panieRef,
                                                                                                                    };
                                                                                                                    var precommandeRecordReference = PrecommandeRecord.collection.doc();
                                                                                                                    await precommandeRecordReference.set(precommandeCreateData);
                                                                                                                    _model.precommande2 = PrecommandeRecord.getDocumentFromData(precommandeCreateData, precommandeRecordReference);
                                                                                                                    FFAppState().update(() {
                                                                                                                      FFAppState().refPrep = _model.precommande2!.reference;
                                                                                                                    });

                                                                                                                    context.pushNamed(
                                                                                                                      'moyenPaiement',
                                                                                                                      queryParams: {
                                                                                                                        'refComm': serializeParam(
                                                                                                                          _model.precommande2!.reference,
                                                                                                                          ParamType.DocumentReference,
                                                                                                                        ),
                                                                                                                      }.withoutNulls,
                                                                                                                    );

                                                                                                                    setState(() {});
                                                                                                                  },
                                                                                                                  text: 'Commander',
                                                                                                                  options: FFButtonOptions(
                                                                                                                    width: 130.0,
                                                                                                                    height: 40.0,
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                    iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                                    color: _model.datePicked2 == null ? Color(0xFFB0AFAF) : FlutterFlowTheme.of(context).primaryColor,
                                                                                                                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                                          fontFamily: 'sf pro text',
                                                                                                                          color: Colors.white,
                                                                                                                          fontSize: 18.0,
                                                                                                                          useGoogleFonts: false,
                                                                                                                        ),
                                                                                                                    borderSide: BorderSide(
                                                                                                                      color: Colors.transparent,
                                                                                                                      width: 1.0,
                                                                                                                    ),
                                                                                                                    borderRadius: BorderRadius.circular(13.0),
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        FFButtonWidget(
                                                                                                          onPressed: () async {
                                                                                                            FFAppState().update(() {
                                                                                                              FFAppState().panieRef = [];
                                                                                                            });
                                                                                                          },
                                                                                                          text: 'Annuler',
                                                                                                          options: FFButtonOptions(
                                                                                                            width: 130.0,
                                                                                                            height: 40.0,
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                            textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                                                  fontFamily: 'sf pro text',
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 14.0,
                                                                                                                  useGoogleFonts: false,
                                                                                                                ),
                                                                                                            borderSide: BorderSide(
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(8.0),
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
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 5.0),
                                                                                child: StreamBuilder<List<PrecommandeRecord>>(
                                                                                  stream: queryPrecommandeRecord(
                                                                                    queryBuilder: (precommandeRecord) => precommandeRecord.where('refcli', isEqualTo: currentUserReference).where('statut', isEqualTo: 'Payé').where('aboLivre', isEqualTo: false).orderBy('dateAjout', descending: true),
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
                                                                                    List<PrecommandeRecord> columnPrecommandeRecordList = snapshot.data!;
                                                                                    if (columnPrecommandeRecordList.isEmpty) {
                                                                                      return Container(
                                                                                        width: 300.0,
                                                                                        child: UuuiiiWidget(),
                                                                                      );
                                                                                    }
                                                                                    return SingleChildScrollView(
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: List.generate(columnPrecommandeRecordList.length, (columnIndex) {
                                                                                          final columnPrecommandeRecord = columnPrecommandeRecordList[columnIndex];
                                                                                          return Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 19.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 18.0),
                                                                                                  child: StreamBuilder<List<PanierRecord>>(
                                                                                                    stream: queryPanierRecord(
                                                                                                      parent: currentUserReference,
                                                                                                      queryBuilder: (panierRecord) => panierRecord.whereIn('ref', columnPrecommandeRecord.listecom!.toList()),
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
                                                                                                      List<PanierRecord> containerPanierRecordList = snapshot.data!;
                                                                                                      // Return an empty Container when the item does not exist.
                                                                                                      if (snapshot.data!.isEmpty) {
                                                                                                        return Container();
                                                                                                      }
                                                                                                      final containerPanierRecord = containerPanierRecordList.isNotEmpty ? containerPanierRecordList.first : null;
                                                                                                      return Container(
                                                                                                        width: MediaQuery.of(context).size.width * 1.0,
                                                                                                        height: 130.0,
                                                                                                        constraints: BoxConstraints(
                                                                                                          maxWidth: 400.0,
                                                                                                        ),
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                                        ),
                                                                                                        child: StreamBuilder<PrecommandeRecord>(
                                                                                                          stream: PrecommandeRecord.getDocument(columnPrecommandeRecord.reference),
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
                                                                                                            final rowPrecommandeRecord = snapshot.data!;
                                                                                                            return Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Expanded(
                                                                                                                  child: StreamBuilder<ProduitsRecord>(
                                                                                                                    stream: ProduitsRecord.getDocument(containerPanierRecord!.prodRef!),
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
                                                                                                                        height: MediaQuery.of(context).size.height * 1.0,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: Color(0x00FFFFFF),
                                                                                                                          image: DecorationImage(
                                                                                                                            fit: BoxFit.cover,
                                                                                                                            image: Image.network(
                                                                                                                              containerProduitsRecord.image!,
                                                                                                                            ).image,
                                                                                                                          ),
                                                                                                                          borderRadius: BorderRadius.circular(20.0),
                                                                                                                        ),
                                                                                                                        child: Container(
                                                                                                                          width: 100.0,
                                                                                                                          height: 100.0,
                                                                                                                          decoration: BoxDecoration(
                                                                                                                            color: FlutterFlowTheme.of(context).customColor2,
                                                                                                                            borderRadius: BorderRadius.circular(20.0),
                                                                                                                          ),
                                                                                                                          child: Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                            children: [
                                                                                                                              Expanded(
                                                                                                                                child: Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                                                  child: Container(
                                                                                                                                    width: MediaQuery.of(context).size.width * 0.5,
                                                                                                                                    height: double.infinity,
                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                      color: Color(0x00FFFFFF),
                                                                                                                                    ),
                                                                                                                                    child: InkWell(
                                                                                                                                      onTap: () async {
                                                                                                                                        context.pushNamed(
                                                                                                                                          'Tracking',
                                                                                                                                          queryParams: {
                                                                                                                                            'refTrack': serializeParam(
                                                                                                                                              rowPrecommandeRecord.reference,
                                                                                                                                              ParamType.DocumentReference,
                                                                                                                                            ),
                                                                                                                                          }.withoutNulls,
                                                                                                                                        );
                                                                                                                                      },
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
                                                                                                                                                  rowPrecommandeRecord.nom!,
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
                                                                                                                                          Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                            children: [
                                                                                                                                              Expanded(
                                                                                                                                                child: Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                                                  child: Text(
                                                                                                                                                    'Status',
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                          fontFamily: 'sf pro text',
                                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                          fontSize: 13.0,
                                                                                                                                                          fontWeight: FontWeight.bold,
                                                                                                                                                          useGoogleFonts: false,
                                                                                                                                                        ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                              Expanded(
                                                                                                                                                child: Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                                  child: Text(
                                                                                                                                                    rowPrecommandeRecord.statut!,
                                                                                                                                                    textAlign: TextAlign.end,
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                          fontFamily: 'sf pro text',
                                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                          fontSize: 18.0,
                                                                                                                                                          fontWeight: FontWeight.bold,
                                                                                                                                                          useGoogleFonts: false,
                                                                                                                                                        ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                          Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                            children: [
                                                                                                                                              Expanded(
                                                                                                                                                child: Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                                                  child: Text(
                                                                                                                                                    'Etat',
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                          fontFamily: 'sf pro text',
                                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                          fontSize: 13.0,
                                                                                                                                                          fontWeight: FontWeight.bold,
                                                                                                                                                          useGoogleFonts: false,
                                                                                                                                                        ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                              Expanded(
                                                                                                                                                child: Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                                  child: Text(
                                                                                                                                                    rowPrecommandeRecord.livrer == false ? 'Pas encore livré' : 'Livré',
                                                                                                                                                    textAlign: TextAlign.end,
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                          fontFamily: 'sf pro text',
                                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
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
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      );
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
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                                  child: StreamBuilder<PrecommandeRecord>(
                                                                                                    stream: PrecommandeRecord.getDocument(columnPrecommandeRecord.reference),
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
                                                                                                      final buttonPrecommandeRecord = snapshot.data!;
                                                                                                      return FFButtonWidget(
                                                                                                        onPressed: () async {
                                                                                                          context.pushNamed(
                                                                                                            'listePanier',
                                                                                                            queryParams: {
                                                                                                              'refPanier': serializeParam(
                                                                                                                buttonPrecommandeRecord.reference,
                                                                                                                ParamType.DocumentReference,
                                                                                                              ),
                                                                                                            }.withoutNulls,
                                                                                                          );
                                                                                                        },
                                                                                                        text: 'Voir le contenu',
                                                                                                        options: FFButtonOptions(
                                                                                                          width: double.infinity,
                                                                                                          height: 40.0,
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                          textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          );
                                                                                        }),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 5.0),
                                                                                child: StreamBuilder<List<PrecommandeRecord>>(
                                                                                  stream: queryPrecommandeRecord(
                                                                                    queryBuilder: (precommandeRecord) => precommandeRecord.where('refcli', isEqualTo: currentUserReference).where('statut', isEqualTo: 'Payé').where('aboLivre', isEqualTo: true).orderBy('dateAjout', descending: true),
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
                                                                                    List<PrecommandeRecord> columnPrecommandeRecordList = snapshot.data!;
                                                                                    if (columnPrecommandeRecordList.isEmpty) {
                                                                                      return Container(
                                                                                        width: 300.0,
                                                                                        child: UuuiiiWidget(),
                                                                                      );
                                                                                    }
                                                                                    return SingleChildScrollView(
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: List.generate(columnPrecommandeRecordList.length, (columnIndex) {
                                                                                          final columnPrecommandeRecord = columnPrecommandeRecordList[columnIndex];
                                                                                          return Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 18.0),
                                                                                                  child: StreamBuilder<List<PanierRecord>>(
                                                                                                    stream: queryPanierRecord(
                                                                                                      parent: currentUserReference,
                                                                                                      queryBuilder: (panierRecord) => panierRecord.whereIn('ref', columnPrecommandeRecord.listecom!.toList()),
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
                                                                                                      List<PanierRecord> containerPanierRecordList = snapshot.data!;
                                                                                                      // Return an empty Container when the item does not exist.
                                                                                                      if (snapshot.data!.isEmpty) {
                                                                                                        return Container();
                                                                                                      }
                                                                                                      final containerPanierRecord = containerPanierRecordList.isNotEmpty ? containerPanierRecordList.first : null;
                                                                                                      return Container(
                                                                                                        width: MediaQuery.of(context).size.width * 1.0,
                                                                                                        height: 130.0,
                                                                                                        constraints: BoxConstraints(
                                                                                                          maxWidth: 400.0,
                                                                                                        ),
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          borderRadius: BorderRadius.circular(15.0),
                                                                                                        ),
                                                                                                        child: StreamBuilder<PrecommandeRecord>(
                                                                                                          stream: PrecommandeRecord.getDocument(columnPrecommandeRecord.reference),
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
                                                                                                            final rowPrecommandeRecord = snapshot.data!;
                                                                                                            return Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Expanded(
                                                                                                                  child: StreamBuilder<ProduitsRecord>(
                                                                                                                    stream: ProduitsRecord.getDocument(containerPanierRecord!.prodRef!),
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
                                                                                                                        height: MediaQuery.of(context).size.height * 1.0,
                                                                                                                        decoration: BoxDecoration(
                                                                                                                          color: Color(0x00FFFFFF),
                                                                                                                          image: DecorationImage(
                                                                                                                            fit: BoxFit.cover,
                                                                                                                            image: Image.network(
                                                                                                                              containerProduitsRecord.image!,
                                                                                                                            ).image,
                                                                                                                          ),
                                                                                                                          borderRadius: BorderRadius.circular(20.0),
                                                                                                                        ),
                                                                                                                        child: Container(
                                                                                                                          width: 100.0,
                                                                                                                          height: 100.0,
                                                                                                                          decoration: BoxDecoration(
                                                                                                                            color: FlutterFlowTheme.of(context).customColor2,
                                                                                                                            borderRadius: BorderRadius.circular(20.0),
                                                                                                                          ),
                                                                                                                          child: Row(
                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                                            children: [
                                                                                                                              Expanded(
                                                                                                                                child: Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                                                                  child: Container(
                                                                                                                                    width: MediaQuery.of(context).size.width * 0.5,
                                                                                                                                    height: double.infinity,
                                                                                                                                    decoration: BoxDecoration(
                                                                                                                                      color: Color(0x00FFFFFF),
                                                                                                                                    ),
                                                                                                                                    child: InkWell(
                                                                                                                                      onTap: () async {
                                                                                                                                        context.pushNamed(
                                                                                                                                          'Tracking',
                                                                                                                                          queryParams: {
                                                                                                                                            'refTrack': serializeParam(
                                                                                                                                              rowPrecommandeRecord.reference,
                                                                                                                                              ParamType.DocumentReference,
                                                                                                                                            ),
                                                                                                                                          }.withoutNulls,
                                                                                                                                        );
                                                                                                                                      },
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
                                                                                                                                                  rowPrecommandeRecord.nom!,
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
                                                                                                                                          Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                            children: [
                                                                                                                                              Expanded(
                                                                                                                                                child: Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                                                  child: Text(
                                                                                                                                                    'Status',
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                          fontFamily: 'sf pro text',
                                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                          fontSize: 13.0,
                                                                                                                                                          fontWeight: FontWeight.bold,
                                                                                                                                                          useGoogleFonts: false,
                                                                                                                                                        ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                              Expanded(
                                                                                                                                                child: Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                                  child: Text(
                                                                                                                                                    rowPrecommandeRecord.statut!,
                                                                                                                                                    textAlign: TextAlign.end,
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                          fontFamily: 'sf pro text',
                                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                          fontSize: 18.0,
                                                                                                                                                          fontWeight: FontWeight.bold,
                                                                                                                                                          useGoogleFonts: false,
                                                                                                                                                        ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            ],
                                                                                                                                          ),
                                                                                                                                          Row(
                                                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                            children: [
                                                                                                                                              Expanded(
                                                                                                                                                child: Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 0.0),
                                                                                                                                                  child: Text(
                                                                                                                                                    'Etat',
                                                                                                                                                    textAlign: TextAlign.start,
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                          fontFamily: 'sf pro text',
                                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                                          fontSize: 13.0,
                                                                                                                                                          fontWeight: FontWeight.bold,
                                                                                                                                                          useGoogleFonts: false,
                                                                                                                                                        ),
                                                                                                                                                  ),
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                              Expanded(
                                                                                                                                                child: Padding(
                                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                                                                                  child: Text(
                                                                                                                                                    rowPrecommandeRecord.livrer == false ? 'Pas encore livré' : 'Livré',
                                                                                                                                                    textAlign: TextAlign.end,
                                                                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                                                                          fontFamily: 'sf pro text',
                                                                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
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
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ],
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      );
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
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
                                                                                                  child: StreamBuilder<PrecommandeRecord>(
                                                                                                    stream: PrecommandeRecord.getDocument(columnPrecommandeRecord.reference),
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
                                                                                                      final buttonPrecommandeRecord = snapshot.data!;
                                                                                                      return FFButtonWidget(
                                                                                                        onPressed: () async {
                                                                                                          context.pushNamed(
                                                                                                            'listePanier',
                                                                                                            queryParams: {
                                                                                                              'refPanier': serializeParam(
                                                                                                                buttonPrecommandeRecord.reference,
                                                                                                                ParamType.DocumentReference,
                                                                                                              ),
                                                                                                            }.withoutNulls,
                                                                                                          );
                                                                                                        },
                                                                                                        text: 'Voir le contenu',
                                                                                                        options: FFButtonOptions(
                                                                                                          width: double.infinity,
                                                                                                          height: 40.0,
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                          color: FlutterFlowTheme.of(context).primaryColor,
                                                                                                          textStyle: FlutterFlowTheme.of(context).subtitle2.override(
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
                                                                                                ),
                                                                                              ],
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
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
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
                                                                                return CardProWidget(
                                                                                  key: Key('Keyeor_${columnIndex}_of_${columnProduitsRecordList.length}'),
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
                                  width:
                                      MediaQuery.of(context).size.width * 1.0,
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
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        height: 70.0,
                                        decoration: BoxDecoration(
                                          color: Color(0xB915191C),
                                          borderRadius:
                                              BorderRadius.circular(40.0),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
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
                                                    icon: Icon(
                                                      FFIcons.kfiRrHome,
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                  borderColor:
                                                      Colors.transparent,
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
                                                    context
                                                        .pushNamed('category');
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
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.15,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.15,
                                                        decoration:
                                                            BoxDecoration(
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
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
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
                                                                'restaurants');
                                                          },
                                                        ),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.15,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.15,
                                                        decoration:
                                                            BoxDecoration(
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
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30.0,
                                                          borderWidth: 1.0,
                                                          buttonSize: 32.0,
                                                          icon: FaIcon(
                                                            FontAwesomeIcons
                                                                .utensils,
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
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.15,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.15,
                                                        decoration:
                                                            BoxDecoration(
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
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child:
                                                            FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
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
                                                  borderColor:
                                                      Colors.transparent,
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
                                                    context
                                                        .pushNamed('favoris');
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
                                                  borderColor:
                                                      Colors.transparent,
                                                  borderRadius: 30.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  icon: Icon(
                                                    Icons.person,
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
            ],
          ),
        ),
      ),
    );
  }
}
