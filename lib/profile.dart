// Clase perfil
class Profile {
  // Variables inmutables de cada perfil
  final String name, profileIcon, prestigeIcon, ratingIcon;
  final num wins, level, prestige, rating;

  // Constructor parametrizado de la clase
  Profile({
    this.name,
    this.profileIcon,
    this.prestigeIcon,
    this.ratingIcon,
    this.wins,
    this.level,
    this.prestige,
    this.rating,
  });

  // Constructor de factorizacion
  // Construye una instancia de Profile, a partir de un objeto
  // {nombre de la variable}: {variable json (mapa)}[nombre del parametro en el mapa]
  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'],
      profileIcon: json['icon'],
      prestigeIcon: json['prestigeIcon'],
      ratingIcon: json['ratingIcon'],
      wins: json['gamesWon'],
      level: json['level'],
      prestige: json['prestige'],
      rating: json['rating'],
    );
  }
}

/* OUTPUT
{
  "competitiveStats": {
    ...
  },
  "endorsement": 3,
  "endorsementIcon": "https://d3hmvhl7ru3t12.cloudfront.net/svg/icons/endorsement-frames-be58f32488898c106f2ad8b1c3012dbce42d19b758c4b18bf2afbe91fc8f1d2cc83a0de433321792ff0fb3a1f66d37ded31598bd538838b30fa4537db617926e.svg#_3",
  "gamesWon": 720,
  "icon": "https://d15f34w2p8l1cc.cloudfront.net/overwatch/6a8ec17712e30f15da75e994a71dff58293fbfddf4ff58cc81e19d3385254d14.png",
  "level": 94,
  "levelIcon": "https://d15f34w2p8l1cc.cloudfront.net/overwatch/1b00b8cab530e98c378de2f3e8834d92ee41b4cd7b118179a8ecbccee83c8104.png",
  "name": "SilveR#24635",
  "prestige": 2,
  "prestigeIcon": "https://d15f34w2p8l1cc.cloudfront.net/overwatch/1b00b8cab530e98c378de2f3e8834d92ee41b4cd7b118179a8ecbccee83c8104.png",
  "private": false,
  "quickPlayStats": {
    ...
  },
  "rating": 2085,
  "ratingIcon": "https://d1u1mce87gyfbn.cloudfront.net/game/rank-icons/rank-GoldTier.png"
}
*/
