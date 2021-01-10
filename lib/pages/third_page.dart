import 'package:checoloresono/common/constants.dart';
import 'package:checoloresono/widgets/limit_container.dart';
import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({
    Key key,
    @required String nameRegion,
    @required String colorRegion,
  })  : _nameRegion = nameRegion,
        _colorRegion = colorRegion,
        super(key: key);

  final String _nameRegion;
  final String _colorRegion;

  @override
  Widget build(BuildContext context) {
    return LimitContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text(
          //   _nameRegion,
          //   style: TextStyle(
          //     fontWeight: FontWeight.bold,
          //     fontSize: 32,
          //   ),
          // ),
          SizedBox(height: kSpaceS),
          Container(
            padding: const EdgeInsets.all(kSpaceM),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: kBorderRadius,
            ),
            child: ListTile(
              title: Text(
                _nameRegion,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                'La seguente regione è di colore $_colorRegion, si prega di rispettare le norme vigenti per questo determinato colore',
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
