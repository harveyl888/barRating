HTMLWidgets.widget({

  name: 'barRating',

  type: 'output',

  factory: function(el, width, height) {

    // TODO: define shared variables for this instance

    return {

      renderValue: function(x) {

        // Access the widget div
        var myDiv = document.getElementById(el.id);

        // Create select list
        var mySelect = document.createElement("select");
        mySelect.id = el.id + "_select";
        myDiv.appendChild(mySelect);

        // Add options
        myoptions = ['1', '2', '3', '4'];
        for (var i = 0; i < myoptions.length; i++) {
            var opt = document.createElement("option");
            opt.value = myoptions[i];
            opt.text = myoptions[i];
            mySelect.appendChild(opt);
        }

        // Return value
        var myValue = el.id + "_value";
        $(mySelect).barrating({
          theme: 'bars-1to10',
          onSelect: function(value, text) {
            Shiny.onInputChange(myValue, value);
          }
        });

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
