// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import "../css/app.scss"

import $ from "jquery"

window.jQuery = $;
window.$ = $;

import "bootstrap"
import "phoenix_html"
import "ex_effective_bootstrap"
import "./sb-admin-2"
import "./jquery.dataTables"
import "./dataTables.bootstrap4"
import "./Chart"
import "./demo/chart-pie-demo"
import "./demo/chart-area-demo"

// Use the following for an effective_form_for() form
// inside a Phoenix LiveView live_render()
import {EffectiveFormLiveSocketHooks} from "ex_effective_bootstrap"

let Hooks = {}
Hooks.EffectiveForm = new EffectiveFormLiveSocketHooks

import {Socket} from "phoenix"
import NProgress from "nprogress"
import {LiveSocket} from "phoenix_live_view"

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {params: {_csrf_token: csrfToken}})

// Show progress bar on live navigation and form submits
window.addEventListener("phx:page-loading-start", info => NProgress.start())
window.addEventListener("phx:page-loading-stop", info => NProgress.done())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket

$(function () {
  $('[data-toggle="popover"]').popover();
  $('[data-toggle="tooltip"]').tooltip();
  $('#dataTable').DataTable();
});
