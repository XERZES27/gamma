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

Map<String, String> coverToTrailer = {
  "1.jpg": "https://www.youtube.com/watch?v=W1Jfg2YI1UY",
  "2.jpg": "https://www.youtube.com/watch?v=Ify9S7hj480",
  "3.jpg": "https://www.youtube.com/watch?v=W00grJNOIVo",
  "4.jpg": "https://www.youtube.com/watch?v=Y_qaE2Y-nQg",
  "5.jpg": "https://www.youtube.com/watch?v=C3MYVeGSuXk",
  "6.jpg": "https://www.youtube.com/watch?v=sKiRFUcUWHA",
  "7.jpg": "https://www.youtube.com/watch?v=sOKjgG3nSII",
  "8.jpg": "https://www.youtube.com/watch?v=bkxJ0DojPJ4",
  "9.jpg": "https://www.youtube.com/watch?v=hEJnMQG9ev8",
  "10.jpg": "https://www.youtube.com/watch?v=PvYyKTZtUG0",
  "11.jpg": "https://www.youtube.com/watch?v=6kw1UVovByw",
};

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
