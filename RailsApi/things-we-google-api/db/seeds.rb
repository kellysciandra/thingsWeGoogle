# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

searches = 

    [
        { content: "Sometimes when i'm alone i use comic sans.", link: "https://www.google.com/search?q=Sometimes+when+i%27m+alone+i+use+comic+sans.&oq=Sometimes+when+i%27m+alone+i+use+comic+sans.&aqs=chrome..69i57j0l2.747j0j4&sourceid=chrome&ie=UTF-8" },
        { content: "Is it healthy to fart?", link: "https://www.google.com/search?q=is+it+healthy+to+fart&oq=is+it+healthy+to+fart&aqs=chrome..69i57j0l5.2423j0j9&sourceid=chrome&ie=UTF-8" },
        { content: "Someone call a vet our pets heads are falling off",link: "https://www.google.com/search?q=someone+call+a+vet+our+pets+heads+are+falling+off&oq=someone+call+a+vet+our+pets+heads+are+falling+off&aqs=chrome..69i57.1533j0j9&sourceid=chrome&ie=UTF-8" },
        { content: "I hate it when i forget to turn my swag off", link: "https://www.google.com/search?q=I+hate+it+when+i+forget+to+turn+my+swag+off&oq=I+hate+it+when+i+forget+to+turn+my+swag+off&aqs=chrome..69i57j33.908j0j4&sourceid=chrome&ie=UTF-8" },
        { content: "What would happen in i hired two private investigators to follow each other?", link: "https://www.google.com/search?q=What+would+happen+in+i+hired+two+private+investigators+to+follow+each+other%3F&oq=What+would+happen+in+i+hired+two+private+investigators+to+follow+each+other%3F&aqs=chrome..69i57j0.811j0j9&sourceid=chrome&ie=UTF-8" },
        { content: "Does your vision blur at 55 mph?", link: "https://www.google.com/search?q=Does+your+vision+blur+at+55+mph%3F&oq=Does+your+vision+blur+at+55+mph%3F&aqs=chrome..69i57j33.796j0j9&sourceid=chrome&ie=UTF-8" },
        { content: "I hate it when i'm studying and a velociraptor throws a banana at me", link: "https://www.google.com/search?q=I+hate+it+when+i%27m+studying+and+a+velociraptor+throws+a+banana+at+me&oq=I+hate+it+when+i%27m+studying+and+a+velociraptor+throws+a+banana+at+me&aqs=chrome..69i57.796j0j9&sourceid=chrome&ie=UTF-8" },
        { content: "What's a boyfriend and where can i download one?", link: "https://www.google.com/search?q=What%27s+a+boyfriend+and+where+can+i+download+one%3F&oq=What%27s+a+boyfriend+and+where+can+i+download+one%3F&aqs=chrome..69i57j0l2.810j0j9&sourceid=chrome&ie=UTF-8" },
        { content: "I hate it when i have to pretend to be my mom's boyfriend", link: "https://www.google.com/search?q=I+hate+it+when+i+have+to+pretend+to+be+my+mom%27s+boyfriend&oq=I+hate+it+when+i+have+to+pretend+to+be+my+mom%27s+boyfriend&aqs=chrome..69i57.734j0j9&sourceid=chrome&ie=UTF-8" },
        { content: "My cat looks like hitler", link: "https://www.google.com/search?q=%22My+cat+looks+like+hitler%22&oq=%22My+cat+looks+like+hitler%22&aqs=chrome..69i57.809j0j9&sourceid=chrome&ie=UTF-8" },
        { content: "Never put jam on a magnet", link: "https://www.google.com/search?q=Never+put+jam+on+a+magnet&oq=Never+put+jam+on+a+magnet&aqs=chrome..69i57j0l2.846j0j9&sourceid=chrome&ie=UTF-8" },
        { content: "Never put jam in a toaster", link: "https://www.google.com/search?q=Never+put+jam+in+a+toaster&oq=Never+put+jam+in+a+toaster&aqs=chrome..69i57j33l2.734j0j9&sourceid=chrome&ie=UTF-8" },
        { content: "Why isn't 11 prononuced onety one?", link: "https://www.google.com/search?q=Why+isn%27t+11+prononuced+onety+one%3F&oq=Why+isn%27t+11+prononuced+onety+one%3F&aqs=chrome..69i57j0l5.734j0j9&sourceid=chrome&ie=UTF-8" },
        { content: "Why isn't kate middleton a princess?", link: "https://www.google.com/search?q=Why+isn%27t+kate+middleton+a+princess%3F&oq=Why+isn%27t+kate+middleton+a+princess%3F&aqs=chrome..69i57.733j0j9&sourceid=chrome&ie=UTF-8" },
        { content: "How come when i talk to girls on facebook they don't answer me back?", link: "https://www.google.com/search?q=How+come+when+i+talk+to+girls+on+facebook+they+don%27t+answer+me+back%3F&oq=How+come+when+i+talk+to+girls+on+facebook+they+don%27t+answer+me+back%3F&aqs=chrome..69i57.821j0j9&sourceid=chrome&ie=UTF-8" },
        { content: "Can jesus microwave a burrito?", link: "https://www.google.com/search?q=Can+jesus+microwave+a+burrito%3F&oq=Can+jesus+microwave+a+burrito%3F&aqs=chrome..69i57j0l4.839j0j9&sourceid=chrome&ie=UTF-8" },
        { content: "What are these strawberries doin on my nipples i need them for the fruit salad?", link: "https://www.google.com/search?q=What+are+these+strawberries+doin+on+my+nipples+i+need+them+for+the+fruit+salad%3F&oq=What+are+these+strawberries+doin+on+my+nipples+i+need+them+for+the+fruit+salad%3F&aqs=chrome..69i57.795j0j9&sourceid=chrome&ie=UTF-8" },
        { content: "Why does my poop float?", link: "https://www.google.com/search?q=why+does+my+poop+float&oq=why+does+my+poop+float&aqs=chrome..69i57j0l5.1146j0j9&sourceid=chrome&ie=UTF-8" },
        { content: "How to raise your iq by eating gifted children", link: "https://www.google.com/search?q=how+to+raise+your+iq+by+eating+gifted+children&oq=How+to+raise+your+iq+by+eating+gifted+children&aqs=chrome.0.0l2.784j0j9&sourceid=chrome&ie=UTF-8" },
        { content: "What would a chair look like if your knees bent the other way?", link: "https://www.google.com/search?q=What+would+a+chair+look+like+if+your+knees+bent+the+other+way%3F&oq=What+would+a+chair+look+like+if+your+knees+bent+the+other+way%3F&aqs=chrome..69i57j0.734j0j9&sourceid=chrome&ie=UTF-8" },
        { content: "Are there people who are sexually attracted to pokemon?", link: "https://www.google.com/search?q=are+there+people+who+are+sexually+attracted+to+pokemon&oq=are+there+people+who+are+sexually+attracted+to+pokemon&aqs=chrome..69i57.1270j0j9&sourceid=chrome&ie=UTF-8" },
        { content: "Sometimes when i'm along i pretend i'm a carrot.", link: "https://www.google.com/search?q=Sometimes+when+i%27m+along+i+pretend+i%27m+a+carrot.&oq=Sometimes+when+i%27m+along+i+pretend+i%27m+a+carrot.&aqs=chrome..69i57j0l5.733j0j9&sourceid=chrome&ie=UTF-8" },
        { content: "Is it normal to be sexually attracted to numbers?", link: "https://www.google.com/search?q=Is+it+normal+to+be+sexually+attracted+to+numbers%3F&oq=Is+it+normal+to+be+sexually+attracted+to+numbers%3F&aqs=chrome..69i57j0l2.843j0j9&sourceid=chrome&ie=UTF-8" },
        { content: "Why is nicholas cage on the cover of a serbian biology textbook?", link: "https://www.google.com/search?q=Why+is+nicholas+cage+on+the+cover+of+a+serbian+biology+textbook%3F&oq=Why+is+nicholas+cage+on+the+cover+of+a+serbian+biology+textbook%3F&aqs=chrome..69i57.872j0j9&sourceid=chrome&ie=UTF-8" },
    ]
searches.each do |search|
    Search.create(search)
end 