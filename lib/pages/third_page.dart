import 'package:checoloresono/common/constants.dart';
import 'package:checoloresono/common/remove_glow.dart';
import 'package:checoloresono/models/region.dart';
import 'package:checoloresono/models/title_paragraph.dart';
import 'package:checoloresono/widgets/black_button.dart';
import 'package:checoloresono/widgets/limit_container.dart';
import 'package:checoloresono/widgets/not_allowed.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({
    Key key,
    @required String nameRegion,
    @required Region region,
    @required String date,
    @required Function onPressed,
    @required bool toggleOpacity,
  })  : _nameRegion = nameRegion,
        _region = region,
        _date = date,
        _onPressed = onPressed,
        _toggleOpacity = toggleOpacity,
        super(key: key);

  final String _nameRegion;
  final String _date;
  final Region _region;
  final bool _toggleOpacity;
  final Function _onPressed;

  List<ListItem> _list() => [
        MainCard(nameRegion: _nameRegion, date: _date, region: _region),
        LateralInformation(
          region: _region,
          titleParagraph: TitleParagraph.COPRIFUOCO,
        ),
        LateralInformation(
          region: _region,
          titleParagraph: TitleParagraph.SPOSTAMENTI,
        ),
        LateralInformation(
          region: _region,
          titleParagraph: TitleParagraph.NEGOZI,
        ),
        LateralInformation(
          region: _region,
          titleParagraph: TitleParagraph.BARERISTORAZIONE,
        ),
        LateralInformation(
          region: _region,
          titleParagraph: TitleParagraph.SERVIZIALLAPERSONA,
        ),
        LateralInformation(
          region: _region,
          titleParagraph: TitleParagraph.SPORTS,
        ),
        LateralInformation(
          region: _region,
          titleParagraph: TitleParagraph.VISITAACASA,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: kDuration,
      opacity: _toggleOpacity ? 1.0 : 0.0,
      child: ScrollConfiguration(
        behavior: RemoveGlow(),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              shape: RoundedRectangleBorder(borderRadius: kBorderRadius),
              snap: false,
              collapsedHeight: 300,
              elevation: 0,
              backgroundColor: Colors.transparent,
              flexibleSpace: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kSpaceS,
                ),
                child: Container(
                  margin: const EdgeInsets.all(kSpaceS),
                  child: FractionallySizedBox(
                      heightFactor: 0.25,
                      child: LimitContainer(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: kSpaceS,
                          ),
                          child: BlackButton(
                            onPressed: _onPressed,
                            widget: Text(
                              'Torna indietro'.toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.9,
                                fontFamily: 'Plex',
                              ),
                            ),
                            iconData: Icons.settings_backup_restore_rounded,
                          ),
                        ),
                      )),
                ),
              ),
              expandedHeight: 300,
            ),
            SliverPadding(
              padding: const EdgeInsets.only(bottom: kSpaceS),
              sliver: ScrollConfiguration(
                behavior: RemoveGlow(),
                child: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final item = _list()[index];

                      if (item is MainCard) {
                        return LimitContainer(
                          child: item.buildMainCard(context),
                        );
                      } else {
                        return LimitContainer(
                          child: item.buildLateralInformation(context),
                        );
                      }
                    },
                    childCount: _list().length,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

abstract class ListItem {
  Widget buildMainCard(BuildContext context);

  Widget buildLateralInformation(BuildContext context);
}

class LateralInformation implements ListItem {
  const LateralInformation({
    @required Region region,
    @required TitleParagraph titleParagraph,
  })  : _region = region,
        _titleParagraph = titleParagraph;

  final Region _region;
  final TitleParagraph _titleParagraph;

  @override
  Widget buildLateralInformation(BuildContext context) {
    return NotAllowed(
      region: _region,
      titleParagraph: _titleParagraph,
    );
  }

  @override
  Widget buildMainCard(BuildContext context) => null;
}

class MainCard implements ListItem {
  const MainCard({
    @required String nameRegion,
    @required String date,
    @required Region region,
  })  : _nameRegion = nameRegion,
        _date = date,
        _region = region;

  final String _nameRegion;
  final String _date;
  final Region _region;

  @override
  Widget buildMainCard(BuildContext context) {
    return RegionCard(
      nameRegion: _nameRegion,
      date: _date,
      region: _region,
    );
  }

  @override
  Widget buildLateralInformation(BuildContext context) => null;
}

class RegionCard extends StatefulWidget {
  const RegionCard({
    Key key,
    @required String nameRegion,
    @required String date,
    @required Region region,
  })  : _nameRegion = nameRegion,
        _date = date,
        _region = region,
        super(key: key);

  final String _nameRegion;
  final String _date;
  final Region _region;

  @override
  _RegionCardState createState() => _RegionCardState();
}

class _RegionCardState extends State<RegionCard> {
  bool _isSaved;

  @override
  void initState() {
    super.initState();
    _isSaved = false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kSpaceM),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: kBorderRadius,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              SelectableText(
                widget._nameRegion,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  letterSpacing: 0.9,
                  color: Colors.grey[800],
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isSaved = !_isSaved;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: AnimatedCrossFade(
                    firstChild: Icon(
                      Icons.favorite_outline_rounded,
                      color: Colors.red,
                    ),
                    secondChild: Icon(
                      Icons.favorite_rounded,
                      color: Colors.red,
                    ),
                    crossFadeState: _isSaved
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: kDuration,
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: kSpaceS),
            height: kSpaceXS,
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: kBorderRadius,
            ),
          ),
          SelectableText.rich(
            TextSpan(
              text: 'La regione selezionata, in data ${widget._date}, è di ',
              style: TextStyle(
                fontFamily: 'Computer Modern',
                fontWeight: FontWeight.w200,
                fontSize: 16,
                height: 1.4,
                color: Colors.grey[700],
              ),
              children: [
                TextSpan(
                  text: 'colore ${widget._region.name}',
                  style: TextStyle(
                    fontFamily: 'Computer Modern',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                    color: widget._region.color,
                  ),
                ),
                TextSpan(
                  text:
                      ', si prega di rispettare le seguenti norme vigenti per questo determinato colore',
                  style: TextStyle(
                    fontFamily: 'Computer Modern',
                    fontWeight: FontWeight.w200,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
