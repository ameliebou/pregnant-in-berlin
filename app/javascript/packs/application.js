import 'mapbox-gl/dist/mapbox-gl.css';
import 'bootstrap';

import { initMapbox } from '../plugins/init_mapbox';
import { timeline } from '../plugins/timeline';
import { smoothScrolling } from '../plugins/smooth_scrolling'

initMapbox();
timeline();
smoothScrolling();
