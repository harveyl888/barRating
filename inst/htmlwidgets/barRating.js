

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
          theme: x.theme,
          initialRating: x.initialRating,
          showValues: x.showValues,
          showSelectedRating: x.showSelectedRating,
          deselectable: x.deselectable,
          reverse: x.reverse,
          readonly: x.readonly,
          fastClicks: x.fastClicks,
          hoverState: x.hoverState,
          silent: x.silent,
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


Shiny.addCustomMessageHandler('jsBarRatingUpdate', function(x) {
  $("#" + x.id +  "_select").barrating("set", x.value);
});

Shiny.addCustomMessageHandler('jsBarRatingClear', function(x) {
  $("#" + x.id +  "_select").barrating("clear");
});
