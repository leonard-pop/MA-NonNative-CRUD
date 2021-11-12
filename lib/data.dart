class FoodItem {
  int id;
  String name;
  String category;
  String expiryDate;
  String notificationInterval;
  int notifyBeforeCount;
  String notifyBeforeScale;

  FoodItem({required this.id, required this.name, required this.category,
    required this.expiryDate, required this.notificationInterval,
    required this.notifyBeforeCount, required this.notifyBeforeScale});
}

List<FoodItem> dummyContent = <FoodItem>[
  FoodItem(id: 1, name: "White Bread", category: "Bread", expiryDate: "30/10/21",
      notificationInterval: "Daily", notifyBeforeCount: 10,
      notifyBeforeScale: "Days"),
  FoodItem(id: 2, name: "Multigrain Bread", category: "Bread", expiryDate: "20/10/21",
      notificationInterval: "Daily", notifyBeforeCount: 15,
      notifyBeforeScale: "Days"),
  FoodItem(id: 3, name: "Spaghetti", category: "Pasta", expiryDate: "20/10/21",
      notificationInterval: "Daily", notifyBeforeCount: 15,
      notifyBeforeScale: "Days"),
];