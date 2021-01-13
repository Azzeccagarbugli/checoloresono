import 'package:flutter/material.dart';

enum TitleParagraph {
  COPRIFUOCO,
  SPOSTAMENTI,
  NEGOZI,
  BARERISTORAZIONE,
  SERVIZIALLAPERSONA,
  SPORTS,
  VISITAACASA,
}

extension TitleParagraphExt on TitleParagraph {
  String get title {
    switch (this) {
      case TitleParagraph.COPRIFUOCO:
        return 'coprifuoco';
      case TitleParagraph.SPOSTAMENTI:
        return 'spostamenti';
      case TitleParagraph.NEGOZI:
        return 'negozi';
      case TitleParagraph.BARERISTORAZIONE:
        return 'bar e ristorazione';
      case TitleParagraph.SERVIZIALLAPERSONA:
        return 'servizi alla persona';
      case TitleParagraph.SPORTS:
        return 'attività sportiva';
      case TitleParagraph.VISITAACASA:
        return 'visita a casa';
      default:
        return 'non specificato';
    }
  }

  IconData get icon {
    switch (this) {
      case TitleParagraph.COPRIFUOCO:
        return Icons.shield;
      case TitleParagraph.SPOSTAMENTI:
        return Icons.directions_rounded;
      case TitleParagraph.NEGOZI:
        return Icons.shopping_bag_rounded;
      case TitleParagraph.BARERISTORAZIONE:
        return Icons.fastfood_rounded;
      case TitleParagraph.SERVIZIALLAPERSONA:
        return Icons.family_restroom_rounded;
      case TitleParagraph.SPORTS:
        return Icons.pool_rounded;
      case TitleParagraph.VISITAACASA:
        return Icons.home_rounded;
      default:
        return Icons.lens;
    }
  }
}
