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
        if(x.includeEmpty) {  // include an empty value
          var opt_empty = document.createElement("option");
          opt_empty.value = '';
          opt_empty.text = '';
          mySelect.appendChild(opt_empty);
        }

        for (var i = 0; i < x.choices.length; i++) {
            var opt = document.createElement("option");
            opt.value = x.choices[i];
            opt.text = x.choices[i];
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

        // Select value
        if (x.selected && x.choices.indexOf(x.selected) >= 0) {
          $(mySelect).barrating('set', x.selected);
        }

      },

      resize: function(width, height) {

        // TODO: code to re-render the widget with a new size

      }

    };
  }
});
