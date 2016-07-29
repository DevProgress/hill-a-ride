$ ->
  fb = new Facebook
  fb_selector = "#facebook-share-link"
  fb.bindShareButton(fb_selector, $(fb_selector).attr("data-url"))