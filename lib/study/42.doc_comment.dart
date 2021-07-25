class Hero {
  /// * [name] = name of hero, default value is `No Name` as *String*
  final String name;

  /// * [role] = role of hero, default value is `No Role` as *String*
  final String role;

  /// Constructor
  ///
  /// have two optional name parameters
  /// * [name] --> **String**
  /// * [role] --> **String**
  ///
  /// Example :
  ///
  /// ```
  /// final Hero myhero = Hero(name: 'Tigreal', role: 'tank');
  /// ```
  Hero({this.name = "No Name", this.role = "No Role"});

  void attackEnemy() {
    print('${this.name} is attacking the enemy');
  }

  void checkRole() {
    print('This hero is ${this.role}');
  }
}

void main() {
  Hero hero = Hero();
  hero.attackEnemy();
}
