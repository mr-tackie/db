class StringUtil {
  static currencySymbolToString(String s) {
    switch(s){
      case "USD" :
        return "\$";
        break;
      default: 
        break;
    }

    return s;
  }
}
