import jQuery from 'jquery';

// NOTE: jQuery依存ライブラリ対策
window.jQuery = jQuery;
window.$ = jQuery;

import 'popper.js';
import 'bootstrap';

import Rails from 'rails-ujs';
Rails.start();

// CSS
import '../stylesheets/application';
