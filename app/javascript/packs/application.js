import flatpickr from 'flatpickr';
import 'mapbox-gl/dist/mapbox-gl.css';
import 'bootstrap';

import { initMapbox } from '../plugins/init_mapbox';
import { smoothScrolling } from '../plugins/smooth_scrolling'

document.addEventListener("turbolinks:load", function() {
  initMapbox();
  smoothScrolling();
})

flatpickr("#datepicker", {

});
