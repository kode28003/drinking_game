import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'poker_only_page_model.dart';
export 'poker_only_page_model.dart';

class PokerOnlyPageWidget extends StatefulWidget {
  const PokerOnlyPageWidget({super.key});

  static String routeName = 'pokerOnlyPage';
  static String routePath = '/pokerOnlyPage';

  @override
  State<PokerOnlyPageWidget> createState() => _PokerOnlyPageWidgetState();
}

class _PokerOnlyPageWidgetState extends State<PokerOnlyPageWidget> {
  late PokerOnlyPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PokerOnlyPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 0.93,
                    child: custom_widgets.PokerGame(
                      width: MediaQuery.sizeOf(context).width * 1.0,
                      height: MediaQuery.sizeOf(context).height * 0.93,
                    ),
                  ),
                  FlutterFlowAdBanner(
                    height: MediaQuery.sizeOf(context).height * 0.07,
                    showsTestAd: false,
                    androidAdUnitID: 'ca-app-pub-6843318091304139/4315870711',
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                child: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.safePop();
                  },
                  child: Icon(
                    Icons.chevron_left_outlined,
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 48.0,
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
