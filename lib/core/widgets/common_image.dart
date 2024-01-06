import 'dart:io' as io;

import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_svg/flutter_svg.dart';

enum HybridImageType {
  network,
  asset,
}


class CommonImage extends StatefulWidget {
  final io.File? file;
  final String? assetPath;
  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Map<String, String>? headers;
  final AlignmentGeometry alignment;
  final HybridImageType? type;

  /// Factory for [CommonImage] that returns a widget with a network image for both svg and other image types.
  /// [imageUrl] is the url of the image and is required.
  factory CommonImage.network(
      String imageUrl, {
        Key? key,
        Map<String, String>? headers,
        double? width,
        double? height,
        BoxFit fit = BoxFit.contain,
        AlignmentGeometry alignment = Alignment.center,
      }) =>
      CommonImage._(
        key: key,
        type: HybridImageType.network,
        headers: headers,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
        imageUrl: imageUrl,
      );

  /// Factory for [CommonImage] that returns a widget with an asset image for both svg and other image types.
  /// [assetPath] is the local path of the image and is required.
  factory CommonImage.asset(
      String assetPath, {
        Key? key,
        double? width,
        double? height,
        BoxFit fit = BoxFit.contain,
        AlignmentGeometry alignment = Alignment.center,
      }) =>
      CommonImage._(
        key: key,
        type: HybridImageType.asset,
        assetPath: assetPath,
        width: width,
        height: height,
        fit: fit,
        alignment: alignment,
      );

  CommonImage._({
    Key? key,
    required this.type,
    this.imageUrl,
    this.file,
    this.assetPath,
    this.width,
    this.height,
    this.alignment = Alignment.center,
    this.fit = BoxFit.contain,
    this.headers,
  })  : assert(type == HybridImageType.network ||
      type == HybridImageType.asset),
        assert(type == HybridImageType.network
            ? imageUrl != null && Uri.parse(imageUrl).isAbsolute
            : true),
        assert(type == HybridImageType.asset
            ? assetPath != null && assetPath.isNotEmpty
            : true),
        super(key: key);

  @override
  _CommonImageState createState() => _CommonImageState();
}

class _CommonImageState extends State<CommonImage> {
  late Uri? uri;
  late String fileExtension;

  @override
  void initState() {
    if (widget.type == HybridImageType.network) {
      uri = Uri.parse(widget.imageUrl!);
      fileExtension = path.extension(uri!.pathSegments.last);
    }
    if (widget.type == HybridImageType.asset) {
      final file = io.File(widget.assetPath!);
      fileExtension =path.extension(path.basename(file.path));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case HybridImageType.network:
        if (fileExtension == '.svg') {
          return SvgPicture.network(
            widget.imageUrl!,
            width: widget.width,
            height: widget.height,
            fit: widget.fit,
            headers: widget.headers,
            alignment: widget.alignment,
          );
        }

        return Image.network(
          widget.imageUrl!,
          width: widget.width,
          height: widget.height,
          fit: widget.fit,
          headers: widget.headers,
          alignment: widget.alignment,
        );
      case HybridImageType.asset:
        if (fileExtension == '.svg') {
          return SvgPicture.asset(
            widget.assetPath!,
            width: widget.width,
            height: widget.height,
            fit: widget.fit,
          );
        }

        return Image.asset(
          widget.assetPath!,
          width: widget.width,
          height: widget.height,
          fit: widget.fit,
        );


        return Image.file(
          widget.file!,
          width: widget.width,
          height: widget.height,
          fit: widget.fit,
        );
      default:
        return const SizedBox();
    }
  }
}
