import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:t_o_p_y_c_h_mobile/flutter_flow/flutter_flow_theme.dart';

class NetworkImageView extends StatelessWidget {
  NetworkImageView({
    super.key,
    required this.image,
    BorderRadiusGeometry? borderRadius,
    required this.height,
    required this.width
  }) : borderRadius = borderRadius ?? BorderRadius.circular(8.0);

  final String image;
  final BorderRadiusGeometry borderRadius;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Image.network(
        image,
        width: width,
        height: height,
        fit: BoxFit.cover,
        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) {
            // Изображение загружено, возвращаем сам виджет изображения
            return child;
          }
          return Container(
            // padding: const EdgeInsets.all(10),
            color: Colors.black.withOpacity(0.05),
            width: width,
            height: height,
            child: Center(
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryText,
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            ),
          );
        },
        errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
          return Container(
            color: Colors.black.withOpacity(0.05),
            width: width,
            height: height,
            child: const Center(
              child: Icon(Icons.error, size: 50, color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}