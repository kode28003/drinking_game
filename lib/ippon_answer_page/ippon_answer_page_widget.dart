import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ippon_answer_page_model.dart';
export 'ippon_answer_page_model.dart';

/// // ゲーム画面（回答入力）をレンダリング
///     function renderGameScreen() {
///         const playerNumber = gameState.currentPlayerIndex + 1;
///         const currentQuestion = gameState.currentQuestion;
///
///         const skipButtonHtml = gameState.currentPlayerIndex === 0 ?
///
/// `
///             <button id="skip-btn" class="flex-1 bg-gray-500
/// hover:bg-gray-600 text-white font-bold py-3 px-6 rounded-xl shadow-lg
/// transition duration-300 transform hover:scale-105">
///                 <i class="fas fa-redo mr-2"></i> 次のお題
///             </button>
///         ` : '';
///
///         render(`
///             <h2 class="text-2xl font-bold mb-4">お題</h2>
///             <p class="text-center text-lg mb-4 p-4 rounded-xl bg-green-700
/// w-full">${currentQuestion}</p>
///             <p class="text-lg font-bold mb-4">プレイヤー${playerNumber}の番です</p>
///             <textarea id="answer-input" class="w-full h-24 p-3 rounded-lg
/// bg-green-700 text-white placeholder-green-200 focus:outline-none
/// focus:ring-2 focus:ring-green-500" placeholder="面白い回答をどうぞ..."></textarea>
///             <div id="error-message" class="text-yellow-400 mt-2
/// hidden"></div>
///             <div class="flex w-full mt-4 space-x-4">
///                 ${skipButtonHtml}
///                 <button id="next-btn"
/// class="${gameState.currentPlayerIndex === 0 ? 'flex-1' : 'w-full'}
/// bg-green-500 hover:bg-green-600 text-white font-bold py-3 px-6 rounded-xl
/// shadow-lg transition duration-300 transform hover:scale-105">
///                     <i class="fas fa-forward mr-2"></i> 次の人へ
///                 </button>
///             </div>
///         `);
///
///         document.getElementById('next-btn').addEventListener('click',
/// nextPlayer);
///
///         if (gameState.currentPlayerIndex === 0) {
///             document.getElementById('skip-btn').addEventListener('click',
/// skipQuestion);
///         }
///     }
class IpponAnswerPageWidget extends StatefulWidget {
  const IpponAnswerPageWidget({
    super.key,
    required this.participantsNumber,
  });

  final int? participantsNumber;

  static String routeName = 'IpponAnswerPage';
  static String routePath = '/ipponAnswerPage';

  @override
  State<IpponAnswerPageWidget> createState() => _IpponAnswerPageWidgetState();
}

class _IpponAnswerPageWidgetState extends State<IpponAnswerPageWidget> {
  late IpponAnswerPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => IpponAnswerPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().odaiNum =
          random_data.randomInteger(0, FFAppState().ipponTheme.length);
      FFAppState().update(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        backgroundColor: Color(0xFF1A5F3A),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          FFLocalizations.of(context).getText(
                            'nqahyd47' /* 大喜利ゲーム */,
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineMedium
                                    .fontStyle,
                              ),
                        ),
                        Text(
                          FFLocalizations.of(context).getText(
                            'z9zto3bs' /* お題 */,
                          ),
                          textAlign: TextAlign.center,
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                                color: Colors.white,
                                fontSize: 24.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.bold,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .headlineLarge
                                    .fontStyle,
                              ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFF22C55E),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: AutoSizeText(
                                valueOrDefault<String>(
                                  FFLocalizations.of(context).languageCode ==
                                          'ja'
                                      ? valueOrDefault<String>(
                                          FFAppState()
                                              .ipponTheme
                                              .elementAtOrNull(
                                                  FFAppState().odaiNum),
                                          'error',
                                        )
                                      : valueOrDefault<String>(
                                          FFAppState()
                                              .ipponThemeEnglish
                                              .elementAtOrNull(
                                                  FFAppState().odaiNum),
                                          'error',
                                        ),
                                  'error',
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '${FFLocalizations.of(context).languageCode == 'ja' ? 'プレイヤー' : 'player'}${_model.playerNum.toString()}${FFLocalizations.of(context).languageCode == 'ja' ? 'の番です' : '\'s turn.'}',
                          textAlign: TextAlign.center,
                          style:
                              FlutterFlowTheme.of(context).titleLarge.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleLarge
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .fontStyle,
                                  ),
                        ),
                        TextFormField(
                          controller: _model.textController,
                          focusNode: _model.textFieldFocusNode,
                          autofocus: true,
                          textCapitalization: TextCapitalization.sentences,
                          textInputAction: TextInputAction.done,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintText: FFLocalizations.of(context).getText(
                              '0y4j1uii' /* 面白い回答をどうぞ... */,
                            ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xB3FFFFFF),
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF16A34A),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFF22C55E),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor: Color(0xFF22C55E),
                            contentPadding: EdgeInsets.all(16.0),
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                          maxLines: 4,
                          minLines: 4,
                          keyboardType: TextInputType.multiline,
                          cursorColor: Colors.white,
                          validator: _model.textControllerValidator
                              .asValidator(context),
                          inputFormatters: [
                            if (!isAndroid && !isiOS)
                              TextInputFormatter.withFunction(
                                  (oldValue, newValue) {
                                return TextEditingValue(
                                  selection: newValue.selection,
                                  text: newValue.text.toCapitalization(
                                      TextCapitalization.sentences),
                                );
                              }),
                          ],
                        ),
                        if (_model.textController.text == '')
                          Text(
                            '',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.inter(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: Color(0xFFFDE047),
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                      ].divide(SizedBox(height: 24.0)),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (_model.playerNum == 1)
                          Expanded(
                            child: FFButtonWidget(
                              onPressed: () async {
                                FFAppState().odaiNum =
                                    random_data.randomInteger(
                                        0, FFAppState().ipponTheme.length);
                                FFAppState().update(() {});
                              },
                              text: FFLocalizations.of(context).getText(
                                'zv5rq76s' /* 次のお題 */,
                              ),
                              icon: Icon(
                                Icons.refresh_rounded,
                                size: 20.0,
                              ),
                              options: FFButtonOptions(
                                height: 56.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 16.0, 24.0, 16.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconColor: Colors.white,
                                color: Color(0xFF6B7280),
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      font: GoogleFonts.interTight(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .fontStyle,
                                      ),
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                elevation: 3.0,
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                          ),
                        Expanded(
                          child: FFButtonWidget(
                            onPressed: () async {
                              if (_model.playerNum ==
                                  widget.participantsNumber) {
                                FFAppState().addToIpponAppState(
                                    FFLocalizations.of(context).languageCode ==
                                            'ja'
                                        ? IpponsStruct(
                                            ipponUserName: (int num) {
                                              return "プレイヤー$num";
                                            }(_model.playerNum),
                                            ipponEvaluated: false,
                                            ipponAnswer:
                                                _model.textController.text,
                                            sortRandomNum: random_data
                                                .randomInteger(0, 300),
                                          )
                                        : IpponsStruct(
                                            ipponUserName: (int num) {
                                              return "player$num";
                                            }(_model.playerNum),
                                            ipponEvaluated: false,
                                            ipponAnswer:
                                                _model.textController.text,
                                            sortRandomNum: random_data
                                                .randomInteger(0, 300),
                                          ));
                                FFAppState().update(() {});
                                await actions.shuffleAppState(
                                  FFAppState().ipponAppState.toList(),
                                );

                                context
                                    .pushNamed(IpponVotePageWidget.routeName);
                              } else {
                                if (_model.textController.text != '') {
                                  FFAppState().addToIpponAppState(
                                      FFLocalizations.of(context)
                                                  .languageCode ==
                                              'ja'
                                          ? IpponsStruct(
                                              ipponUserName: (int num) {
                                                return "プレイヤー$num";
                                              }(_model.playerNum),
                                              ipponEvaluated: false,
                                              ipponAnswer:
                                                  _model.textController.text,
                                              sortRandomNum: random_data
                                                  .randomInteger(0, 300),
                                            )
                                          : IpponsStruct(
                                              ipponUserName: (int num) {
                                                return "player$num";
                                              }(_model.playerNum),
                                              ipponEvaluated: false,
                                              ipponAnswer:
                                                  _model.textController.text,
                                              sortRandomNum: random_data
                                                  .randomInteger(0, 300),
                                            ));
                                  FFAppState().update(() {});
                                  _model.playerNum = _model.playerNum + 1;
                                  safeSetState(() {});
                                  safeSetState(() {
                                    _model.textController?.clear();
                                  });
                                } else {
                                  return;
                                }
                              }
                            },
                            text: FFLocalizations.of(context).getText(
                              'mgdi4xd0' /* 次の人へ */,
                            ),
                            icon: Icon(
                              Icons.arrow_forward_rounded,
                              size: 20.0,
                            ),
                            options: FFButtonOptions(
                              height: 56.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 16.0, 24.0, 16.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconColor: Colors.white,
                              color: Color(0xFF22C55E),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(width: 16.0)),
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
