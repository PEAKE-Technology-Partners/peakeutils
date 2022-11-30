# Search URLs

For use with Chrome/Firefox/etc Search Shortcuts or any tool that supports custom search by substituting `%s` in a URL.

[How to Add Any Search Engine to Your Web Browser](https://www.howtogeek.com/114176/how-to-easily-create-search-plugins-add-any-search-engine-to-your-browser/)

#### ConnectWise Manage Ticket ID Lookup
```
https://cw.peakesupport.com/v4_6_release/services/system_io/Service/fv_sr100_request.rails?service_recid=%s&companyName=peake
```

#### ConnectWise Manage Search
```
https://cw.peakesupport.com/v4_6_release/connectwise.aspx?fullscreen=false&locale=en_US#startscreen=navigationsearch&state=%7B%22p%22:%22navigationsearch%22,%20%22s%22:%7B%22p%22:%7B%22t%22:%22Tickets%22,%20%22s%22:%22%s%22%7D%7D%7D
```

#### ConnectWise Control Computer Search
```
https://help.peakesupport.com/Host#Access/All%20Machines/%s
```

Note: this is set to search in the `All Machines` category. Currently, searching across ALL categories isn't possible, so additional URLs would be needed to search in different individual categories. Luckily, we don't use the other categories a whole lot.

