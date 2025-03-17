class Constants {
  static const List<String> bookCategories = [
    "Fiction",
    "Non-Fiction",
    "Science",
    "Technology",
    "History",
    "Biography",
    "Fantasy",
    "Mystery",
    "Thriller",
    "Romance",
    "Horror",
    "Self-Help",
    "Poetry",
    "Comics",
    "Graphic Novels",
    "Science Fiction",
    "Adventure",
    "Philosophy",
    "Psychology",
    "Religion",
    "Spirituality",
    "Health & Wellness",
    "Education",
    "Business",
    "Finance",
    "Politics",
    "Law",
    "Sports",
    "Travel",
    "Cooking",
    "Art & Photography",
    "Music",
    "Mathematics",
    "Programming",
    "Engineering",
    "Medical",
    "Anthropology",
    "Linguistics",
    "Economics",
    "Astronomy",
    "Mythology",
    "Environment",
    "Classic Literature",
    "Young Adult",
    "Children's Books",
  ];
}

class LibraryBookStatus {
  static const String available = 'available';
  static const String unavailable = 'unavailable';
}

class UserRole {
  static const String admin = 'admin';
  static const String user = 'user';
}

String globalUserRole = UserRole.user;
List<String>? userFavoriteBooks = [];
String? userName;

class StudentBookStatus {
  static const String borrowed = 'borrowed';
  static const String pending = 'pending';
  static const String overDue = 'over_due';
  static const String declined = 'declined';
  static const String returned = 'returned';
}
