// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import $ from "jquery";
import axios from "axios";
import { csrfToken } from "rails-ujs";

axios.defaults.headers.common["X-CSRF-Token"] = csrfToken();

const handleHeartDisplay = (hasLiked) => {
  if (hasLiked) {
    $(".active_heart").removeClass("hidden");
  } else {
    $(".inactive_heart").removeClass("hidden");
  }
};

document.addEventListener("DOMContentLoaded", () => {
  const dataset = $("#post-show").data();
  const postId = dataset.postId;
  axios.get(`/posts/${postId}/like`).then((response) => {
    const hasLiked = response.data.hasLiked;
    handleHeartDisplay(hasLiked);
  });
  $(".inactive_heart").on("click", () => {
    const thisPostId = $(this).attr('id')
    debugger
    axios.post(`posts/${thisPostId}/like`)
      .then((response) => {
        if (response.data.status === "ok") {
          $("active_heart").removeClass("hidden");
          $("inactive_heart").addClass("hidden");
        }
      })
      .catch((e) => {
        window.alert("Error");
        console.log(e);
      });
  });
  $(".active_heart").on("click", () => {
    axios.delete(`posts/${postId}/like`)
      .then((response) => {
        $("active_heart").addClass("hidden");
        $("inactive_heart").removeClass("hidden");
      })
      .catch((e) => {
        window.alert("Error");
        console.log(e);
      });
  });
});
