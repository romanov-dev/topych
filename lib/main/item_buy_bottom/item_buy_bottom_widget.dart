import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/general_button_widget.dart';
import '/components/need_auth_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/main/item_buy_view/item_buy_view_widget.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'item_buy_bottom_model.dart';
export 'item_buy_bottom_model.dart';

class ItemBuyBottomWidget extends StatefulWidget {
  const ItemBuyBottomWidget({
    super.key,
    required this.parameter1,
    this.parameter2,
  });

  final DocumentReference? parameter1;
  final ItemRecord? parameter2;

  @override
  State<ItemBuyBottomWidget> createState() => _ItemBuyBottomWidgetState();
}

class _ItemBuyBottomWidgetState extends State<ItemBuyBottomWidget> {
  late ItemBuyBottomModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ItemBuyBottomModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 14.0, 0.0, 14.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Builder(
              builder: (context) => InkWell(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () async {
                  if (loggedIn) {
                    if ((currentUserDocument?.favoriteItems?.toList() ?? [])
                        .contains(widget!.parameter1)) {
                      await currentUserReference!.update({
                        ...mapToFirestore(
                          {
                            'favorite_items':
                                FieldValue.arrayRemove([widget!.parameter1]),
                          },
                        ),
                      });
                    } else {
                      await currentUserReference!.update({
                        ...mapToFirestore(
                          {
                            'favorite_items':
                                FieldValue.arrayUnion([widget!.parameter1]),
                          },
                        ),
                      });
                    }
                  } else {
                    await showDialog(
                      barrierColor: Color(0xA8000000),
                      barrierDismissible: false,
                      context: context,
                      builder: (dialogContext) {
                        return Dialog(
                          elevation: 0,
                          insetPadding: EdgeInsets.zero,
                          backgroundColor: Colors.transparent,
                          alignment: AlignmentDirectional(0.0, 0.0)
                              .resolve(Directionality.of(context)),
                          child: WebViewAware(
                            child: NeedAuthViewWidget(),
                          ),
                        );
                      },
                    );
                  }
                },
                child: Container(
                  width: 56.0,
                  height: 56.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFEAEAEA),
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    children: [
                      if (!(currentUserDocument?.favoriteItems?.toList() ?? [])
                          .contains(widget!.parameter1))
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: SvgPicture.asset(
                                'assets/images/Heart.svg',
                                width: 28.0,
                                height: 28.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      if ((currentUserDocument?.favoriteItems?.toList() ?? [])
                          .contains(widget!.parameter1))
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: SvgPicture.asset(
                                'assets/images/Heart1.svg',
                                width: 28.0,
                                height: 28.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Builder(
                builder: (context) => wrapWithModel(
                  model: _model.generalButtonModel1,
                  updateCallback: () => safeSetState(() {}),
                  child: GeneralButtonWidget(
                    title: 'Купить',
                    isActive: true,
                    bgColor: Color(0xFFEAEAEA),
                    textColor: FlutterFlowTheme.of(context).primaryText,
                    onTap: () async {
                      if (loggedIn) {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          barrierColor: Color(0x5F000000),
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return WebViewAware(
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: ItemBuyViewWidget(
                                  item: widget!.parameter2!,
                                  buyType: 0,
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      } else {
                        await showDialog(
                          barrierColor: Color(0xA8000000),
                          barrierDismissible: false,
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: WebViewAware(
                                child: NeedAuthViewWidget(),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              child: Builder(
                builder: (context) => wrapWithModel(
                  model: _model.generalButtonModel2,
                  updateCallback: () => safeSetState(() {}),
                  child: GeneralButtonWidget(
                    title: 'В корзину',
                    isActive: true,
                    bgColor: Color(0xFFEAEAEA),
                    textColor: FlutterFlowTheme.of(context).primaryText,
                    onTap: () async {
                      if (loggedIn) {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          barrierColor: Color(0x5F000000),
                          enableDrag: false,
                          context: context,
                          builder: (context) {
                            return WebViewAware(
                              child: Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: ItemBuyViewWidget(
                                  item: widget!.parameter2!,
                                  buyType: 1,
                                ),
                              ),
                            );
                          },
                        ).then((value) => safeSetState(() {}));
                      } else {
                        await showDialog(
                          barrierColor: Color(0xA8000000),
                          barrierDismissible: false,
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: WebViewAware(
                                child: NeedAuthViewWidget(),
                              ),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ].divide(SizedBox(width: 16.0)),
        ),
      ),
    );
  }
}
