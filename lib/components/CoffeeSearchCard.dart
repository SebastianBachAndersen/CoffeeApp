import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoffeeSearchCard extends StatelessWidget {
  CoffeeSearchCard({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 388.3,
          height: 129.0,
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
          ),
        ),
        Transform.translate(
          offset: Offset(88.3, 128.0),
          child: SizedBox(
            width: 299.0,
            height: 1.0,
            child: SvgPicture.string(
              _svg_2lhmur,
              allowDrawingOutsideViewBox: true,
            ),
          ),
        ),
        SizedBox(
          width: 290.0,
          height: 120.0,
          child: Stack(
            children: <Widget>[
              Container(
                width: 67.0,
                height: 120.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        const AssetImage('assets/images/coffeePlaceholder.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(73.0, 4.0),
                child: Text(
                  'Peets instant coffee',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 20,
                    color: const Color(0xffab6832),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Transform.translate(
                offset: Offset(73.0, 39.0),
                child: Text(
                  'Peets',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 18,
                    color: const Color(0xffab6832),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Transform.translate(
                offset: Offset(73.0, 68.0),
                child: Text(
                  'Instant coffee',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16,
                    color: const Color(0xffab6832),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Transform.translate(
                offset: Offset(140.3, 90.0),
                child: SizedBox(
                  width: 150.0,
                  height: 29.0,
                  child: SvgPicture.string(
                    _svg_2xolyp,
                    allowDrawingOutsideViewBox: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

const String _svg_2xolyp =
    '<svg viewBox="140.3 90.0 150.0 28.5" ><path transform="translate(137.25, 87.0)" d="M 18 25.90500068664551 L 27.27000045776367 31.5 L 24.81000137329102 20.95499992370605 L 33 13.85999965667725 L 22.21500015258789 12.94499969482422 L 18 3 L 13.78499984741211 12.94499969482422 L 3 13.85999965667725 L 11.1899995803833 20.95499992370605 L 8.729999542236328 31.5 L 18 25.90500068664551 Z" fill="#ab6832" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(167.25, 87.0)" d="M 18 25.90500068664551 L 27.27000045776367 31.5 L 24.81000137329102 20.95499992370605 L 33 13.85999965667725 L 22.21500015258789 12.94499969482422 L 18 3 L 13.78499984741211 12.94499969482422 L 3 13.85999965667725 L 11.1899995803833 20.95499992370605 L 8.729999542236328 31.5 L 18 25.90500068664551 Z" fill="#ab6832" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(197.25, 87.0)" d="M 18 25.90500068664551 L 27.27000045776367 31.5 L 24.81000137329102 20.95499992370605 L 33 13.85999965667725 L 22.21500015258789 12.94499969482422 L 18 3 L 13.78499984741211 12.94499969482422 L 3 13.85999965667725 L 11.1899995803833 20.95499992370605 L 8.729999542236328 31.5 L 18 25.90500068664551 Z" fill="#ab6832" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(227.25, 87.0)" d="M 18 25.90500068664551 L 27.27000045776367 31.5 L 24.81000137329102 20.95499992370605 L 33 13.85999965667725 L 22.21500015258789 12.94499969482422 L 18 3 L 13.78499984741211 12.94499969482422 L 3 13.85999965667725 L 11.1899995803833 20.95499992370605 L 8.729999542236328 31.5 L 18 25.90500068664551 Z" fill="#ab6832" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(257.25, 87.0)" d="M 33 13.85999965667725 L 22.21500015258789 12.92999935150146 L 18 3 L 13.78499984741211 12.94499969482422 L 3 13.85999965667725 L 11.1899995803833 20.95499992370605 L 8.729999542236328 31.5 L 18 25.90500068664551 L 27.27000045776367 31.5 L 24.82500076293945 20.95499992370605 L 33 13.85999965667725 Z M 18 23.10000038146973 L 18 9.149999618530273 L 20.56500053405762 15.20999908447266 L 27.13500022888184 15.77999877929688 L 22.15500068664551 20.09999847412109 L 23.65500068664551 26.51999855041504 L 18 23.10000038146973 Z" fill="#ab6832" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_2lhmur =
    '<svg viewBox="88.3 128.0 299.0 1.0" ><path transform="translate(88.25, 128.0)" d="M 0 0 L 299 0" fill="none" stroke="#ab6832" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
