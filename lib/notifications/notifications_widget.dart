import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'notifications_model.dart';
export 'notifications_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({super.key});

  @override
  State<NotificationsWidget> createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  late NotificationsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NotificationsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).alternate,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30.0,
          buttonSize: 46.0,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 24.0,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Notification Settings',
          style: FlutterFlowTheme.of(context).headlineSmall,
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Divider(
            height: 2.0,
            thickness: 1.0,
            color: FlutterFlowTheme.of(context).primaryText,
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    'Choose what notifcations you want to recieve below and we will update the settings.',
                    style: FlutterFlowTheme.of(context).labelMedium,
                  ),
                ),
              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 0.0, 0.0),
                child: StreamBuilder<List<UserDetailsRecord>>(
                  stream: queryUserDetailsRecord(
                    singleRecord: true,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    List<UserDetailsRecord>
                        switchListTileUserDetailsRecordList = snapshot.data!;
                    // Return an empty Container when the item does not exist.
                    if (snapshot.data!.isEmpty) {
                      return Container();
                    }
                    final switchListTileUserDetailsRecord =
                        switchListTileUserDetailsRecordList.isNotEmpty
                            ? switchListTileUserDetailsRecordList.first
                            : null;
                    return SwitchListTile.adaptive(
                      value: _model.switchListTileValue ??= true,
                      onChanged: (newValue) async {
                        setState(() => _model.switchListTileValue = newValue!);
                      },
                      title: Text(
                        'Reminders',
                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Manrope',
                              lineHeight: 2.0,
                            ),
                      ),
                      subtitle: Text(
                        'Receive a  reminder every day at a specified time',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Manrope',
                              color: Color(0xFF8B97A2),
                            ),
                      ),
                      tileColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                      activeColor: FlutterFlowTheme.of(context).primary,
                      activeTrackColor: FlutterFlowTheme.of(context).accent1,
                      dense: false,
                      controlAffinity: ListTileControlAffinity.trailing,
                      contentPadding: EdgeInsetsDirectional.fromSTEB(
                          24.0, 12.0, 24.0, 12.0),
                    );
                  },
                ),
              ),
              if (_model.switchListTileValue ?? true)
                FFButtonWidget(
                  onPressed: () async {
                    final _datePickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(getCurrentTimestamp),
                      builder: (context, child) {
                        return wrapInMaterialTimePickerTheme(
                          context,
                          child!,
                          headerBackgroundColor:
                              FlutterFlowTheme.of(context).primary,
                          headerForegroundColor:
                              FlutterFlowTheme.of(context).info,
                          headerTextStyle: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: 'Montserrat',
                                fontSize: 32.0,
                                fontWeight: FontWeight.w600,
                              ),
                          pickerBackgroundColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          pickerForegroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                          selectedDateTimeBackgroundColor:
                              FlutterFlowTheme.of(context).primary,
                          selectedDateTimeForegroundColor:
                              FlutterFlowTheme.of(context).info,
                          actionButtonForegroundColor:
                              FlutterFlowTheme.of(context).primaryText,
                          iconSize: 24.0,
                        );
                      },
                    );
                    if (_datePickedTime != null) {
                      safeSetState(() {
                        _model.datePicked = DateTime(
                          getCurrentTimestamp.year,
                          getCurrentTimestamp.month,
                          getCurrentTimestamp.day,
                          _datePickedTime.hour,
                          _datePickedTime.minute,
                        );
                      });
                    }
                  },
                  text: 'Select Time',
                  options: FFButtonOptions(
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Manrope',
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                    elevation: 3.0,
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).primaryText,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
            child: FFButtonWidget(
              onPressed: () {
                print('Button-Login pressed ...');
              },
              text: 'Change Changes',
              options: FFButtonOptions(
                width: 190.0,
                height: 50.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).primaryText,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Manrope',
                      color: FlutterFlowTheme.of(context).primary,
                    ),
                elevation: 3.0,
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
