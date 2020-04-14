class Regex {
  static bool isEmailValide(String email) {
    if (email.length < 5) {
      return false;
    }
    final re = RegExp(
        r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return re.hasMatch(email);
  }
}

/*

export const validateEmail = (email) => {
  const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
  return re.test(email);
};

export const validateName = (name) => {
  const re = /^([A-Za-zéàëçèù-]{1,40} ?)+$/;
  return re.test(name);
};

export const validatePhone = (phone) => {
  const re = /^([0|+[0-9]{1,5})?([0-9]{10})$/g;

  return re.test(phone);
};

export const pwdSecurityLevel = (password) => {
  const strongRegex = new RegExp(
    '^((?=.*[a-z])((?=.*[A-Z])(?=.*\\d)(?=.*(?=.*[-+_!@#$%^&*.,?]))).{6,}|.{15,})$',
    'g',
  );
  const mediumRegex = new RegExp(
    '^((?=.*[a-z])((?=.*[A-Z])(?=.*\\d)|(?=.*[A-Z])(?=.*(?=.*[-+_!@#$%^&*.,?]))|(?=.*\\d)(?=.*[-+_!@#$%^&*.,?])).{6,}|.{12,})$',
    'g',
  );
  const weakRegex = new RegExp(
    '^((?=.*[a-z])((?=.*[A-Z])|(?=.*\\d)|(?=.*(?=.*[-+_!@#$%^&*.,?]))).{6,}|.{9,})$',
    'g',
  );

  if (password.length < 6) {
    return 'small';
  } else if (strongRegex.test(password)) {
    return 'strong';
  } else if (mediumRegex.test(password)) {
    return 'medium';
  } else if (weakRegex.test(password)) {
    return 'weak';
  }
  return 'unprotected';
};

export const valideInputFormatDate = (date, NoDay = false) => {
  let reg;
  if (NoDay) {
    reg = new RegExp('^d{2}/d{2}$', 'g');
  } else {
    reg = new RegExp('^d{2}/d{2}/d{4}$', 'g');
  }
  return reg.test(date);
};


*/
