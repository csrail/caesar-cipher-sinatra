## Exploration
This is a simple Caesar Cipher made with sinatra. [Try it out!](https://csrail-caesar-cipher.herokuapp.com/)

This is a very simple encryption technique: it substitutes each letter with a different one based on a shift factor. For example, applying a shift factor of 10 to `Sinatra` will turn it into `Csxkdbk`. A negative number can also be used instead; -10 would result in `Iydqjhq`.


## Exposition
This application integrates a POST request to accept and render user input. The values submitted the in forms are accessed through the params hash - `params[:message]` and `params[:shift_factor]`. These are then fed, within the `post ('/')` block as arguments into ruby methods specificied in `cipher.rb`. The end result is being able to bring Ruby logic, normally limited to the command line interface, onto a web-based user-inteface ie, a webpage.

The ruby logic behind the cipher uses the modulus operator to distinguish what a number larger than 26 represents. Since there are only 26 letters in the alphabet, any number larger than 26 (or smaller than -26) represents an absolute value for the shift. Therefore a shift factor of 36 is interpreted as 10.

The CSS styling uses BEM syntax and the sass compiler. BEM syntax is a favourite of mine as it defines a clear way of labelling class names and therefore makes css styling much more modular and systematic.


## Excursion
I had difficulty showing the output of ruby logic that should only exist after a POST request and not during the default GET request. In particular the "Your Encrypted Message:" string should not be printed into the <p> element unless a POST request was made. Initially I kept assigning this string to an instance variable in the `post ('/')` block but on trying to run a GET request it would set me up with a `NoMethodError for Nil Class`. This made me assume that the issue was the instance variable did not exist in the `get ('/')` block and after assigning instance variables to mirror the ones done in the `post ('/')` block I still received the same or similar error related to Nil Class.

The solution to this problem was to assign the string to a local variable. By assigning it to a local variable, other requests are not aware of this variable. However it does have the limitation of not being able to be shared across multiple routes but perhaps this is intended.

I also had difficulty trying to implement a sass file. I initially thought it would link just like a normal css file linked via `<link href="stylesheet.scss">` but because sass is a compiled language, it needed to be accessed in a different manner. What you have to do instead is set up your link file as it points towards a css file. Then instead of providing a css file within the public folder, you proide an scss file of the same name in the views file and establish a `get ('/')` route for that scss file.

The GET route looks like this:
```ruby
get '/style.css' do
  scss :style
end
```
And it must be placed before all your other routes in order to render successfully. Don't forget to require the sass gem!

I have started to use partials within my views and it enables me to DRY out my html code without sacrificing any readability or maintainability. It's probably a highlight for a full stack developer being able to manage your front end this way.


## Expletives
Currently I am unable to format the `encrypted-message__paragraph` adequately as the default *whitespace* property for <p> elements collapses all whitespaces into a single line. The *whitespace* property for <pre> if set to pre-wrap or pre-line still does not render the text adequately as in-built line breaks within the text produce a jagged and jarring effect. I would have to write a script to parse through the `\r\n` of the text before feeding the text as a string into the cipher.


## Eggs
The placeholder text in the form are words from an anarchist visionary by the name of **Zaheer**. He is affiliated with the Red Lotus clan which believed that the balance of the world was disrupted when two mighty spirits - Raava, representing peace and light, and Vaatu, representing chaos and darkness - were separated from each other. Imbued with this ideal, Zaheer attempted to restore balance by abducting the Avatar. His efforts were thwarted and he was imprisoned by the Order of the White Lotus for what was considered a malicious and unforgivable act. He has been in isolation for 13 years since. The words that he speaks are after years of patience and meditation and having been granted powers of air bending due to Harmonic Convergence.

If you press the "encrypt" button but have no message to encrypt then the cipher responds with a passing remark. This response takes its reference from the **Polaris** title of the Cthulhu Mythos written by H.P. Lovecraft. In this short story, the Polaris is a star that constantly taunts the sleepless narrator by "winking hideously like an insane watching eye". It is always communicating; it may never know why or what the message it is trying to communicate but its intent to communicate is certain.
