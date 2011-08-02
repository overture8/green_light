$.validator.addMethod(
  "regex",
  function(value, element, regexp) {
    var check = false;
    var re = new RegExp(regexp);
    return this.optional(element) || re.test(value);
  },
  "You have entered an invalid value for this field"
);
