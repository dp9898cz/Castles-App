import 'package:flutter/foundation.dart';

import 'objects_provider.dart';

class TowersList with ChangeNotifier {
  List<Tower> _towers = [
    Tower(id: "jhfbhadf", title: "rozhledna", latitude: "49.231383N", longtitude: "14.297278E", categoryType: CategoryType.Hradni_rozhledny, city: 'Horní Moštěnice'),
    Tower(id: "eqargzf", title: "rozhlednasss", latitude: "49.241383N", longtitude: "14.357278E", categoryType: CategoryType.Hradni_rozhledny, city: 'dhgdzfdsg'),
    Tower(id: "rgetegtr", title: "rozhledna111", latitude: "49.251383N", longtitude: "14.847278E", categoryType: CategoryType.Hradni_rozhledny, city: 'Sfhdfzgsftc'),
    Tower(id: "sadae", title: "rozhledna Maňa", latitude: "49.281383N", longtitude: "14.117278E", categoryType: CategoryType.Hradni_rozhledny, city: 'Nová hoř'),
    Tower(id: "jhfbhadf", title: "rozhledna", latitude: "49.231383N", longtitude: "14.297278E", categoryType: CategoryType.Hradni_rozhledny, city: 'Horní Moštěnice'),
    Tower(id: "eqargzf", title: "rozhlednasss", latitude: "49.241383N", longtitude: "14.357278E", categoryType: CategoryType.Hradni_rozhledny, city: 'dhgdzfdsg'),
    Tower(id: "rgetegtr", title: "rozhledna111", latitude: "49.251383N", longtitude: "14.847278E", categoryType: CategoryType.Hradni_rozhledny, city: 'Sfhdfzgsftc'),
    Tower(id: "sadae", title: "rozhledna Maňa", latitude: "49.281383N", longtitude: "14.117278E", categoryType: CategoryType.Hradni_rozhledny, city: 'Nová hoř'),
  ];

  List<Tower> get towers {
    return [..._towers];
  }
}