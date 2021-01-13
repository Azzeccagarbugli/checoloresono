import 'package:checoloresono/common/color_information.dart';
import 'package:checoloresono/common/constants.dart';
import 'package:checoloresono/models/region.dart';
import 'package:checoloresono/models/title_paragraph.dart';
import 'package:flutter/material.dart';

class NotAllowed extends StatelessWidget {
  const NotAllowed({
    Key key,
    @required Region region,
    @required TitleParagraph titleParagraph,
  })  : _region = region,
        _titleParagraph = titleParagraph,
        super(key: key);

  final Region _region;
  final TitleParagraph _titleParagraph;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: kSpaceS),
      decoration: BoxDecoration(
        borderRadius: kBorderRadius,
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.all(kSpaceS),
            padding: const EdgeInsets.all(kSpaceS),
            decoration: BoxDecoration(
              color: _region.color,
              borderRadius: kBorderRadius,
            ),
            child: Row(
              children: [
                Icon(
                  _titleParagraph.icon,
                  color: Colors.white,
                ),
                SizedBox(
                  width: kSpaceS,
                ),
                SelectableText(
                  _titleParagraph.title.toUpperCase(),
                  maxLines: 1,
                  style: TextStyle(
                    fontFamily: 'Plex',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kSpaceS),
                  child: Icon(
                    Icons.lens,
                    size: 12,
                    color: Colors.white38,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.fromLTRB(kSpaceM, kSpaceXS, kSpaceM, kSpaceM),
            child: SelectableText(
              ColorInformation(region: _region, titleParagraph: _titleParagraph)
                  .check(),
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 16,
                height: 1.4,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
