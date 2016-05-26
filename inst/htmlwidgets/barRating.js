HTMLWidgets.widget({

  name: 'barRating',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        // TODO: code to render the widget, e.g.
//        el.innerText = x.message;

            $('#example').barrating({
              theme: 'bars-1to10'
            });

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
