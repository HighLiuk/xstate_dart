List<String> toStrings(value) => value is String
    ? [value]
    : value is List<String>
        ? value
        : [];
