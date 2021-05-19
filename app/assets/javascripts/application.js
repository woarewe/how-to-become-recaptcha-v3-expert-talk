let initRecaptcha = function () {
  document.querySelectorAll('[data-recaptcha-site-key]').forEach((element) => {
    let token = element.dataset.recaptchaSiteKey;

    grecaptcha.ready(function() {
      grecaptcha.execute(token, { action: 'submit' }).then(function(token) {
        element.value  = token;
      });
    });
  });
};

document.addEventListener('DOMContentLoaded', () => {
  initRecaptcha();
});
