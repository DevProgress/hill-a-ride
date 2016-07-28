class window.Facebook
  
  bindShareButton: (selector, url) ->
    $(selector).click ->
      FB.ui
        method: 'share'
        href: url