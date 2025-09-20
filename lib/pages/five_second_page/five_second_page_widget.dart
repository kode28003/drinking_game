import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/admob_util.dart' as admob;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'five_second_page_model.dart';
export 'five_second_page_model.dart';

class FiveSecondPageWidget extends StatefulWidget {
  const FiveSecondPageWidget({super.key});

  static String routeName = 'fiveSecondPage';
  static String routePath = '/fiveSecondPage';

  @override
  State<FiveSecondPageWidget> createState() => _FiveSecondPageWidgetState();
}

class _FiveSecondPageWidgetState extends State<FiveSecondPageWidget> {
  late FiveSecondPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FiveSecondPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      admob.loadInterstitialAd(
        "",
        "ca-app-pub-6843318091304139/3140365667",
        false,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

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
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        decoration: BoxDecoration(
                          color: Color(0xFF7D5545),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(valueOrDefault<double>(
                        MediaQuery.sizeOf(context).width * 0.045,
                        0.0,
                      )),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 1.0,
                        child: custom_widgets.FiveSecond(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: MediaQuery.sizeOf(context).height * 1.0,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(-0.95, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            if (FFAppState().tryGameTime >= 2) {
                              _model.interstitialAdSuccess =
                                  await admob.showInterstitialAd();

                              FFAppState().tryGameTime = 0;
                              FFAppState().update(() {});
                              context.safePop();
                            } else {
                              context.pushNamed(HomePageWidget.routeName);
                            }

                            safeSetState(() {});
                          },
                          child: Icon(
                            Icons.chevron_left_outlined,
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 48.0,
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
    );
  }
}
