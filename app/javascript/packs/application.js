// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from '@rails/ujs';
import Turbolinks from 'turbolinks';
import * as ActiveStorage from '@rails/activestorage';
import 'channels';

document.addEventListener('DOMContentLoaded', function () {
  const registerBtn = document.getElementById('registerBtn');
  const loginBtn = document.getElementById('loginBtn');
  const registerForm = document.getElementById('registerForm');
  const loginForm = document.getElementById('loginForm');
  const registrationForm = document.getElementById('registrationForm');
  const existingUsers = document.getElementById('existingUsers');

  registerBtn.addEventListener('click', function () {
    registerForm.submit();
  });

  loginBtn.addEventListener('click', function () {
    loginForm.submit();
  });
});

Rails.start();
Turbolinks.start();
ActiveStorage.start();