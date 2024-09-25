String getPlainText(String htmlText) {
  // Remove HTML tags using a regular expression
  return htmlText.replaceAll(RegExp(r'<[^>]+>|&nbsp;'), '');
}

String getMillionCount(int count) {
  if (count > 1000000000) {
    return '${(count / 1000000000).toStringAsFixed(1)}B';
  }

  if (count > 1000000) {
    return '${(count / 1000000).toStringAsFixed(1)}M';
  } else {
    return count.toString();
  }
}
