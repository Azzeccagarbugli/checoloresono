import 'package:checoloresono/common/constants.dart';
import 'package:checoloresono/models/region.dart';
import 'package:flutter/material.dart';

class RegionCard extends StatelessWidget {
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
                _nameRegion,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  letterSpacing: 0.9,
                  color: Colors.grey[800],
                ),
              ),
              const Spacer(),
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.lens,
                  size: 12,
                  color: _region.color.withOpacity(0.6),
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
              text: 'La regione selezionata, in data $_date, è di ',
              style: TextStyle(
                fontFamily: 'Computer Modern',
                fontWeight: FontWeight.w200,
                fontSize: 16,
                height: 1.4,
                color: Colors.grey[700],
              ),
              children: [
                TextSpan(
                  text: 'colore ${_region.name}',
                  style: TextStyle(
                    fontFamily: 'Computer Modern',
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                    color: _region.color,
                  ),
                ),
                TextSpan(
                  text:
                      ', si prega di rispettare le seguenti norme vigenti per questo determinata zona.',
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
