import 'package:flutter/material.dart';
import 'package:tp3/app/hiragana/hiragana.dart';
import 'package:tp3/util/dimensions.dart';

class Learning extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      //BEN_REVIEW : Tu aurais pu utiliser un "GridView". Plus facile.
      child: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20.0),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10.0,
              crossAxisCount: 2,
              children: List<Widget>.generate(
                Hiraganas.length,
                //BEN_REVIEW : Cela aurait vallu la peine de placer la carte dans son propre Widget.
                (i) => Card(
                      child: Column(children: <Widget>[
                        Expanded(
                          child: Padding(
                              child: FittedBox(
                                child: Text(
                                  Hiraganas.keys.elementAt(i),
                                  textScaleFactor: FontScaleDisplay1,
                                ),
                              ),
                              padding: EdgeInsets.all(PaddingLarge)),
                        ),
                        Padding(
                          child: Text(Hiraganas.values.elementAt(i)),
                          padding: EdgeInsets.only(bottom: PaddingLarge),
                        )
                      ]),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
