import 'package:checoloresono/models/region.dart';
import 'package:checoloresono/models/title_paragraph.dart';

class ColorInformation {
  final Region region;
  final TitleParagraph titleParagraph;

  ColorInformation({
    this.region,
    this.titleParagraph,
  });

  String check() {
    switch (region) {
      case Region.ARANCIONE:
        break;
      case Region.ROSSO:
        break;
      case Region.GIALLO:
        break;
      default:
    }
  }

  String checkParagraph() {
    switch (titleParagraph) {
      case TitleParagraph.BARERISTORAZIONE:
        break;
      case TitleParagraph.COPRIFUOCO:
        break;
      case TitleParagraph.NEGOZI:
        break;
      case TitleParagraph.SERVIZIALLAPERSONA:
        break;
      case TitleParagraph.SPORTS:
        break;
      case TitleParagraph.VISITAACASA:
        break;
      case TitleParagraph.SPOSTAMENTI:
        break;
      default:
    }
  }
}
