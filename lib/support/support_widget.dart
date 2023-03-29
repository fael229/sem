import '/backend/backend.dart';
import '/flutter_flow/chat/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'support_model.dart';
export 'support_model.dart';

class SupportWidget extends StatefulWidget {
  const SupportWidget({
    Key? key,
    this.chatUser,
    this.chatRef,
  }) : super(key: key);

  final UsersRecord? chatUser;
  final DocumentReference? chatRef;

  @override
  _SupportWidgetState createState() => _SupportWidgetState();
}

class _SupportWidgetState extends State<SupportWidget> {
  late SupportModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  FFChatInfo? _chatInfo;
  bool isGroupChat() {
    if (widget.chatUser == null) {
      return true;
    }
    if (widget.chatRef == null) {
      return false;
    }
    return _chatInfo?.isGroupChat ?? false;
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SupportModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Support'});
    FFChatManager.instance
        .getChatInfo(
      otherUserRecord: widget.chatUser,
      chatReference: widget.chatRef,
    )
        .listen((info) {
      if (mounted) {
        setState(() => _chatInfo = info);
      }
    });

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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          actions: [],
          flexibleSpace: FlexibleSpaceBar(
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
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
                              Icons.arrow_back_ios,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 30.0,
                            ),
                            onPressed: () async {
                              context.pop();
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              4.0, 0.0, 0.0, 0.0),
                          child: Text(
                            'Retour',
                            style: FlutterFlowTheme.of(context).title2.override(
                                  fontFamily: 'sf pro text',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 16.0,
                                  useGoogleFonts: false,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Support',
                      style: FlutterFlowTheme.of(context).title2.override(
                            fontFamily: 'sf pro text',
                            color: FlutterFlowTheme.of(context).primaryText,
                            fontSize: 22.0,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              ),
            ),
            centerTitle: true,
            expandedTitleScale: 1.0,
          ),
          elevation: 2.0,
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: StreamBuilder<FFChatInfo>(
            stream: FFChatManager.instance.getChatInfo(
              otherUserRecord: widget.chatUser,
              chatReference: widget.chatRef,
            ),
            builder: (context, snapshot) => snapshot.hasData
                ? FFChatPage(
                    chatInfo: snapshot.data!,
                    allowImages: true,
                    backgroundColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    timeDisplaySetting: TimeDisplaySetting.alwaysVisible,
                    currentUserBoxDecoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    otherUsersBoxDecoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryColor,
                      border: Border.all(
                        color: Colors.transparent,
                      ),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    currentUserTextStyle: GoogleFonts.getFont(
                      'DM Sans',
                      color: Color(0xFF1E2429),
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                      fontStyle: FontStyle.normal,
                    ),
                    otherUsersTextStyle: GoogleFonts.getFont(
                      'DM Sans',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                    ),
                    inputHintTextStyle: GoogleFonts.getFont(
                      'DM Sans',
                      color: Color(0xFF95A1AC),
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                    ),
                    inputTextStyle: GoogleFonts.getFont(
                      'DM Sans',
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 14.0,
                    ),
                  )
                : Center(
                    child: SizedBox(
                      width: 20.0,
                      height: 20.0,
                      child: SpinKitPulse(
                        color: FlutterFlowTheme.of(context).primaryColor,
                        size: 20.0,
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
