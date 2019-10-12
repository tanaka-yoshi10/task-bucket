import jQuery from 'jquery'

import 'popper.js'
import 'bootstrap'
import '../javascripts/vue'
import '@fortawesome/fontawesome-free/js/all'
import Turbolinks from 'turbolinks'

import Rails from '@rails/ujs'

import './calendar'
import './date_picker'
import './time_picker'
import './tasks'

// CSS
import '../stylesheets/application'

// NOTE: jQuery依存ライブラリ対策
window.jQuery = jQuery
window.$ = jQuery
Rails.start()
Turbolinks.start()
