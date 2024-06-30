// responsive_util.dart

double getMaxWidtsh(double screenWidth) {
  if (screenWidth > 600) {
    return screenWidth / 3;
  } else if (screenWidth > 400) {
    return screenWidth / 2;
  } else {
    return screenWidth;
  }
}

double getMaxHeighst(double screenHeight) {
  if (screenHeight > 600) {
    return screenHeight / 3;
  } else if (screenHeight > 400) {
    return screenHeight / 2;
  } else {
    return screenHeight;
  }
}

double getMaxWidthPercentage(double screenWidth, double percentage) {
  return screenWidth * percentage;
}

double getMaxHeightPercentage(double screenHeight, double percentage) {
  return screenHeight * percentage;
}

double getMaxWidthMinusPadding(double screenWidth, double padding) {
  return screenWidth - padding;
}

double getMaxHeightMinusPadding(double screenHeight, double padding) {
  return screenHeight - padding;
}

double getMaxWidthMinusPaddingPercentage(double screenWidth, double padding) {
  return screenWidth - (screenWidth * padding);
}


