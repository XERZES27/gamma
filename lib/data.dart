const covers = [
  "1.jpg",
  "2.jpg",
  "3.jpg",
  "4.jpg",
  "5.jpg",
  "6.jpg",
  "7.jpg",
  "8.jpg",
  "9.jpg",
  "10.jpg",
  "11.jpg",
];



enum CarouselType { recentlyAdded, continueWatching, mostWatched }

extension CarouselTypeExtension on CarouselType {
  String get string {
    switch (this) {
      case CarouselType.recentlyAdded:
        return 'Recently Added';
      case CarouselType.continueWatching:
        return 'Continue Watching';
      case CarouselType.mostWatched:
        return 'Most Watched';
    }
  }

  bool get shouldShuffle {
    switch (this) {
      case CarouselType.recentlyAdded:
        return false;
      default:
        return true;
    }
  }

  bool get showPlayButton {
    switch (this) {
      case CarouselType.continueWatching:
        return true;
      default:
        return false;
    }
  }
}
