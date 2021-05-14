import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class User_placeholder extends StatelessWidget {
  User_placeholder({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Pinned.fromPins(
          Pin(start: 0.0, end: 0.0),
          Pin(size: 212.0, middle: 0.5),
          child: Stack(
            children: <Widget>[
              Pinned.fromPins(
                Pin(size: 393.0, middle: 0.3875),
                Pin(size: 112.0, start: 0.0),
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: 393.0,
                    height: 262.0,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(startFraction: 0.0, endFraction: 0.0),
                          Pin(startFraction: 0.0, endFraction: -1.3393),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: const AssetImage(
                                    'assets/images/Bc_image_profile.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Pinned.fromPins(
                Pin(start: 15.5, end: 24.5),
                Pin(size: 98.0, end: 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xfffbfbfb),
                  ),
                ),
              ),
              Pinned.fromPins(
                Pin(start: 0.0, end: 0.0),
                Pin(size: 1.0, middle: 0.5332),
                child: SvgPicture.string(
                  _svg_lyip41,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromPins(
                Pin(size: 120.0, middle: 0.4952),
                Pin(size: 120.0, middle: 0.5652),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(9999.0, 9999.0)),
                    color: const Color(0xffffffff),
                    border:
                        Border.all(width: 1.0, color: const Color(0xff707070)),
                  ),
                ),
              ),
              Pinned.fromPins(
                Pin(size: 113.0, middle: 0.4969),
                Pin(size: 113.0, middle: 0.5657),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200.0),
                    image: DecorationImage(
                      image: const AssetImage(
                          'assets/images/Placeholder_profilePic.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Pinned.fromPins(
                Pin(size: 62.0, middle: 0.4892),
                Pin(size: 19.0, end: 17.0),
                child: Text(
                  'Username',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 14,
                    color: const Color(0xffab6832),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Pinned.fromPins(
                Pin(size: 54.0, start: 61.5),
                Pin(size: 16.0, middle: 0.6429),
                child: Text(
                  'Check-ins',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 12,
                    color: const Color(0xffab6832),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Pinned.fromPins(
                Pin(size: 84.0, end: 45.5),
                Pin(size: 16.0, middle: 0.6429),
                child: Text(
                  'types of coffee',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 12,
                    color: const Color(0xffab6832),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Pinned.fromPins(
                Pin(size: 28.0, middle: 0.184),
                Pin(size: 32.0, middle: 0.8),
                child: Text(
                  '54',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 24,
                    color: const Color(0xffab6832),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Pinned.fromPins(
                Pin(size: 28.0, middle: 0.8185),
                Pin(size: 32.0, middle: 0.8),
                child: Text(
                  '64',
                  style: TextStyle(
                    fontFamily: 'Segoe UI',
                    fontSize: 24,
                    color: const Color(0xffab6832),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

const String _svg_lyip41 =
    '<svg viewBox="0.0 112.5 433.0 1.0" ><path transform="translate(0.0, 112.5)" d="M 0 0 L 433 1" fill="none" stroke="#707070" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
