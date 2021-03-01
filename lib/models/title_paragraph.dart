import 'package:flutter/material.dart';

enum TitleParagraph {
  coprifuoco,
  spostamenti,
  negozi,
  bareristorazione,
  serviziallapersona,
  sports,
  visitaacasa,
}

extension TitleParagraphExt on TitleParagraph {
  String get title {
    switch (this) {
      case TitleParagraph.coprifuoco:
        return 'coprifuoco';
      case TitleParagraph.spostamenti:
        return 'spostamenti';
      case TitleParagraph.negozi:
        return 'negozi';
      case TitleParagraph.bareristorazione:
        return 'bar e ristorazione';
      case TitleParagraph.serviziallapersona:
        return 'servizi alla persona';
      case TitleParagraph.sports:
        return 'attività sportiva';
      case TitleParagraph.visitaacasa:
        return 'visita a casa';
      default:
        return 'non specificato';
    }
  }

  IconData get icon {
    switch (this) {
      case TitleParagraph.coprifuoco:
        return Icons.shield;
      case TitleParagraph.spostamenti:
        return Icons.directions_rounded;
      case TitleParagraph.negozi:
        return Icons.shopping_bag_rounded;
      case TitleParagraph.bareristorazione:
        return Icons.fastfood_rounded;
      case TitleParagraph.serviziallapersona:
        return Icons.family_restroom_rounded;
      case TitleParagraph.sports:
        return Icons.pool_rounded;
      case TitleParagraph.visitaacasa:
        return Icons.home_rounded;
      default:
        return Icons.lens;
    }
  }
}
